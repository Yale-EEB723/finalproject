#!/bin/bash
#SBATCH --partition=general
#SBATCH --job-name=agalma_import_compgen_5taxa
#SBATCH -c 16
#SBATCH --mem-per-cpu=6G
#SBATCH --time=2-00:00:00
#SBATCH --mail-type=ALL

export AGALMA_DB="./compgen_homologs_5taxa.sqlite"

source activate /gpfs/ysm/project/jlm329/conda_envs/agalma


set -e


export BIOLITE_RESOURCES="threads=16,memory=6G"



agalma import --id Dre_a1c97d2 --seq_type aa
agalma annotate --id Dre_a1c97d2

agalma import --id Dme_05eee07 --seq_type aa
agalma annotate --id Dme_05eee07

agalma import --id Hsa_f36e9f9 --seq_type aa
agalma annotate --id Hsa_f36e9f9

agalma import --id Spu_a9c5697 --seq_type aa
agalma annotate --id Spu_a9c5697

agalma import --id Tgu_290e6b7 --seq_type aa
agalma annotate --id Tgu_290e6b7



