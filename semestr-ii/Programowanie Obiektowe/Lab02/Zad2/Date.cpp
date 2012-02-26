#include <string>
#include <sstream>
#include "Date.h"

using namespace std;

const unsigned char DAYS[] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

Date::Date(){
	_day = 0;
	_month = 0;
	_year = 0;
}

Date::Date(unsigned char d, unsigned char m, int y){
	_day = d;
	_month = m;
	_year = y;
}

unsigned char Date::daysInMonth(){
	return DAYS[_month+1];
}

unsigned char Date::day(){
	return _day;
}

void Date::setDay(unsigned char d){
	if(d > 0 && d <= 31) _day = d;
	else throw "Argument error";
}

unsigned char Date::month(){
	return _month;
}

void Date::setMonth(unsigned char m){
	if(m > 0 && m <= 12) _month = m;
	else throw "Argument error";
}

int Date::year(){
	return _year;
}

void Date::setYear(int y){
	_year = y;
}

string Date::toString(){
	stringstream str;
	str << (int)day() << "." << (int)month() << "." << year();
	return str.str();
}

bool Date::operator==(Date &that){
	return (this->year() == that.year() && this->month() == that.month() && this->day() == that.day());
}

bool Date::operator>(Date &that){
	if(this->year() == that.year()){
		if(this->month() == that.month()){
			return (this->day() > that.day());
		} else {
			return (this->month() > that.month());
		}
	} else {
		return (this->year() > that.year());
	}
}

bool Date::operator<(Date &that){
	return (that > *this);
}

ostream &operator<< (ostream &out, Date &date){
	out << date.toString();
	return out;
}

void Date::addDays(unsigned int d){
	_day += d;
	while(_day > daysInMonth()){
		_day -= daysInMonth();
		addMonths(1);
	}
}

void Date::addMonths(unsigned int m){
	_month += m;
	if(_month > 12){
		addYears(_month / 12);
		_month %= 12;
	}
}

void Date::addYears(unsigned int y){
	_year += y;
}
