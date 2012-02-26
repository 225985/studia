UNAME := $(shell uname -s)

ifndef MATRIX
	MATRIX = mcca
endif


ifdef MPI

# MPI CONFIG

MPIDIR      = /opt/intel/impi/4.0.1.007/intel64
MPICCFLAGS  = -I$(MPIDIR)/include
MPICCFLAGS += -L$(MPIDIR)/lib
MPICCFLAGS += -O0

MPICC = mpiicpc $(MPICCFLAGS)

OBJECTS = Matrix/Matrix.o Matrix/mmio.o Matrix/utils.o Matrix/mpi.o

all: mpi

mpi: vars $(OBJECTS)
	$(MPICC) -o Matrix/mpi $(OBJECTS)

.cpp.o: 
	$(MPICC) -c $< -o $@

vars:
	./setenv.sh

test:
	LD_LIBRARY_PATH="$(MPIDIR)/lib" Matrix/mpi matrices/$(MATRIX).mtx matrices/$(MATRIX).mtx

cluster:
	LD_LIBRARY_PATH="$(MPIDIR)/lib" time mpiexec -n 6 Matrix/mpi matrices/$(MATRIX).mtx matrices/$(MATRIX).mtx

prepare:
	for i in `cat ~/mpd.hosts`; do scp matrices/$(MATRIX).mtx $$i:~/Matrix/matrices; done;

deploy: mpi
	for i in `cat ~/mpd.hosts`; do scp Matrix/mpi $$i:~/Matrix/Matrix; done;

run: deploy cluster
	diff matrices/_result.mtx matrices/_mpi_result.mtx

else

# ICC CONFIG

ICC_DIR = /opt/intel

ICCFLAGS = -Wall -O3 # -march=pentium4


ifndef SKIPTBB
	ifeq ($(UNAME), Darwin)
		TBB_DIR = /opt/intel/composerxe/tbb
	endif

	ifeq ($(UNAME), Linux)
		TBB_DIR = /home/susers/s181037/intel/tbb
	endif

	ICCFLAGS += -ltbb -ltbbmalloc
	ICCFLAGS += -I$(TBB_DIR)/include
	ICCFLAGS += -I$(TBB_DIR)/include/tbb
	ICCFLAGS += -I$(TBB_DIR)/include/tbb/compat
	ICCFLAGS += -I$(TBB_DIR)/include/tbb/machine
	ICCFLAGS += -L$(TBB_DIR)/lib
	ICCFLAGS += -L$(TBB_DIR)/bin
else
	ICCFLAGS += -DSKIPTBB=$(SKIPTBB)
endif

ifeq ($(UNAME), Darwin)
	ICCFLAGS += -mmacosx-version-min=10.6
else
	ICCFLAGS += -lrt
endif

#ICCFLAGS += -arch x86_64

ICC      = $(ICC_DIR)/bin/icc  $(ICCFLAGS)
ICPC     = $(ICC_DIR)/bin/icpc $(ICCFLAGS)

OBJECTS  = Matrix/Matrix.o Matrix/mmio.o Matrix/utils.o Matrix/main.o Matrix/multiply_serial.o 
ifndef SKIPTBB
	OBJECTS += Matrix/multiply_thread.o
endif

all: main

.cpp.o: 
	$(ICC) -c $< -o $@


main: vars $(OBJECTS)
	$(ICPC) -o Matrix/main  $(OBJECTS)

vars:
#	. $(ICC_DIR)/bin/iccvars.sh intel64

test:
#	export LD_LIBRARY_PATH="$(TBB_DIR)/lib"
	for i in `ls matrices`; do echo "$$i `head -n 2 matrices/$$i | grep -v MatrixMarket`"; LD_LIBRARY_PATH="$(TBB_DIR)/lib"  Matrix/main matrices/$$i matrices/$$i /tmp/_result.mtx; done;

test-one:
	LD_LIBRARY_PATH="$(TBB_DIR)/lib"  Matrix/main $(TYPE) matrices/$(MATRIX).mtx matrices/$(MATRIX).mtx matrices/_result.mtx

endif

clean:
	rm -f *.o main mpi matrices/_result.mtx matrices/_mpi_result.mtx
