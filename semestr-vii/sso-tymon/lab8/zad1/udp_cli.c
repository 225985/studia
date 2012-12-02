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
  int typ;
  char buf[BUFLEN];
} msgt;

  void blad(char *s) {
     perror(s);
     exit(1);
   }

int main(int argc, char * argv[]) {
   struct sockaddr_in adr_serw, adr_x;
   int s, i=0, slen=sizeof(adr_serw), snd, blen=sizeof(msgt),rec;
   // char buf[BUFLEN];
   msgt msg;
   fd_set socks;
   struct timeval t;
   int reply = 0;

   s=socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);
   if(s < 0) blad("socket");
   printf("Gniazdko %d utworzone\n",s);
   memset((char *) &adr_serw, 0, sizeof(adr_serw));
   adr_serw.sin_family = AF_INET;
   adr_serw.sin_port = htons(PORT);
   if (inet_aton(argv[1], &adr_serw.sin_addr)==0) {
        fprintf(stderr, "inet_aton() failed\n");
        exit(1);
   }


    while(++i) {
        printf("--> Wysyłanie %d\n", i);
        msg.typ = 1;
        sprintf(msg.buf, "Komunikat %d", i);
        snd = sendto(s, &msg, blen, 0, &adr_serw, slen);
        if(snd < 0) blad("sendto()");
        printf("    Wyslano komunikat. res: %d\n", snd);

        reply = 0;

        while(1){
          FD_ZERO(&socks);
          FD_SET(s, &socks);
          t.tv_sec = 1;
          if(select(s+1, &socks, NULL, NULL, &t)){
            rec = recvfrom(s, &msg, blen, 0, &adr_x, &slen);
            if(rec < 0) blad("recvfrom()");
            printf("    Odpowiedz: %s\n", msg.buf);
            break;
          } else {
            if(reply > 4){
              printf("!!  Brak odpowiedzi !!\n");
              break;
            } else {
              reply++;
              printf("  * oczekiwanie na odpowiedz... %d\n", reply);
            }
          }
        }

        sleep(1);
     }

   close(s);
   return 0;
}

