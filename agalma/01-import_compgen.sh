#!/bin/bash
#SBATCH --partition=general
#SBATCH --job-name=agalma_job
#SBATCH -c 16
#SBATCH --mem-per-cpu=6G
#SBATCH --time=2-00:00:00
#SBATCH --mail-type=ALL

export AGALMA_DB="./compgen_homologs.sqlite"

source activate /gpfs/ysm/project/jlm329/conda_envs/agalma


set -e


export BIOLITE_RESOURCES="threads=16,memory=6G"


agalma import --id Aqu_bc4fe9b --seq_type aa
agalma annotate --id Aqu_bc4fe9b

agalma import --id Cte_fa7f034 --seq_type aa
agalma annotate --id Cte_fa7f034

agalma import --id Dre_0e97e42 --seq_type aa
agalma annotate --id Dre_0e97e42

agalma import --id Dme_2efa5d8 --seq_type aa
agalma annotate --id Dme_2efa5d8

agalma import --id Hro_630d31e --seq_type aa
agalma annotate --id Hro_630d31e

agalma import --id Hsa_d6b56e4 --seq_type aa
agalma annotate --id Hsa_d6b56e4

agalma import --id Hvu_f68d593 --seq_type aa
agalma annotate --id Hvu_f68d593

agalma import --id Lgi_e6e5bd7 --seq_type aa
agalma annotate --id Lgi_e6e5bd7

agalma import --id Mle_53a6be2 --seq_type aa
agalma annotate --id Mle_53a6be2

agalma import --id Nve_e281b4e --seq_type aa
agalma annotate --id Nve_e281b4e

agalma import --id Spu_3bf67e6 --seq_type aa
agalma annotate --id Spu_3bf67e6

agalma import --id Tgu_58d926f --seq_type aa
agalma annotate --id Tgu_58d926f

agalma import --id Tad_cc34c2c --seq_type aa
agalma annotate --id Tad_cc34c2c


