#!/bin/bash

a="10
100
200
300
400
500
600
700
800
900
1000
2000
3000
4000
5000
6000
7000
8000
9000
10000
20000
30000
40000
50000
60000
70000
80000
90000
100000"

for i in $a; do
  for j in {1..5}; do
    echo $i $j;
    N=$i /home/teamon/gat/gatling-charts-highcharts-1.3.4/bin/gatling.sh -s org.scalajars.stress.ProjectSearchSimulation -on "scalajars.stress-$i-$j" -rf /home/teamon/sjst/results
  done;
done;


