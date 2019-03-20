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


agalma import --id Aqu_7c2ad7b --seq_type aa
agalma annotate --id Aqu_7c2ad7b

agalma import --id Cte_aef8c97 --seq_type aa
agalma annotate --id Cte_aef8c97

agalma import --id Dre_61f1491 --seq_type aa
agalma annotate --id Dre_61f1491

agalma import --id Dme_3502b87 --seq_type aa
agalma annotate --id Dme_3502b87

agalma import --id Hro_793004c --seq_type aa
agalma annotate --id Hro_793004c

agalma import --id Hsa_ad50889 --seq_type aa
agalma annotate --id Hsa_ad50889

agalma import --id Hvu_ad74d42 --seq_type aa
agalma annotate --id Hvu_ad74d42

agalma import --id Lgi_e03f004 --seq_type aa
agalma annotate --id Lgi_e03f004

agalma import --id Mle_309f7a5 --seq_type aa
agalma annotate --id Mle_309f7a5

agalma import --id Nve_207e102 --seq_type aa
agalma annotate --id Nve_207e102

agalma import --id Spu_4d09ab1 --seq_type aa
agalma annotate --id Spu_4d09ab1

agalma import --id Tgu_f1d28ce --seq_type aa
agalma annotate --id Tgu_f1d28ce

agalma import --id Tad_bdc7fb0 --seq_type aa
agalma annotate --id Tad_bdc7fb0


