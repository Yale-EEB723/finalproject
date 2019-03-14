#!/bin/bash
#SBATCH --partition=week
#SBATCH --job-name=agalma_job
#SBATCH -c 16
#SBATCH --mem-per-cpu=6G
#SBATCH --time=2-00:00:00
#SBATCH --mail-type=ALL

export AGALMA_DB="./homologs.sqlite"

source activate agalma


set -e


export BIOLITE_RESOURCES="threads=16,memory=6G"


agalma import --id Amphimedon_a044ef3 --seq_type aa
agalma annotate --id Amphimedon_a044ef3

agalma import --id Salpingoeca_79a80c9
agalma translate --id Salpingoeca_79a80c9

agalma import --id Capsaspora_03ba031
agalma translate --id Capsaspora_03ba031

agalma import --id Creolimax_9fec24f
agalma translate --id Creolimax_9fec24f

agalma import --id Mnemiopsis_ad40ba8 --seq_type aa
agalma annotate --id Mnemiopsis_ad40ba8

agalma import --id Nematostella_3f17ce6 --seq_type aa
agalma annotate --id Nematostella_3f17ce6

agalma import --id Trichoplax_b1e0576 --seq_type aa
agalma annotate --id Trichoplax_b1e0576

agalma import --id Schmidtea_b64b58d
agalma translate --id Schmidtea_b64b58d
