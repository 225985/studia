#include <iostream>

using namespace std;

clock_t benchmark(ostream &str){
	clock_t start = clock();
	for(int i=0; i<1000; i++) str << 'x';
	for(int i=0; i<1000; i++) str << i;
	for(int i=0; i<1000; i++) str << "asd";
	str << endl;
	return (clock() - start);
}

int main (int argc, char const *argv[])
{
	clock_t cout_time = benchmark(cout);
	clock_t cerr_time = benchmark(cerr);
	cout << endl << "-------------" << endl;
	cout << "cout: " << cout_time <<  endl;
	cout << "cerr: " << cerr_time <<  endl;
	return 0;
}

// Wyniki (średnie):
// cout: 517
// cerr: 6471

// Parametry środowiska
// System: Mac OS X 10.6.2
// Kompilator: gcc 4.2.1
