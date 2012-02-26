UNAME := $(shell uname -s)

CCFLAGS = -O2 -Wall

ifndef MATRIX
	MATRIX = mcca
endif


ifdef MPI

# MPI CONFIG

MPIDIR      = $(HOME)/intel/impi/4.0.1.007/intel64
MPICCFLAGS  = -I$(MPIDIR)/include
MPICCFLAGS += -L$(MPIDIR)/lib
MPICCFLAGS += $(CCFLAGS)

NODE_COUNT = 8

MPICC = mpiicpc $(MPICCFLAGS)

OBJECTS = Matrix/Matrix.o Matrix/mmio.o Matrix/utils.o Matrix/mpi.o

all: mpi

mpi: vars $(OBJECTS)
	$(MPICC) -o Matrix/mpi $(OBJECTS)

.cpp.o: 
	$(MPICC) -c $< -o $@

vars:
#	./setenv.sh

test:
	LD_LIBRARY_PATH="$(MPIDIR)/lib" Matrix/mpi matrices/$(MATRIX).mtx matrices/$(MATRIX).mtx

run_cluster:
	LD_LIBRARY_PATH="$(MPIDIR)/lib" mpiexec -n $(NODE_COUNT) Matrix/mpi matrices/$(MATRIX).mtx matrices/$(MATRIX).mtx

prepare:
	for i in `cat ~/mpd.hosts`; do scp matrices/$(MATRIX).mtx $$i:~/Matrix/matrices; done;

deploy: mpi
	for i in `cat ~/mpd.hosts`; do scp Matrix/mpi $$i:~/Matrix/Matrix; done;

# run: deploy cluster
#	diff matrices/_result.mtx matrices/_mpi_result.mtx

else

# ICC CONFIG

ICC_DIR = $(HOME)/intel

ICCFLAGS = $(CCFLAGS) # -march=pentium4


ifndef SKIPTBB
	ifeq ($(UNAME), Darwin)
		TBB_DIR = /opt/intel/composerxe/tbb
	endif

	ifeq ($(UNAME), Linux)
		TBB_DIR = /home/s181037/intel/tbb
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
	rm -f *.o Matrix/*.o Matrix/main Matrix/mpi matrices/_result.mtx matrices/_mpi_result.mtx
