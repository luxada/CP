#!/bin/sh
#
#SBATCH --time=01:00             # allocation for 1 minute
#SBATCH --partition=cpar     # partition (queue)
#SBATCH --constraint=k20   # allocation of 40 CPUs
#time nvprof --metrics sm_warps_active,sm_inst_executed,sm_memory_throughput ./bin/MDpar2.exe 21 256 5000 < inputdata.txt
#nvprof --query-metrics
#nvprof --metrics sm__warps_active,sm__inst_executed,l2_utilization,sm__memory_throughput
time nvprof ./bin/MDpar2.exe 21 256 5000 < inputdata.txt