#!/bin/sh
#
#SBATCH --time=01:00             # allocation for 1 minute
#SBATCH --partition=cpar     # partition (queue)
#SBATCH --constraint=k20   # allocation of 40 CPUs

num_blocks=(21 11 6)
num_threads_per_block=(256 512 1024)
n=(1000 2160 5000)
# time nvprof ./bin/MDpar2.exe 16 313 5000 < inputdata.txt
matrix_file="matrix_output.txt"
echo "3ª Fase" >> "$matrix_file"

echo "VERSÃO CUDA"
echo
for ((i=0; i<3; i++)); do
    echo "N -> ${n[$i]}"
    current_n=${n[$i]}
    for((j=0; j<3;j++)) do 
        current_num_blocks=${num_blocks[$j]}
        current_num_threads_per_block=${num_threads_per_block[$j]}
        echo "num_blocks -> ${current_num_blocks}"
        echo "num_threads_per_block -> ${current_num_threads_per_block}"
        echo
        teste=$(time nvprof ./bin/MDpar2.exe "$current_num_threads_per_block" "$current_num_blocks" "$current_n" < inputdata.txt 2>&1)
        echo
    done
    echo
done



