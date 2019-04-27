#!/bin/bash
#SBATCH --partition=general
#SBATCH --job-name=agalma_genetrees_compgen_nohydra
#SBATCH -c 16
#SBATCH --mem-per-cpu=6G
#SBATCH --time=6-00:00:00
#SBATCH --mail-type=ALL

# Script must be run from same directory as existing sqlite database
export AGALMA_DB=$(pwd)"/compgen_homologs_nohydra.sqlite"

source activate /gpfs/ysm/project/jlm329/conda_envs/agalma

set -e


export BIOLITE_RESOURCES="threads=16,memory=6G"

ID=CompGen_nohydra

mkdir -p $ID
cd $ID

agalma homologize --id $ID
agalma multalign --id $ID
agalma genetree --id $ID
