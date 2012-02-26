#!/usr/bin/env python
# -*- coding: UTF-8 -*-

from xml.dom import minidom
from math import ceil
import os
import subprocess
import pylab

SPEC_CPU_2000 = {
        'gcc_166': ['gcc', '166.i -o 166.o', ''],
        'bzip2': ['bzip2', 'input.source 58', ''],
        'apsi': ['apsi', 'apsi.in', ''],
        'mcf': ['mcf', 'mcf.in', ''],
        'art': ['art', '-scanfile c756hel.in -trainfile1 a10.img -trainfile2 \
            hc.img -stride 2 -startx 110 -starty 200 -endx 160 -endy   240 \
            -objects 10', ''],
        'equake': ['equake', '', 'equake.in'],
        'swim': ['swim', '', 'swim.in'],
        'mesa': ['mesa', '-frames 1000 -meshfile mesa.in -ppmfile mesa.ppm', ''],
        'crafty': ['crafty', '', 'crafty.in'],
        'eon_rushmeier': ['eon', 'chair.control.rushmeier chair.camera chair.surfaces \
            chair.rushmeier.ppm ppm pixels_out.rushmeier', ''],
        'vortex': ['vortex', 'lendian1.raw', ''],
        'sixtrack': ['sixtrack','','inp.in']
        }

# ======================================================================
# ======= Wczytanie danych z pliku konfiguracyjnego config.xml =========
# ======================================================================

xmldoc = minidom.parse('config.xml')

cnodes = xmldoc.childNodes
cmd = ""
nump = int(0)
result_dir = "wyniki/"
commands = []

for i in cnodes[0].getElementsByTagName("commands"):
    for y in i.getElementsByTagName("cmd"):
        cmd += "cpu2000/bin/"
        cmd += y.childNodes[0].toxml()
        result_dir += y.childNodes[0].toxml()
        cmd += ";"
        commands += [SPEC_CPU_2000[y.childNodes[0].toxml()]]
        nump += 1

for i in cnodes[0].getElementsByTagName("l1d"):
    l1d_from = i.getElementsByTagName("from")[0].childNodes[0].toxml()
    l1d_to = i.getElementsByTagName("to")[0].childNodes[0].toxml()

for i in cnodes[0].getElementsByTagName("l1i"):
    l1i_from = i.getElementsByTagName("from")[0].childNodes[0].toxml()
    l1i_to = i.getElementsByTagName("to")[0].childNodes[0].toxml()

for i in cnodes[0].getElementsByTagName("l2"):
    l2_from = i.getElementsByTagName("from")[0].childNodes[0].toxml()
    l2_to = i.getElementsByTagName("to")[0].childNodes[0].toxml()

for i in cnodes[0].getElementsByTagName("count"):
    num = i.getElementsByTagName("num")[0].childNodes[0].toxml()

for i in cnodes[0].getElementsByTagName("cycles"):
    max_inst = i.getElementsByTagName("num")[0].childNodes[0].toxml()

# ======================================================================
# ================= Przygotowanie komend dla m5  =======================
# ======================================================================

#=== Funkcja zwracajaca wielkosc w kb ===

def returnMemorySize(strsize):
    pos = strsize.find("kB")
    s = 0
    if pos == -1: 
        pos = strsize.find("mB")
        if pos != -1:
            s = 1

    if pos == -1:
        returnsize = int(strsize)
        returnsize = returnsize/1024
    else:
        tempstr = strsize[:-2]
        returnsize = int(tempstr)

    if s == 1:
        returnsize = returnsize*1024

    return returnsize

#=========================================

possl1d = int(0)
possl1i = int(0)
possl2 = int(0)

temp_from = returnMemorySize(l2_from)
temp_to = returnMemorySize(l2_to)

while temp_from <= temp_to:
    temp_from *= 2
    possl2 += 1

temp_from = returnMemorySize(l1d_from)
temp_to = returnMemorySize(l1d_to)

while temp_from <= temp_to:
    temp_from *= 2
    possl1d += 1

temp_from = returnMemorySize(l1i_from)
temp_to = returnMemorySize(l1i_to)

while temp_from <= temp_to:
    temp_from *= 2
    possl1i += 1

l2_from_kb = returnMemorySize(l2_from)
l1d_from_kb = returnMemorySize(l1d_from)
l1i_from_kb = returnMemorySize(l1i_from)

possibilities = possl1d*possl2*possl1i
c = int(0)

