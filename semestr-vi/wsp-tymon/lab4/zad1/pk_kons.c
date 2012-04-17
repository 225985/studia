#include <stdio.h>
#include <mqueue.h>
#include "common.h"

int main(int argc, char const * argv[]){
	int k, i, res;
	unsigned int prior;
	mqd_t mq;
	struct mq_attr attr;
	msg_type msg;
	
	k = atoi(argv[1]);
	
	attr.mq_msgsize = sizeof(msg);
	attr.mq_maxmsg = 1;
	attr.mq_flags = 0;
	
	mq = mq_open("/Kolejka", O_RDWR | O_CREAT, 0660, &attr);
	
	for(i=0; i<k; i++){
		res = mq_receive(mq, &msg, sizeof(msg), &prior);
		printf("mq => '%s' pnr=%d \n", msg.text, msg.pnr);
		
		sleep(1);
	}
	
	mq_close(mq);
	mq_unlink("/Kolejka");
	
	return 0;
}

