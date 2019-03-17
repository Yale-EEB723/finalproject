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



agalma catalog insert -p ./pep/Amphimedon_queenslandica.Aqu1.pep.all.fasta -s 'Amphimedon queenslandica' --id 'Aqu_bc4fe9b'
agalma catalog insert -p ./pep/Capitella_teleta.Capitella_teleta_v1.0.pep.all.fasta -s 'Capitella telata' --id 'Cte_fa7f034'
agalma catalog insert -p ./pep/Danio_rerio.GRCz11.pep.all.fasta -s 'Danio rerio' --id 'Dre_0e97e42'
agalma catalog insert -p ./pep/Drosophila_melanogaster.BDGP6.pep.all.fasta -s 'Drosophila melanogaster' --id 'Dme_2efa5d8'
agalma catalog insert -p ./pep/Helobdella_robusta.Helro1.pep.all.fasta -s 'Helobdella robusta' --id 'Hro_630d31e'
agalma catalog insert -p ./pep/Homo_sapiens.GRCh38.pep.all.fasta -s 'Homo sapiens' --id 'Hsa_d6b56e4'
agalma catalog insert -p ./pep/hydra2.0_genemodels.aa.fasta -s 'Hydra vulgaris' --id 'Hvu_f68d593'
agalma catalog insert -p ./pep/Lottia_gigantea.Lotgi1.pep.all.fasta -s 'Lottia gigantea' --id 'Lgi_e6e5bd7'
agalma catalog insert -p ./pep/Mnemiopsis_leidyi.MneLei_Aug2011.pep.all.fasta -s 'Mnemiopsis leidyi' --id 'Mle_53a6be2'
agalma catalog insert -p ./pep/Nematostella_vectensis.ASM20922v1.pep.all.fasta -s 'Nematostella vectensis' --id 'Nve_e281b4e'
agalma catalog insert -p ./pep/Strongylocentrotus_purpuratus.Spur_3.1.pep.all.fasta -s 'Strongylocentrotus purpuratus' --id 'Spu_3bf67e6'
agalma catalog insert -p ./pep/Taeniopygia_guttata.taeGut3.2.4.pep.all.fasta -s 'Taeniopygia guttata' --id 'Tgu_58d926f'
agalma catalog insert -p ./pep/Trichoplax_adhaerens.ASM15027v1.pep.all.fasta -s 'Trichoplax adhaerens' --id 'Tad_cc34c2c'
