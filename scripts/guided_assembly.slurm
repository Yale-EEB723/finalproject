#!/bin/bash
#SBATCH --job-name=trinity_guided_assembly1
#SBATCH -c 10
#SBATCH -p general
#SBATCH --mem-per-cpu=6000
#SBATCH -t 72:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=chantal.parker@yale.edu
#SBATCH -o trinity_guided1.out
#SBATCH -e trinity_guided1.err

source activate salmon
module load SAMtools
module load Jellyfish
module load Trinity

Trinity --genome_guided_bam /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/processed/filtered_reads/ERR793598.bam --genome_guided_max_intron 10000 --max_memory 110G --CPU 10
