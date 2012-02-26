#!/bin/bash


echo ">> SERIAL <<"
SKIPTBB=true make clean all
time MATRIX=$1 SKIPTBB=true make test-one TYPE=serial

echo
echo

echo ">> MPI <<"
MPI=true make prepare deploy
time MATRIX=$1 MPI=true make run_cluster

echo ">> RESULTS CHECK <<"
diff matrices/_result.mtx matrices/_mpi_result.mtx
