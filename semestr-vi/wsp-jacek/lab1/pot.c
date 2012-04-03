#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, char ** args)
{
    int i, procNum = atoi(args[1]), procSteps = atoi(args[2]);
	for (i=0; i<procSteps; i++) {
		printf("Proces %d Krok %d\n", procNum, i+1);
		sleep(1);
	}
	return procNum;
}
