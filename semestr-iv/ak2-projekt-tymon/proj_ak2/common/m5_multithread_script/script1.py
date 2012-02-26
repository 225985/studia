#!/usr/bin/env python
# -*- coding: UTF-8 -*-

from xml.dom import minidom
from math import ceil
import os
import subprocess
import pylab


tstr = ''
tstr += 'ls ./wyniki >katalogi.txt\n'
tstr += 'sort katalogi.txt -V >katalogisort.txt\n'
tstr += 'wc -l katalogisort.txt >linietmp.txt\n'
tstr += 'awk \'{print $1}\' \"linietmp.txt\" >linie.txt\n'
tstr += 'rm linietmp.txt\n'

f = open('sim1.sh', 'w')
f.write("#!/bin/sh\n");
f.write(tstr)
f.close()
os.chmod('sim1.sh',0755)
os.system("xterm -e ./sim1.sh &")
