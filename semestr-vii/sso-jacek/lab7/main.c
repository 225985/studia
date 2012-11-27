#include <sys/socket.h>
#include <netinet/in.h>
#include <stdio.h>
#include <signal.h>

int main(int argc, char**argv)
{
   int listenfd,connfd,n, port;
   struct sockaddr_in servaddr,cliaddr;
   socklen_t clilen;
   pid_t     childpid;
   char mesg[100];

   if(argc == 1) port = 32456;
   else port = atoi(argv[1]);

   printf("Port : %d\n", port);

   // killing precesses when no needed
   signal(SIGCHLD, SIG_IGN);

   listenfd = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);

   bzero(&servaddr, sizeof(servaddr));
   servaddr.sin_family = AF_INET;
   servaddr.sin_addr.s_addr = htonl(INADDR_ANY);
   servaddr.sin_port = htons(port);
   bind(listenfd,(struct sockaddr *)&servaddr, sizeof(servaddr));

   listen(listenfd, 1024);

   for(;;)
   {
      clilen = sizeof(cliaddr);
      connfd = accept(listenfd, (struct sockaddr *)&cliaddr,&clilen);
      if ((childpid = fork()) == 0)
      {
         close (listenfd);
         for(;;)
         {
            n = recvfrom(connfd, mesg, 100, 0, (struct sockaddr *)&cliaddr, &clilen);
            if(n < 0) perror("recvfrom");
      
            sendto(connfd, "received\n", 10 ,0 , (struct sockaddr *)&cliaddr, sizeof(cliaddr));
            mesg[n] = 0;
            printf("%s",mesg);
         }
         shutdown(connfd, SHUT_RDWR);
         close(connfd);
         exit(0);
      }
      close(connfd);
   }
}