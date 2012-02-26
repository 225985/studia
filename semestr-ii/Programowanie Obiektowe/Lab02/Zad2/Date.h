#include <string>

using namespace std;

class Date {
private:
	unsigned char _day;
	unsigned char _month;
	int _year;

	unsigned char daysInMonth();

public:
	Date();
	Date(unsigned char d, unsigned char m, int y);
	unsigned char day();
	void setDay(unsigned char d);
	unsigned char month();
	void setMonth(unsigned char m);
	int year();
	void setYear(int y);
	string toString();

	void addDays(unsigned int d);
	void addMonths(unsigned int m);
	void addYears(unsigned int y);

	void subtractDays(unsigned int d);
	void subtractMonths(unsigned int m);
	void subtractYears(unsigned int y);

	bool operator==(Date &that);
	bool operator>(Date &that);
	bool operator<(Date &that);

	friend ostream &operator<<(ostream &out, Date &date);
};