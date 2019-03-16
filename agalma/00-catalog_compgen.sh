#!/bin/bash
#SBATCH --partition=day
#SBATCH --job-name=agalma_catalog_compgen
#SBATCH -c 1
#SBATCH --mem-per-cpu=6G
#SBATCH --time=0-02:00:00
#SBATCH --mail-type=ALL

export AGALMA_DB="./compgen_homologs.sqlite"

source activate agalma

set -e



agalma catalog insert -p ./pep/Amphimedon_queenslandica.Aqu1.pep.all.fasta -s 'Amphimedon queenslandica' -n 'NA' -t 'NA' -q 'NA' --note 'NA' -b 'NA' --sample_prep 'NA' --id 'Aqu_bc4fe9b'
agalma catalog insert -p ./pep/Capitella_teleta.Capitella_teleta_v1.0.pep.all.fasta -s 'Capitella telata' -n 'NA' -t 'NA' -q 'NA' --note 'NA' -b 'NA' --sample_prep 'NA' --id 'Cte_fa7f034'
agalma catalog insert -p ./pep/Danio_rerio.GRCz11.pep.all.fasta -s 'Danio rerio' -n 'NA' -t 'NA' -q 'NA' --note 'NA' -b 'NA' --sample_prep 'NA' --id 'Dre_0e97e42'
agalma catalog insert -p ./pep/Drosophila_melanogaster.BDGP6.pep.all.fasta -s 'Drosophila melanogaster' -n 'NA' -t 'NA' -q 'NA' --note 'NA' -b 'NA' --sample_prep 'NA' --id 'Dme_2efa5d8'
agalma catalog insert -p ./pep/Helobdella_robusta.Helro1.pep.all.fasta -s 'Helobdella robusta' -n 'NA' -t 'NA' -q 'NA' --note 'NA' -b 'NA' --sample_prep 'NA' --id 'Hro_630d31e'
agalma catalog insert -p ./pep/Homo_sapiens.GRCh38.pep.all.fasta -s 'Homo sapiens' -n 'NA' -t 'NA' -q 'NA' --note 'NA' -b 'NA' --sample_prep 'NA' --id 'Hsa_d6b56e4'
agalma catalog insert -p ./pep/hydra2.0_genemodels.aa.fasta -s 'Hydra vulgaris' -n 'NA' -t 'NA' -q 'NA' --note 'NA' -b 'NA' --sample_prep 'NA' --id 'Hvu_f68d593'
agalma catalog insert -p ./pep/Lottia_gigantea.Lotgi1.pep.all.fasta -s 'Lottia gigantea' -n 'NA' -t 'NA' -q 'NA' --note 'NA' -b 'NA' --sample_prep 'NA' --id 'Lgi_e6e5bd7'
agalma catalog insert -p ./pep/Mnemiopsis_leidyi.MneLei_Aug2011.pep.all.fasta -s 'Mnemiopsis leidyi' -n 'NA' -t 'NA' -q 'NA' --note 'NA' -b 'NA' --sample_prep 'NA' --id 'Mle_53a6be2'
agalma catalog insert -p ./pep/Nematostella_vectensis.ASM20922v1.pep.all.fasta -s 'Nematostella vectensis' -n 'NA' -t 'NA' -q 'NA' --note 'NA' -b 'NA' --sample_prep 'NA' --id 'Nve_e281b4e'
agalma catalog insert -p ./pep/Strongylocentrotus_purpuratus.Spur_3.1.pep.all.fasta -s 'Strongylocentrotus purpuratus' -n 'NA' -t 'NA' -q 'NA' --note 'NA' -b 'NA' --sample_prep 'NA' --id 'Spu_3bf67e6'
agalma catalog insert -p ./pep/Taeniopygia_guttata.taeGut3.2.4.pep.all.fasta -s 'Taeniopygia guttata' -n 'NA' -t 'NA' -q 'NA' --note 'NA' -b 'NA' --sample_prep 'NA' --id 'Tgu_58d926f'
agalma catalog insert -p ./pep/Trichoplax_adhaerens.ASM15027v1.pep.all.fasta -s 'Trichoplax adhaerens' -n 'NA' -t 'NA' -q 'NA' --note 'NA' -b 'NA' --sample_prep 'NA' --id 'Tad_cc34c2c'
