################################################################################
# Makefile for general code snippets
#
# by André Pereira
################################################################################

SHELL = /bin/sh
BIN_NAME = MDpar2.exe

CXX = nvcc
LD  = nvcc

CXXFLAGS   = -O2 -g -std=c++11 -arch=sm_35 -Wno-deprecated-gpu-targets 

SRC_DIR = src
BIN_DIR = bin
BUILD_DIR = build
SRC = $(wildcard $(SRC_DIR)/*.cu)
OBJ = $(patsubst src/%.cu,build/%.o,$(SRC))
BIN = $(BIN_NAME)

CC = gcc
SRC2 = src/
CFLAGS = -Ofast -Wall -pg -march=native -funroll-all-loops -ftree-vectorize -g -msse4 -fmath-errno -mavx

vpath %.cu $(SRC_DIR)

################################################################################
# Rules
################################################################################

.DEFAULT_GOAL = all

$(BUILD_DIR)/%.o: %.cu
	$(CXX) -c $(CXXFLAGS) $(INCLUDES) $< -o $@ $(LIBS)

$(BIN_DIR)/$(BIN_NAME): $(OBJ)
	$(CXX) $(CXXFLAGS) $(INCLUDES) -o $@ $(OBJ) $(LIBS)

bin/MDseq.exe: $(SRC2)/MDseq.cpp
		$(CC) $(CFLAGS) $(SRC2)MDseq.cpp -lm -o bin/MDseq.exe

bin/MDpar.exe: $(SRC2)/MDpar.cpp
		$(CC) $(CFLAGS) $(SRC2)MDpar.cpp -lm -fopenmp -o bin/MDpar.exe

checkdirs:
	@mkdir -p $(BUILD_DIR)
	@mkdir -p $(BIN_DIR)

all: checkdirs $(BIN_DIR)/$(BIN_NAME) bin/MDseq.exe bin/MDpar.exe


runseq:
	./bin/MDseq.exe < inputdata.txt

runpar:
	./bin/MDpar.exe < inputdata.txt

run:
	sbatch scriptCuda.sh


clean:
	rm -f $(BUILD_DIR)/* $(BIN_DIR)/* 