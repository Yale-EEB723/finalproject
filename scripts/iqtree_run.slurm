#!/bin/bash
#SBATCH -J IQTree
#SBATCH -p scavenge
#SBATCH -N 4
#SBATCH -c 10
#SBATCH --mem 120000
#SBATCH -t 20:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=ava.ghezelayagh@yale.edu
#SBATCH -o IQ_system.out
#SBATCH -e IQ_error.out

module load IQ-TREE
iqtree -s alignment.fa -pre vertebrate_tree -m MFP -bb 1000 -nt AUTO
