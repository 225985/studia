#include "common.h"

int main(int argc, char const *argv[]){
    struct sockaddr_in addr_srv, addr_cli;
    int s, i, res;
    unsigned int slen = sizeof(addr_cli);
    int mlen = sizeof(msg_t);
    msg_t msg;
    struct dirent * ent;
    DIR * dir = NULL;

    s = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);
    if(s < 0) err("socket");

    memset((char *) &addr_srv, 0, sizeof(addr_srv));
    addr_srv.sin_family = AF_INET;
    addr_srv.sin_port = htons(PORT);
    addr_srv.sin_addr.s_addr = htonl(INADDR_ANY);
    res = bind(s, (const struct sockaddr *)&addr_srv, sizeof(addr_srv));
    if(res < 0) err("bind");

    while(1){
        res = recvfrom(s, &msg, sizeof(msg_t), 0, (struct sockaddr *)&addr_cli, &slen);
        if(res < 0) err("recfrom");

        switch(msg.type){
            case OPENR:
                msg.fh = open(msg.buf, O_RDONLY);
                if(msg.fh < 0) err("OPENR");
                printf("OPENR: %s\n", msg.buf);
                break;

            case READ:
                msg.num = read(msg.fh, msg.buf, BUF_SIZE);
                if(msg.num < 0) err("READ");
                printf("READ\n");
                break;

            case OPENW:
                msg.fh = open(msg.buf, O_WRONLY|O_CREAT, 0666);
                if(msg.fh < 0) err("OPENW");
                printf("OPENW: %s ]]\n", msg.buf);
                break;

            case WRITE:
                msg.num = write(msg.fh, msg.buf, msg.num);
                if(msg.num < 0) err("WRITE");
                printf("WRITE\n");
                break;

            case OPENDIR:
                dir = opendir(msg.buf);
                if(dir == NULL) err("OPENDIR");
                printf("OPENDIR\n");
                break;

            case READDIR:
                ent = readdir(dir);
                if(ent == NULL){
                    msg.num = 0;
                } else {
                    msg.num = 1;
                    strcpy(msg.buf, ent->d_name);
                }
                printf("READDIR\n");
                break;

            case CLOSE:
                res = close(msg.fh);
                msg.fh = -1;
                if(res < 0) err("CLOSE");
                break;

            case CLOSEDIR:
                closedir(dir);
                printf("CLOSE\n");
                break;
        }
        res = sendto(s, &msg, sizeof(msg_t), 0, (struct sockaddr *)&addr_cli, slen);
        if(res < 0) err("sendto");
    }

    close(s);

    return 0;
}
