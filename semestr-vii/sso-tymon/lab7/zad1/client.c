/*
 * SSO - Lab 7.1 - client
 * Tymon Tobolski 181037
 */

#include "common.h"

#define BUF_LEN 256

int main(int argc, char const *argv[]){
  int sockfd, port, res, i;
  char const * host;
  struct sockaddr_in serv_addr;
  struct hostent *server;
  char buffer[BUF_LEN];

  // check argv
  if (argc < 3) {
   fprintf(stderr, "Usage: client HOST PORT\n");
   exit(1);
  }

  host = argv[1];
  port = atoi(argv[2]);

  printf("Connecting to %s:%d\n", host, port);

  sockfd = socket(AF_INET, SOCK_STREAM, 0);
  PERROR(sockfd, "socket");

  server = gethostbyname(host);
  PERROR(server, "gethostbyname");

  bzero((char *) &serv_addr, sizeof(serv_addr));

  serv_addr.sin_family = AF_INET;
  bcopy((char *) server->h_addr, (char *) &serv_addr.sin_addr.s_addr, server -> h_length);
  serv_addr.sin_port = htons(port);
  res = connect(sockfd, (struct sockaddr *) &serv_addr, sizeof(serv_addr));
  PERROR(res, "connect");

  for(i=0; i<5; i++){
    sprintf(buffer, "Hello %d\n", i+1);
    printf("Sending %s", buffer);
    write(sockfd, buffer, strlen(buffer));
    sleep(1);
  }

  sprintf(buffer, "quit\n");
  write(sockfd, buffer, strlen(buffer));

  close(sockfd);

  return 0;
}
