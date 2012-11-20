/*
 * SSO - Lab 7.1 - server
 * Tymon Tobolski 181037
 */

#include "common.h"

#define BUF_LEN 256

int r,sockfd,newsockfd = -1;

void server_shutdown(){
  if(newsockfd == -1){
    printf("Server shutdown\n");

    while(wait(NULL) != -1){}

    r = shutdown(sockfd, SHUT_RDWR);
    PERROR(r, "shutdown1");
    r = close(sockfd);
    PERROR(r, "close1");

    exit(0);
  } else {
    printf("Fork shutdown\n");
    r = shutdown(newsockfd, SHUT_RDWR);
    PERROR(r, "shutdown2");
    r = close(newsockfd);
    PERROR(r, "close2");
    exit(0);
  }
}

int main(int argc, char const *argv[]){
  int port, res, n, pid;
  char * p;
  socklen_t clilen;
  char buffer[BUF_LEN];
  struct sockaddr_in serv_addr, cli_addr;
  int clients = 0;

  // check argv
  if (argc < 2) {
   fprintf(stderr, "Usage: server PORT\n");
   exit(1);
  }

  signal(SIGINT, server_shutdown);

  port = atoi(argv[1]);

  sockfd = socket(AF_INET, SOCK_STREAM, 0);
  PERROR(sockfd, "socket");

  bzero((char *) &serv_addr, sizeof(serv_addr));
  serv_addr.sin_family = AF_INET;
  serv_addr.sin_addr.s_addr = INADDR_ANY;
  serv_addr.sin_port = htons(port);

  res = bind(sockfd, (struct sockaddr *) &serv_addr, sizeof(serv_addr));
  PERROR(res, "bind");

  listen(sockfd, 1024);

  while(true){
    clilen = sizeof(cli_addr);
    newsockfd = accept(sockfd, (struct sockaddr *) &cli_addr, &clilen);
    PERROR(newsockfd, "accept");

    printf("New client connected - %d\n", cli_addr.sin_port);
    clients++;

    if((pid = fork()) == 0){
      close(sockfd);

      while(true){
        n = read(newsockfd, buffer, BUF_LEN);

        if(n <= 0){
          printf("[%d] Client disconnected - quitting...\n", cli_addr.sin_port);
          close(newsockfd);
          break;
        }

        // clear buffer
        if((p = strchr(buffer, '\n')) != NULL) *p = '\0';
        if((p = strchr(buffer, '\r')) != NULL) *p = '\0';

        printf("[%d] Got: %s\n", cli_addr.sin_port, buffer);

        if(strcmp(buffer, "quit") == 0){
          printf("[%d] Quitting...\n", cli_addr.sin_port);
          shutdown(newsockfd, SHUT_RDWR);
          close(newsockfd);
          break;
        }

      }

      exit(0);
    } else {
      newsockfd = -1;
    }
  }

  return 0;
}
