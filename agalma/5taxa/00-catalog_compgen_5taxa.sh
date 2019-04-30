#!/bin/bash
#SBATCH --partition=general
#SBATCH --job-name=agalma_catalog_compgen_noNA_5taxa
#SBATCH -c 1
#SBATCH --mem-per-cpu=6G
#SBATCH --time=0-02:00:00
#SBATCH --mail-type=ALL

export AGALMA_DB="./compgen_homologs_5taxa.sqlite"

source activate /gpfs/ysm/project/jlm329/conda_envs/agalma

set -e




agalma catalog insert -p ../pep/Danio_longestpep.fasta -s 'Danio rerio' --id 'Dre_a1c97d2'
agalma catalog insert -p ../pep/Drosophila_longestpep.fasta -s 'Drosophila melanogaster' --id 'Dme_05eee07'
agalma catalog insert -p ../pep/Homo_longestpep.fasta -s 'Homo sapiens' --id 'Hsa_f36e9f9'
agalma catalog insert -p ../pep/Strongylocentrotus_longestpep.fasta -s 'Strongylocentrotus purpuratus' --id 'Spu_a9c5697'
agalma catalog insert -p ../pep/Taeniopygia_longestpep.fasta -s 'Taeniopygia guttata' --id 'Tgu_290e6b7'

