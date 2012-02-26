#include <iostream>
#include "Date.h"

using namespace std;

void main(){
	Date today(7, 3, 2010);
	cout << today << endl;
	
	Date a(4, 5, 2010);
	Date b(1, 3, 2010);
	Date c(1, 3, 2010);
	Date d(31, 12, 1990);

	cout << a << " == " << b << " # => " << (a == b) << endl;
	cout << b << " == " << c << " # => " <<(b == c) << endl;
	cout << a << " > " << b << " # => " <<(a > b) << endl;
	cout << b << " > " << c << " # => " <<(b > c) << endl;
	cout << a << " < " << b << " # => " <<(a < b) << endl;
	cout << b << " < " << c << " # => " <<(b < c) << endl;
	cout << endl;
	
	cout << a << " == " << d << " # => " << (a == d) << endl;
	cout << a << " < " << d << " # => " << (a < d) << endl;
	cout << a << " > " << d << " # => " << (a > d) << endl;
	cout << endl;

	Date x = a;
	a.addDays(30);
	cout << x << " + 30 days" << " # => " << a << endl;

	a.addMonths(3);
	cout << x << " + 3 months" << " # => " << a << endl;

	a.addYears(3);
	cout << x << " + 3 years" << " # => " << a << endl;

	system("PAUSE");
}