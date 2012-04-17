#include <stdio.h>
#include <unistd.h>


int main(int argc, char const * argv[]){
	if(fork() == 0) execl("./pk_prod", "pk_prod", "0", "5", NULL);
	if(fork() == 0) execl("./pk_prod", "pk_prod", "1", "5", NULL);
	if(fork() == 0)	execl("./pk_kons", "pk_kons", "10", NULL);

	
	sleep(10);
	
	return 0;
}
