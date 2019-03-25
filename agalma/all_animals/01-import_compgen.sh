#!/bin/bash
#SBATCH --partition=general
#SBATCH --job-name=agalma_import_compgen
#SBATCH -c 16
#SBATCH --mem-per-cpu=6G
#SBATCH --time=2-00:00:00
#SBATCH --mail-type=ALL

export AGALMA_DB="./compgen_homologs.sqlite"

source activate /gpfs/ysm/project/jlm329/conda_envs/agalma


set -e


export BIOLITE_RESOURCES="threads=16,memory=6G"


agalma import --id Aqu_7c2ad7b --seq_type aa
agalma annotate --id Aqu_7c2ad7b

agalma import --id Cte_aef8c97 --seq_type aa
agalma annotate --id Cte_aef8c97

agalma import --id Dre_a1c97d2 --seq_type aa
agalma annotate --id Dre_a1c97d2

agalma import --id Dme_05eee07 --seq_type aa
agalma annotate --id Dme_05eee07

agalma import --id Hro_793004c --seq_type aa
agalma annotate --id Hro_793004c

agalma import --id Hsa_f36e9f9 --seq_type aa
agalma annotate --id Hsa_f36e9f9

agalma import --id Hvu_d593031 --seq_type aa
agalma annotate --id Hvu_d593031

agalma import --id Lgi_e03f004 --seq_type aa
agalma annotate --id Lgi_e03f004

agalma import --id Mle_309f7a5 --seq_type aa
agalma annotate --id Mle_309f7a5

agalma import --id Nve_2427268 --seq_type aa
agalma annotate --id Nve_2427268

agalma import --id Spu_a9c5697 --seq_type aa
agalma annotate --id Spu_a9c5697

agalma import --id Tgu_290e6b7 --seq_type aa
agalma annotate --id Tgu_290e6b7

agalma import --id Tad_bdc7fb0 --seq_type aa
agalma annotate --id Tad_bdc7fb0


