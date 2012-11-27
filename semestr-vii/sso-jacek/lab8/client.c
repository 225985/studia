	#include <netinet/in.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <unistd.h>
#include <string.h>
#include <fcntl.h>
#include <sys/stat.h>

#include "common.h"


struct sockaddr_in my_adr, addr_serv;
int s, i, slen, rec, blen;
msg_t msg;


void error(char *s) {
   perror(s);
   _exit(1);
}


void download_file(msg_t * msg, char * filename) {
  
  int st;
  sprintf(msg->buf, "%s", filename);
  msg->typ = OPENR;
  st = sendto(s, msg, blen, 0, &addr_serv, slen);
  if(st < 0) error("sending error");
  
  st=recvfrom(s, msg, blen, 0, &addr_serv, &slen);
  if (st<0) error("recvfrom()");

  do {
      msg->typ = READ;
      st = sendto(s, msg, blen, 0, &addr_serv, slen);
      if (st<0) error("sendto()");

      st = recvfrom(s, msg, blen, 0, &addr_serv, &slen);
      if (st<0) error("recvfrom()"); 
      else printf("%s\n", msg->buf);

      if(msg->ile < SIZE) break;

  } while (1);
    msg->typ = CLOSE;
    st = sendto(s, msg, blen, 0, &addr_serv, slen);
    if (st<0) error("sendto()");

}

void save_file(msg_t * msg, char * filename, char * save_filename) {
    int fh, st;
    fh = open(filename, O_RDONLY);
    sprintf(msg->buf,"%s", save_filename);
    msg->typ = OPENW;
    st = sendto(s, msg, blen, 0, &addr_serv, slen);
    if (st<0) error("sendto()");

    st=recvfrom(s,msg,blen,0,&addr_serv,&slen);
    if ( st<0 ) error("recvfrom()");

    do {
        msg->typ = WRITE;
        msg->ile = read(fh, msg->buf, SIZE);
        st=sendto(s, msg, blen, 0, &addr_serv, slen);
        if (st<0) error("sendto()");
        
        st=recvfrom(s, msg, blen, 0, &addr_serv, &slen);
        if (st<0) error("recvfrom()");

        if (msg->ile < SIZE) break;
    } while (1);
    
    msg->typ = CLOSE;
    st= sendto(s, msg, blen, 0, &addr_serv, slen);
    if (st<0) error("sendto()");
    
    close(fh);
}


int main(int argc, char * argv[]) {
  char filename[255];
  char sfilename[255];
  int which;

  slen = sizeof(addr_serv);
  blen = sizeof(msg_t);

  s = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);
  if(s < 0) error("socket");
  printf("Socket %d created \n", s);
  
  memset((char *) &addr_serv, 0, sizeof(addr_serv));
  addr_serv.sin_family = AF_INET;
  addr_serv.sin_port = htons(PORT);
  
  if (inet_aton(argv[1], &addr_serv.sin_addr)==0) {
      fprintf(stderr, "inet_aton() failed\n");
      _exit(1);
  }

  printf("1.Download file\n2.Save file\n3.Show dir\n");
  scanf("%d", &which);

  switch(which) {
    case 1 : 
      printf("Podaj nazwe pliku : \n");
      scanf("%s", filename);
      download_file(&msg, &filename);
      break;
    case 2 :
      printf("Podaj nazwe pliku : \n");
      scanf("%s", filename);
      printf("Podaj nazwe pliku na serv: \n");
      scanf("%s", sfilename);
      save_file(&msg, &filename, &sfilename);
    default : 
      break;

  }

  
  close(s);
  return 0;
}