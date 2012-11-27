#include <arpa/inet.h>
#include <netinet/in.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#define BUFLEN 80
#define KROKI 10
#define PORT 9950

 typedef struct {
  char buf[BUFLEN];
} msgt;

  void error(char *s) {
     perror(s);
     exit(1);
   }

int main(void) {
   struct sockaddr_in myaddr, client_addr;
   int s, i, slen=sizeof(client_addr),snd, rec, blen=sizeof(msgt);
   char buf[BUFLEN];
   msgt msg;
   i=0;
   gethostname(buf,sizeof(buf));


   s=socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);
   if(s < 0) error("socket");


   memset((char *) &myaddr, 0, sizeof(myaddr));
   myaddr.sin_family = AF_INET;
   myaddr.sin_port = htons(PORT);
   myaddr.sin_addr.s_addr = htonl(INADDR_ANY);
   if (bind(s, &myaddr, sizeof(myaddr))==-1) error("bind");



    while(1){
      rec = recvfrom(s, &msg, blen, 0, &client_addr, &slen);
      if(rec < 0) error("recvfrom()");
      i++;
      printf("Receive message : %s \n", msg.buf);
      sprintf(msg.buf,"Response %d", i);

      if(rand() % 8 != 0){
        printf("Send answear: %s\n", msg.buf);
        snd = sendto(s, &msg, blen, 0, &client_addr, slen);
        if(snd < 0) error("sendto()");
      } 
    }
   close(s);
   return 0;
}