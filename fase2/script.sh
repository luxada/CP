#!/bin/sh
#
#SBATCH --partition cpar     # partition (queue)
#SBATCH --cpus-per-task=8     # allocation of 40 CPUs
#SBATCH --time=05:00             # allocation for 1 minute

THREADS="8"

for thread in $THREADS; do
    echo "Numero de threads: $thread"
    export OMP_NUM_THREADS=$thread
    perf stat make runpar
done

# echo "Sequential Execution:"
# perf stat make runseq
