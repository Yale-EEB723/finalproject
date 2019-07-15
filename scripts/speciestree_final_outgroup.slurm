#!/bin/bash
#SBATCH -J speciestree
#SBATCH -p scavenge
#SBATCH -N 1
#SBATCH -c 20
#SBATCH --mem-per-cpu 6000
#SBATCH -t 23:00:00
#SBATCH -A eeb723
#SBATCH -o speciestree_final_outgroup.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=ava.ghezelayagh@yale.edu

source activate agalma
export BIOLITE_RESOURCES=threads=20,memory=116G
cd ~/scratch60/agalma/data/data
export AGALMA_DB=$PWD/agalma_postwork_quick.sqlite
cd ~/scratch60/agalma/scratch/first_try
agalma speciestree -i homo --newrun -p 83 -b 100 -g Polycarpa_mamillaris
