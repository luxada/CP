CC = gcc
SRC = src/
CFLAGS = -Ofast -Wall -pg -march=native -funroll-all-loops -ftree-vectorize -g -msse4 -fmath-errno -mavx

.DEFAULT_GOAL = MD.exe

MD.exe: $(SRC)/MD.cpp
	$(CC) $(CFLAGS) $(SRC)MD.cpp -lm -o MD.exe

clean:
	rm ./MD.exe

run:
	./MD.exe < inputdata.txt
