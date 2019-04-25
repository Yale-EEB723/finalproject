# --- --- --- --- --- --- --- --- --- --- --- ---
# [1] SUMAC - Build supermatrix
# --- --- --- --- --- --- --- --- --- --- --- ---


#!/bin/bash
#SBATCH --mail-type=ALL
#SBATCH --mail-user=diego.ellissoto@yale.edu
#SBATCH --output doPar-%j.out
#SBATCH -t 24:00:00
#SBATCH --mem-per-cpu=30G
 module load Python/2.7.11-foss-2016a
 module load Python/miniconda
conda create --name Python2 python=2.7
source activate Python2
python -m sumac -d MAM -i Myotis -o Murina -minl 750 --cores 4 -g /de293@farnam.hpc.yale.edu:/home/de293/project/EEB723/Final_project/TLR_genes/TLR_gene_9_myotis_lucifugus.FASTA -de
