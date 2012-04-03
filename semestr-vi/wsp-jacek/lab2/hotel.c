// Program hotel (C) Jedrzej Ulasiewicz 2012
#include <stdio.h>
#include <errno.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/stat.h>

#define SIZE 80
#define POKOJOW 10
#define NSIZE 30

#define MELD 	1
#define WYMELD	2
#define KTO		3
#define LISTA   4
#define ZNAJDZ  5
#define WYJSCIE 6
 
typedef struct {
	int wolny;
	int numer;
	char nazwisko[NSIZE];
	char imie[NSIZE];
} pokoj_t;
	
char bazaf[] = "hotel.bin";
pokoj_t pokoj;

int menu(void) {
  int opcja;
  printf("\n1 - meldowanie\n");
  printf("2 - wymeldowanie\n");
  printf("3 - kto w pokoju\n");
  printf("4 - lista\n");
  printf("5 - znajdz\n");
  printf("6 - wyjscie\n");
  scanf("%d",&opcja);
  return opcja;
} 

int main(int argc, char*argv[]) {
   int opt,res,stop=0;
   struct stat buf;
   res = stat(bazaf,&buf);
   if(res != 0) {
       // Plik nie istnieje - inicjacja bazy
       printf("Brak pliku bazy - tworzenie\n");
       init(bazaf,POKOJOW); 
   }    
   do {
     opt = menu();
	   switch(opt) {
  	   case MELD	 : melduj(bazaf);	break;
  	   case WYMELD   : wymeld(bazaf);	break;
       case KTO		 : info(bazaf);		break;
       case LISTA    : lista(bazaf);	break;
       case ZNAJDZ   : znajdz(bazaf);   break;
       case WYJSCIE  : _exit(0);
   	   default       :      ;
     }

   } while(stop != 1);   
   return 0;
}

