ifdef ICC
  CCFLAGS = -Wall -O3 -march=pentium4 
  CCFLAGS += -I/opt/intel/composerxe-2011.3.167/tbb/include 
  CCFLAGS += -I/opt/intel/composerxe-2011.3.167/tbb/include/tbb 
  CCFLAGS += -I/opt/intel/composerxe-2011.3.167/tbb/include/tbb/compat 
  CCFLAGS += -I/opt/intel/composerxe-2011.3.167/tbb/include/tbb/machine
  CC      = /opt/intel/bin/icc $(CCFLAGS)
  CXX     = $(CC)
else
  CCFLAGS = -Wall -O3
  CC	 = g++ $(CCFLAGS)
  CXX	 = $(CC)
endif

OBJECTS  = Matrix.o mmio.o main.o Matrix.o

all: main

.c.o:
	$(CXX) -c $< -o $@

clean:
	rm -f *.o main

main: $(OBJECTS)

test: all
	./main simple.mtx simple.mtx _result.mtx
	./test.rb simple.mtx simple.mtx _result.mtx

	./main mcca.mtx mcca.mtx _result.mtx
	./test.rb mcca.mtx mcca.mtx _result.mtx
