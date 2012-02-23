#include "stdafx.h"
#include <fstream>

using namespace std;

int _tmain(int argc, _TCHAR* argv[])
{
    char esc = 0x1B;
    fstream drukarka;
    drukarka.open("LPT1", ios::out);
    drukarka << esc << 'E' << endl;
    drukarka << esc << "(s1S"; //italic
    drukarka << "Przykladowy tekst italic"<< endl;
    drukarka << esc << "(s0S";//wylaczenie italic
    drukarka << esc << "(s3B"; //bold
    drukarka << "Przykladowy tekst bold"<< endl;
    drukarka << esc << "(s0B";//wylaczenie bold
    drukarka << esc << "&d0D"; //underline
    drukarka << "Przykladowy tekst underline"<< endl;
    drukarka << esc << "&d@"; //wylaczenie underline
    drukarka << esc << "&d2D"; //underline
    drukarka << "Przykladowy tekst underline"<< endl;
    drukarka << esc << "&d@"; //wylaczenie underline
    drukarka<< esc << "(s1p4101T" << "przykladowy tekst w innym foncie"<< endl;
    drukarka << esc << "*r3U";//colory rgb
    for(int i=0; i<=4; i++){
        drukarka << esc << "*v" << i << "s";
        drukarka<< esc << "(s1p15v1S" << "przykladowy tekst w innym kolorze i foncie"<< endl;
    }
    drukarka << esc << "&d2D"; //underline
    drukarka << esc << "*v2S"; //kolor
    drukarka << "Przykladowy tekst podwojny underline"<< endl;
    drukarka << esc << "&d@"; //wylaczenie underline
    for(int i=5; i<=6; i++){
        drukarka << esc << "*v" << i << "s";
        drukarka<< esc << "(s1p12v0s1B" << "przykladowy tekst w innym kolorze i foncie"<< endl;
    }
    drukarka << esc << 'E';
    drukarka.close();
    system("PAUSE");
    return 0;
}