#include <arpa/inet.h>
#include <netinet/in.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <unistd.h>
#include <dirent.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <string.h>
#include <assert.h>

#include "common.h"


void error(char *s) {
   perror(s);
   _exit(1);
}

void read_packet(msg_t * packet) {
    int result;
    struct dirent * files;
    switch (packet->typ) {
        case OPENR : // open to read
            packet->fh = open(packet->buf,O_RDONLY);
            if ( packet->fh == -1 ) error( "serv file open to read error" );
            printf("Open file %s to read \n", packet->buf);
            break;
        case OPENW : // open to write
            packet->fh = open(packet->buf, O_WRONLY|O_CREAT, S_IRWXU|S_IRWXG|S_IRWXO);
            if (packet->fh == -1) error("serv file opet to write error ");
            printf("Open file %s to save \n", packet->buf);
            break;
        case READ : // read from file
            packet->ile = read(packet->fh,packet->buf,SIZE);
            if (packet->ile == -1) error("read file error");
            printf("reading from file \n ");
            break;
        case WRITE : // write to file
            packet->ile = write(packet->fh, packet->buf, packet->ile);
            if (packet->ile == -1) error("write to file error");
            printf("writing to file \n");
            break;
        case CLOSE : //closing file
            result = close(packet->fh);
            if( result == -1 ) error("error while closing file");
            printf("closed file \n");
            break;
        default:
            printf("default\n");
            break;
    }
}

int main() {
  struct sockaddr_in my_adr, adr_cli;
  int s, i, slen = sizeof(adr_cli), rec, blen = sizeof(msg_t);
  msg_t msg;

  s = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);
  
  if(s < 0) error("socket");
  
  printf("Socket %d created \n", s);
  
  memset((char *) &my_adr, 0, sizeof(my_adr));
  my_adr.sin_family = AF_INET;
  my_adr.sin_port = htons(PORT);
  my_adr.sin_addr.s_addr = htonl(INADDR_ANY);
  
  if (bind(s, &my_adr, sizeof(my_adr)) == -1)
      error("bind");

  while (1) {
      rec = recvfrom(s, &msg, blen, 0, &adr_cli, &slen);
      if (rec<0) error("error while receiving");
      read_packet(&msg);
      rec = sendto(s, &msg, blen, 0, &adr_cli, slen);
      if (rec<0) error("error while sending");
  }

  close(s);
  return 0;
}
