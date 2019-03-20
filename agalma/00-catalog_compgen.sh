#!/bin/bash
#SBATCH --partition=general
#SBATCH --job-name=agalma_catalog_compgen_noNA
#SBATCH -c 1
#SBATCH --mem-per-cpu=6G
#SBATCH --time=0-02:00:00
#SBATCH --mail-type=ALL

export AGALMA_DB="./compgen_homologs.sqlite"

source activate /gpfs/ysm/project/jlm329/conda_envs/agalma

set -e



agalma catalog insert -p ./pep/Amphimedon_simple.fasta -s 'Amphimedon queenslandica' --id 'Aqu_7c2ad7b'
agalma catalog insert -p ./pep/Capitella_simple.fasta -s 'Capitella telata' --id 'Cte_aef8c97'
agalma catalog insert -p ./pep/Danio_simple.fasta -s 'Danio rerio' --id 'Dre_61f1491'
agalma catalog insert -p ./pep/Drosophila_simple.fasta -s 'Drosophila melanogaster' --id 'Dme_3502b87'
agalma catalog insert -p ./pep/Helobdella_simple.fasta -s 'Helobdella robusta' --id 'Hro_793004c'
agalma catalog insert -p ./pep/Homo_simple.fasta -s 'Homo sapiens' --id 'Hsa_ad50889'
agalma catalog insert -p ./pep/Hydra_simple.fasta -s 'Hydra vulgaris' --id 'Hvu_ad74d42'
agalma catalog insert -p ./pep/Lottia_simple.fasta -s 'Lottia gigantea' --id 'Lgi_e03f004'
agalma catalog insert -p ./pep/Mnemiopsis_simple.fasta -s 'Mnemiopsis leidyi' --id 'Mle_309f7a5'
agalma catalog insert -p ./pep/Nematostella_simple.fasta -s 'Nematostella vectensis' --id 'Nve_207e102'
agalma catalog insert -p ./pep/Strongylocentrotus_simple.fasta -s 'Strongylocentrotus purpuratus' --id 'Spu_4d09ab1'
agalma catalog insert -p ./pep/Taeniopygia_simple.fasta -s 'Taeniopygia guttata' --id 'Tgu_f1d28ce'
agalma catalog insert -p ./pep/Trichoplax_simple.fasta -s 'Trichoplax adhaerens' --id 'Tad_bdc7fb0'
