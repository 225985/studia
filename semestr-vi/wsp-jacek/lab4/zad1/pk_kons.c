#include <stdio.h>
#include <mqueue.h>
#define size 100

struct{
    int typ;
    char text[size];
}kom_t;

void main(int argc, char *argv[]) {
	
    int kom, res,i;
    mqd_t mq;
    unsigned int prior;

    struct mq_attr attr;

    mq=mq_open("/Kolejka", O_RDWR, 0660, NULL );

    for(i=0;i<atoi(argv[1]);i++)
    {
        mq_receive(mq,&kom_t,sizeof(kom_t),&prior);
        printf("%s Krok: %d\n",kom_t.text, i+1);
    }
   mq_close(mq);

}

