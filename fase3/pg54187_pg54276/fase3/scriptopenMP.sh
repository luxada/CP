#!/bin/sh
#
#SBATCH --time=01:00             # allocation for 1 minute
#SBATCH --partition=cpar     # partition (queue)
#SBATCH --constraint=k20   # allocation of 40 CPUs


THREADS="8 16 40"

echo "VERSÃO OPENMP"
echo "VERSÃO OPENMP"
echo "VERSÃO OPENMP"
for thread in $THREADS; do
    echo "Numero de threads: $thread"
    export OMP_NUM_THREADS=$thread
    teste=$(time make runpar)
done
