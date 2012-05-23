#include "common.h"

int main(int argc, char const *argv[]){
    msg_t msg;
    struct sockaddr_in addr_cli, addr_srv;
    int s, i, res, fh;
    unsigned int slen = sizeof(addr_srv);
    char cmd[256];
    char cmd_aux[256];

    s = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);
    if(s < 0) err("socket");

    memset((char *) &addr_srv, 0, sizeof(addr_srv));
    addr_srv.sin_family = AF_INET;
    addr_srv.sin_port = htons(PORT);
    res = inet_aton(argv[1], &addr_srv.sin_addr);
    if(res == 0){
        err("inet_aton");
        exit(-1);
    }

    while(1){
        printf("> ");
        scanf("%s", &cmd);
        if(strcmp(cmd, "get") == 0){
            scanf("%s", &cmd);
            printf("* downloading %s\n", cmd);
            // download
            strcpy(msg.buf, cmd);
            msg.type = OPENR;
            res = sendto(s, &msg, sizeof(msg_t), 0, (struct sockaddr *)&addr_srv, sizeof(addr_srv));
            if(res < 0) err("sendto");

            res = recvfrom(s, &msg, sizeof(msg_t), 0, (struct sockaddr *)&addr_srv, &slen);
            if(res < 0) err("recvfrom");

            while(1) {
                msg.type = READ;
                res = sendto(s, &msg, sizeof(msg_t), 0, (struct sockaddr *)&addr_srv, sizeof(addr_srv));
                if(res < 0) err("sendto");

                res = recvfrom(s, &msg, sizeof(msg_t), 0, (struct sockaddr *)&addr_srv, &slen);
                if(res < 0) err("recvfrom");
                else {
                    for(i=0; i<msg.num; i++) printf("%c", msg.buf[i]);
                }

                if(msg.num < BUF_SIZE) break;
            }

            printf("\n\n");

            msg.type = CLOSE;

            res = sendto(s, &msg, sizeof(msg_t), 0, (struct sockaddr *)&addr_srv, sizeof(addr_srv));
            if(res < 0) err("sendto");

            res = recvfrom(s, &msg, sizeof(msg_t), 0, (struct sockaddr *)&addr_srv, &slen);
            if(res < 0) err("recvfrom");

            printf("* finished downloading\n");

        } else if(strcmp(cmd, "put") == 0){
            scanf("%s", &cmd);
            scanf("%s", &cmd_aux);
            printf("* uploading %s to %s\n", cmd, cmd_aux);

            // upload
            fh = open(cmd, O_RDONLY);
            strcpy(msg.buf, cmd_aux);
            msg.type = OPENW;

            res = sendto(s, &msg, sizeof(msg_t), 0, (struct sockaddr *)&addr_srv, sizeof(addr_srv));
            if(res < 0) err("sendto");

            res = recvfrom(s, &msg, sizeof(msg_t), 0, (struct sockaddr *)&addr_srv, &slen);
            if(res < 0) err("recvfrom");

            while(1){
                printf(".");
                msg.type = WRITE;
                msg.num = read(fh, msg.buf, BUF_SIZE);

                res = sendto(s, &msg, sizeof(msg_t), 0, (struct sockaddr *)&addr_srv, sizeof(addr_srv));
                if(res < 0) err("sendto");

                res = recvfrom(s, &msg, sizeof(msg_t), 0, (struct sockaddr *)&addr_srv, &slen);
                if(res < 0) err("recvfrom");

                if(msg.num < BUF_SIZE) break;
            }

            printf("\n");

            msg.type = CLOSE;

            res = sendto(s, &msg, sizeof(msg_t), 0, (struct sockaddr *)&addr_srv, sizeof(addr_srv));
            if(res < 0) err("sendto");

            res = recvfrom(s, &msg, sizeof(msg_t), 0, (struct sockaddr *)&addr_srv, &slen);
            if(res < 0) err("recvfrom");

            printf("* finished uploading\n");
        } else if(strcmp(cmd, "ls") == 0){
            scanf("%s", &cmd);
            printf("* listing %s\n", cmd);


            strcpy(msg.buf, cmd);
            msg.type = OPENDIR;
            res = sendto(s, &msg, sizeof(msg_t), 0, (struct sockaddr *)&addr_srv, sizeof(addr_srv));
            if(res < 0) err("sendto");

            res = recvfrom(s, &msg, sizeof(msg_t), 0, (struct sockaddr *)&addr_srv, &slen);
            if(res < 0) err("recvfrom");

            while(1) {
                msg.type = READDIR;
                res = sendto(s, &msg, sizeof(msg_t), 0, (struct sockaddr *)&addr_srv, sizeof(addr_srv));
                if(res < 0) err("sendto");

                res = recvfrom(s, &msg, sizeof(msg_t), 0, (struct sockaddr *)&addr_srv, &slen);
                if(res < 0) err("recvfrom");
                else printf("- %s\n", msg.buf);

                if(msg.num < 1) break;
            }

            printf("\n");

            msg.type = CLOSEDIR;

            res = sendto(s, &msg, sizeof(msg_t), 0, (struct sockaddr *)&addr_srv, sizeof(addr_srv));
            if(res < 0) err("sendto");

            res = recvfrom(s, &msg, sizeof(msg_t), 0, (struct sockaddr *)&addr_srv, &slen);
            if(res < 0) err("recvfrom");

            printf("* finished listing\n");
        } else if(strcmp(cmd, "exit") == 0){
            printf("\n");
            break;
        } else {
            printf("Commands:\n");
            printf("> get REMOTE_FILE\n");
            printf("> put LOCAL_FILE REMOTE_FILE\n");
            printf("> ls REMOTE_DIR\n");
            printf("> exit\n");
        }
    }

    close(s);

    return 0;
}
