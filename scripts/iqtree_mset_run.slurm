#!/bin/bash
#SBATCH -J IQTree_memset
#SBATCH -p scavenge
#SBATCH -N 4
#SBATCH -c 10
#SBATCH --mem 120000
#SBATCH -t 20:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=ava.ghezelayagh@yale.edu
#SBATCH -o IQ_system_memset.out
#SBATCH -e IQ_error_memset.out

module load IQ-TREE
iqtree -s alignment.fa -pre vertebrate -mset Dayhoff,DCMut,JTT,JTTDCMut,LG,Poisson,PMB,VT,WAG -bb 1000 -nt AUTO
