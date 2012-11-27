#include <netinet/in.h>
#include <stdio.h>
#include <sys/types.h>
#include <stdlib.h>
#include <sys/socket.h>
#include <unistd.h>
#include <string.h>
#include <arpa/inet.h>

#define BUFLEN 80
#define KROKI 10
#define PORT 9950
#define SRV_IP "127.0.0.1"

typedef struct {
  char buf[BUFLEN];
} msg_t;

void error(char *s) {
 perror(s);
 exit(1);
}	

int main(int argc, char * argv[]) {
   struct sockaddr_in server_addr, adr_x;
   int s, i=0, slen=sizeof(server_addr), snd, blen=sizeof(msg_t),rec;
   // char buf[BUFLEN];
   msg_t msg;
   fd_set socks;
   struct timeval t;
   int reply = 0;

   s=socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);
   if(s < 0) error("socket");

   memset((char *) &server_addr, 0, sizeof(server_addr));
   server_addr.sin_family = AF_INET;
   server_addr.sin_port = htons(PORT);
   
   if (inet_aton(argv[1], &server_addr.sin_addr)==0) {
        error("inet_aton");
        exit(1);
   }


    while(++i) {
        printf("Send %d\n", i);
        sprintf(msg.buf, "Message %d", i);
        snd = sendto(s, &msg, blen, 0, &server_addr, slen);
        if(snd < 0) error("sendto()");
        

        reply = 0;

        while(1){
          FD_ZERO(&socks);
          FD_SET(s, &socks);
          t.tv_sec = 1;
          if(select(s+1, &socks, NULL, NULL, &t)){
            rec = recvfrom(s, &msg, blen, 0, &adr_x, &slen);
            if(rec < 0) error("recvfrom()");
            printf("Response: %s\n", msg.buf);
            break;
          } else {
            if(reply > 2){
              printf("No response\n");
              break;
            } else {
              reply++;
              printf("wait for response %d\n", reply);
            }
          }
        }

        sleep(1);
     }

   close(s);
   return 0;
}