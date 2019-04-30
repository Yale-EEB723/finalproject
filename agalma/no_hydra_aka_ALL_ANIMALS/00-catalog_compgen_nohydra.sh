#!/bin/bash
#SBATCH --partition=general
#SBATCH --job-name=agalma_catalog_compgen_noNA_nohydra
#SBATCH -c 1
#SBATCH --mem-per-cpu=6G
#SBATCH --time=0-02:00:00
#SBATCH --mail-type=ALL

export AGALMA_DB="./compgen_homologs_nohydra.sqlite"

source activate /gpfs/ysm/project/jlm329/conda_envs/agalma

set -e



agalma catalog insert -p ../pep/Amphimedon_longestpep.fasta -s 'Amphimedon queenslandica' --id 'Aqu_7c2ad7b'
agalma catalog insert -p ../pep/Capitella_longestpep.fasta -s 'Capitella telata' --id 'Cte_aef8c97'
agalma catalog insert -p ../pep/Danio_longestpep.fasta -s 'Danio rerio' --id 'Dre_a1c97d2'
agalma catalog insert -p ../pep/Drosophila_longestpep.fasta -s 'Drosophila melanogaster' --id 'Dme_05eee07'
agalma catalog insert -p ../pep/Helobdella_longestpep.fasta -s 'Helobdella robusta' --id 'Hro_793004c'
agalma catalog insert -p ../pep/Homo_longestpep.fasta -s 'Homo sapiens' --id 'Hsa_f36e9f9'
agalma catalog insert -p ../pep/Lottia_longestpep.fasta -s 'Lottia gigantea' --id 'Lgi_e03f004'
agalma catalog insert -p ../pep/Mnemiopsis_longestpep.fasta -s 'Mnemiopsis leidyi' --id 'Mle_309f7a5'
agalma catalog insert -p ../pep/Nematostella_longestpep.fasta -s 'Nematostella vectensis' --id 'Nve_2427268'
agalma catalog insert -p ../pep/Strongylocentrotus_longestpep.fasta -s 'Strongylocentrotus purpuratus' --id 'Spu_a9c5697'
agalma catalog insert -p ../pep/Taeniopygia_longestpep.fasta -s 'Taeniopygia guttata' --id 'Tgu_290e6b7'
agalma catalog insert -p ../pep/Trichoplax_longestpep.fasta -s 'Trichoplax adhaerens' --id 'Tad_bdc7fb0'
