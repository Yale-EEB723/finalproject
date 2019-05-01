#!/bin/bash
#SBATCH --job-name=transdecoder_Cras
#SBATCH -c 10
#SBATCH -p general
#SBATCH --mem-per-cpu=6000
#SBATCH -t 72:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=chantal.parker@yale.edu
#SBATCH -o transdecoder.out
#SBATCH -e transdecorder.err

python /gpfs/ysm/home/cep4/bin/master/transdecoder_wrapper.py /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/transdecoder/Crastrospinosus/Crastro_Trinity-GG.fasta 10 non-stranded .