tab = []
tabl = []


options = ''
inputs = ''

numpcopy = nump

for nump, prog_options, inp in commands[:-1]:
    options += prog_options + ';'
    inputs += inp + ';'

options += commands[-1][1]
inputs += commands[-1][2]

for i in range(possl1d):
    for y in range(possl1i):
        for z in range(possl2):
            tab.append("")
            l2_curr = l2_from_kb*(2**z)
            l1d_curr = l1d_from_kb*(2**i)
            l1i_curr = l1i_from_kb*(2**y)            
            tab[c] += "time ../../build/ALPHA_SE/m5.fast --outdir="
            tab[c] += result_dir + "l2" + str(l2_curr) + "l1d" + str(l1d_curr) + "l1i" + str(l1i_curr)
            tab[c] += " --redirect-stdout --stdout-file=out.txt --redirect-stderr --stderr-file=err.txt "
            tab[c] += "../../configs/example/se_ak2.py --detailed --caches --l2cache"
            tab[c] += " -n " + str(numpcopy)
            tab[c] += " --maxinst=" + str(max_inst)
            tab[c] += " --cmd=\"" + cmd[:-1] + "\""
            tab[c] += " --options=\"" + options + "\""
            tab[c] += " --inputs=\"" + inputs + "\""
            tab[c] += " --l2_size=\""
            tab[c] += str(l2_curr)
            tab[c] += "kB\""
            tab[c] += " --l1d_size=\""
            tab[c] += str(l1d_curr)
            tab[c] += "kB\""
            tab[c] += " --l1i_size=\""
            tab[c] += str(l1i_curr)            
            tab[c] += "kB\"\n"
#======= tworzenie plikow z wynikami symulacji ========
#ipc
            tab[c] += "cat "
            tab[c] += result_dir + "l2" + str(l2_curr) + "l1d" + str(l1d_curr) + "l1i" + str(l1i_curr)
            tab[c] += "/stats.txt | awk '/cpu[0-1]\.ipc / {print $2} \' >> "
            tab[c] += result_dir + "l2" + str(l2_curr) + "l1d" + str(l1d_curr) + "l1i" + str(l1i_curr)
            tab[c] += "/ipc.txt\n"
#l2 miss rate
            tab[c] += "cat "
            tab[c] += result_dir + "l2" + str(l2_curr) + "l1d" + str(l1d_curr) + "l1i" + str(l1i_curr)
            tab[c] += "/stats.txt | awk '/l2\.overall_miss_rate::[0-1] / {print $2} \' >> "
            tab[c] += result_dir + "l2" + str(l2_curr) + "l1d" + str(l1d_curr) + "l1i" + str(l1i_curr)
            tab[c] += "/l2.txt\n"
#l1i miss rate
            tab[c] += "cat "
            tab[c] += result_dir + "l2" + str(l2_curr) + "l1d" + str(l1d_curr) + "l1i" + str(l1i_curr)
            tab[c] += "/stats.txt | awk '/cpu[0-1]\.icache.overall_miss_rate / {print $2} \' >> "
            tab[c] += result_dir + "l2" + str(l2_curr) + "l1d" + str(l1d_curr) + "l1i" + str(l1i_curr)
            tab[c] += "/l1i.txt\n"
#l1d miss rate
            tab[c] += "cat "
            tab[c] += result_dir + "l2" + str(l2_curr) + "l1d" + str(l1d_curr) + "l1i" + str(l1i_curr)
            tab[c] += "/stats.txt | awk '/cpu[0-1]\.dcache.overall_miss_rate / {print $2} \' >> "
            tab[c] += result_dir + "l2" + str(l2_curr) + "l1d" + str(l1d_curr) + "l1i" + str(l1i_curr)
            tab[c] += "/l1d.txt \n"

            c += 1

possibperfile = int(ceil(possibilities/int(num)))+1
filescount = int(ceil(possibilities/(possibperfile-1)))

c = 0

for i in range(filescount):
    tmpstr = str(i) + "simfile.sh"
    f = open(tmpstr, 'w')
    f.write("#!/bin/sh\n");
    for y in range(possibperfile):
        if c < possibilities:
            f.write(tab[c])
        c += 1
    f.close()
    os.chmod(tmpstr,0755)

for i in range(filescount):
    tmpstr = "./"+str(i) + "simfile.sh"
    os.system("xterm -e "+tmpstr+" &")

