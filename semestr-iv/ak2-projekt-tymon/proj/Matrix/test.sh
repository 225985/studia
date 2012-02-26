#!/bin/bash

MATRIX=$1 SKIPTBB=true make clean all test-one TYPE=serial && MATRIX=$1 MPI=true make prepare run
