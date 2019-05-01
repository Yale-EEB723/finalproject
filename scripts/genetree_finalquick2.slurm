#!/bin/bash
#SBATCH -J quick_genetree_scavenge
#SBATCH -p scavenge
#SBATCH -N 1
#SBATCH -c 20
#SBATCH --mem-per-cpu 6000
#SBATCH -t 23:00:00
#SBATCH -A eeb723
#SBATCH -o genetreefinalquick2.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=ava.ghezelayagh@yale.edu

source activate agalma
export BIOLITE_RESOURCES=threads=20,memory=116G
cd ~/scratch60/agalma/data/data
export AGALMA_DB=$PWD/agalma_postwork_quick.sqlite
cd ~/scratch60/agalma/scratch/first_try
agalma genetree -i homo -p 79  -b 10
