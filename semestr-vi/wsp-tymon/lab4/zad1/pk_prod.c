#include <stdio.h>
#include <mqueue.h>
#include "common.h"

int main(int argc, char const * argv[]){
	int n,k,i;
	int res;
	mqd_t mq;
	struct mq_attr attr;
	msg_type msg;
	
	n = atoi(argv[1]);
	k = atoi(argv[2]);
	
	attr.mq_msgsize = sizeof(msg);
	attr.mq_maxmsg = 1;
	attr.mq_flags = 0;
	
	mq = mq_open("/Kolejka", O_RDWR | O_CREAT, 0660, &attr);
	
	for(i=0; i<k; i++){
		msg.pnr = n;
		msg.type = PROD;
		sprintf(msg.text, "Producent %d krok %d", n, i);
	
		res = mq_send(mq, &msg, sizeof(msg), 10);
		printf("mq <= %d  pnr=%d \n", i, n);
		
		sleep(1);
	}
	

	mq_close(mq);
	mq_unlink("/Kolejka");
	
	return 0;
}

