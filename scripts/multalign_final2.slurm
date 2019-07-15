#!/bin/bash
#SBATCH -J mult
#SBATCH -p scavenge
#SBATCH -N 1
#SBATCH -c 20
#SBATCH --mem-per-cpu 6000
#SBATCH -t 23:00:00
#SBATCH -A eeb723
#SBATCH -o multalign_final2.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=ava.ghezelayagh@yale.edu

source activate agalma
cd ~/scratch60/agalma/data/data
export export AGALMA_DB=$PWD/agalma_postwork_quick.sqlite
export BIOLITE_RESOURCES=threads=20,memory=115G
cd ~/scratch60/agalma/scratch/first_try
agalma multalign -i homo -p 78
