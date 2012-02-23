#include "stdafx.h"
#include <fstream>

using namespace std;

int _tmain(int argc, _TCHAR* argv[])
{
    fstream drukarka;
    drukarka.open("LPT1", ios::out);
    drukarka.close();
    system("PAUSE");
    return 0;
}