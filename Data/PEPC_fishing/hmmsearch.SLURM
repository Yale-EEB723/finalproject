#!/bin/bash
#SBATCH --job-name=nhmmer
#SBATCH -c 20
#SBATCH -p general
#SBATCH --mem=36G
#SBATCH -t 120:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=ian.gilman@yale.edu
#SBATCH -o nhmmer.%A-%a.out
#SBATCH -e nhmmer.%A-%a.err

module load HMMER

nhmmer --cpu 20 ppc1E1.hmm ../Data/portulaca_26Nov2018_oK3Ko.fixed.fasta
