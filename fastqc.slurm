#!/bin/bash
#SBATCH -J fastq
#SBATCH -p general
#SBATCH -N 1
#SBATCH -c 16
#SBATCH --mem-per-cpu 6000
#SBATCH -t 720:00:00
#SBATCH -A eeb723
#SBATCH --mail-type=ALL
#SBATCH --mail-user=ava.ghezelayagh@yale.edu

source activate agalma

agalma qc -i SRR5234495
agalma qc -i SRR5124573
agalma qc -i SRR5124576
agalma qc -i SRR5124582
agalma qc -i SRR5312374
agalma qc -i SRR5312385
agalma qc -i SRR5051324
agalma qc -i SRR4448928
agalma qc -i SRR5226597
agalma qc -i SRR3213614
agalma qc -i SRR3213612
agalma qc -i GCA000165045.2
agalma qc -i GCA004367855.1
agalma qc -i GCA900186335.2
agalma qc -i GCA000148955.1
