#!/usr/bin/env python
# -*- coding: UTF-8 -*-

from xml.dom import minidom
from math import ceil
import os
import subprocess
import pylab



tab = []
x=int(0)
v=int(1)
lines = int(pylab.loadtxt('linie.txt'))
for t in range(lines):
    tab.append("")
    tab[x] += "tekst=`awk NR==" + str(v) + " katalogisort.txt`\n"
    tab[x] += "cat wyniki/$tekst/ipc.txt | awk 'NR==\"1\"' >> ./wyniki/ipc.txt \n"
    tab[x] += "cat wyniki/$tekst/ipc.txt | awk 'NR==\"2\"' >> ./wyniki/ipc.txt \n"
    tab[x] += "cat wyniki/$tekst/l2.txt  | awk 'NR==\"1\"' >> ./wyniki/l2.txt \n"
    tab[x] += "cat wyniki/$tekst/l2.txt  | awk 'NR==\"2\"' >> ./wyniki/l2.txt \n"   
    tab[x] += "cat wyniki/$tekst/l1i.txt | awk 'NR==\"1\"' >> ./wyniki/l1i.txt \n"
    tab[x] += "cat wyniki/$tekst/l1i.txt | awk 'NR==\"2\"' >> ./wyniki/l1i.txt \n"
    tab[x] += "cat wyniki/$tekst/l1d.txt | awk 'NR==\"1\"' >> ./wyniki/l1d.txt \n"
    tab[x] += "cat wyniki/$tekst/l1d.txt | awk 'NR==\"2\"' >> ./wyniki/l1d.txt \n"
    x += 1
    v += 1
    
x=0
f = open('sim2.sh', 'w')
f.write("#!/bin/sh\n");
for o in range(lines):
    f.write(tab[o])
    o += 1
f.close()
os.chmod('sim2.sh',0755)
os.system("xterm -e ./sim2.sh &")

