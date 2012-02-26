#include <iostream>

using namespace std;

void f3a(int a){ a++; }
void f3b(int &b){ b++; }
void f3c(int * c){ (*c)++; }

int f4_rozmiar(int * T){
	return sizeof(T)/sizeof(int);
}


int func(const char * p){
	
}

double x(){
	return 0.1;
}

// double (*fun())(); // 10.

// double (*tab[])[] (*tab[11])(const char *);

// (double (*tab())[]);


double (*(*dupa())[])[];


double (*(*(*T[11])(char * const))[])[];



// double ((*fptr)())[];
// ((*tab[11])(const char *))

int tab[5];

int main (int argc, char const *argv[])
{
	// 1.
	//void qsort(void * base, size_t num, size_t size, int (* comparator)(const void *, const void *));
	// int comp(const void * a, const void * b){
	// 	return (*(int*)a - *(int*)b);
	// }
	
	// 2.
	// char * wskCh = "Tekst";
	// cout << (void *)wskCh << endl;
	
	// 3.
	// int x = 4;
	// cout << x << endl;
	// f3a(x);
	// cout << x << endl;
	// f3b(x);
	// cout << x << endl;
	// f3c(&x);
	// cout << x << endl;
	
	// 4.
	// 	int T[10];
	// cout << sizeof(T)/sizeof(int) << endl;
	// // cout << f4_rozmiar(T) << endl;
	// 
	// // 5.
	// 	double tab[5] = {1.1, 2.2, 3.3, 4.4, 5.5};
	// cout << "double tab[5] = {1.1, 2.2, 3.3, 4.4, 5.5};" << endl;
	// tab+1 << " - adres drugiego elementu" << endl;
	// tab+1 << " - drugi element tab plus jeden" << endl;
	// &tab+1 << " - adres wskaznika na tab[5] plus jeden, czyli 40 bajtów dalej" << endl;
	// *(tab+1) << " - drugi element tab" << endl;
	// tab[0]+1  pierwszy element plus jeden
	// &tab[0]+1 adres drugiego elementu
	// tab++  błąd kompilacji
	// 
	// double * a = tab;
	// a++;
	// cout << *a << endl;
	// tab++ sie nie kompiluje, po przepisaniu do wskaznika double * a i operacji a++, a wskazuje na drugi element tab
	
	
	// // 6.
	// double tab[5] = {1.1, 2.2, 3.3, 4.4, 5.5};
	// double *w = tab;
	// w+1; // adres drugiego elementu tablicy tab
	// w+=1; // przesuniecie wskaznika o jedna pozyjce (na nastepny element tablicy)
	// *w+1; // pobranie elementu wskazanego przez w  i dodanie do niego 1
	// &w+1; // adres nastepnej komorki pamieci po adresie w
	// *(w+1); // drugi element tablicy
	// w[0] // pierwszy element tablicy plus jeden
	// &w[0] + 1; // adres drugiego elementu tablicy
	// w++; // przesuniecie wskaznika o jedna pozycje (na nastepny element tablicy)
	// *(&w[2]-1); // drugi element tablicy
	// 
	// // 7.
	// int a[] = {1,6};
	// int * pa = &a[0];
	// int * pb = &a[1];
	// pa > pb //=> false
	// pa < pb //=> false
	// 
	// Porownanie wskaznikow ma sens jedynie (prawie jedynie) dla wskaznikow tej samej tablicy
	// Jezeli pa < pb to znaczy ze pa wskazuje na element o mniejszym indeksie niz pb
	// Jezeli pa == pb to znaczy ze oba wskazniki wskazuja na te sama zmienna (ten sam adres w pamieci)
	
	// Dodawanie dwoch wskaznikow do siebie nie ma wiekszego sensu. 
	// Odejmowanie pozwala okreslic jak "daleko od siebie" sa umieszczone elementy wskazywane przez wskazniki np pb-pa = 1 (pb wskazuje na jeden element dalej niz pa)
	// cout << pa << endl;
	// cout << pb << endl;
	// cout << (pb - pa) << endl;
	// 
	// // Dodawanie/odejmowanie liczby calkowitej do wskaznika przesuwa go w pamieci o liczba*rozmiar, np dla wskaznika double*p; p+1 przesunie o 8, dla char*p; p+1 przesunie o 2
	// 
	// // 8.
	// int *p;
	// p = &p; // blad
	// 
	// // Nie mozna ustawic wskaznika na samego siebie - blad kompilacji
	// // wskaznik jest typu np int* a adres wskaznika int* jest typu int**
	// 
	// cout << (pa < pb) << endl;
	// 
	// int (* foo)(const char *);
	// 
	// foo = func;
	// 
	// double * T[11];
	// 
	// 
	// short *** p11;
	
	return 0;
}

