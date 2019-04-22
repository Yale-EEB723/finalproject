#!/bin/bash
#SBATCH -J catalog_agalma
#SBATCH -p general
#SBATCH -N 1
#SBATCH -c 16
#SBATCH --mem-per-cpu 6000
#SBATCH -t 50:00:00
#SBATCH -A near
#SBATCH --mail-type=ALL
#SBATCH --mail-user=ava.ghezelayagh@yale.edu

source activate agalma
export AGALMA_DB=$PWD/agalma/data/agalma.sqlite

agalma catalog insert -i GCA000148955.1 -p ~/scratch60/agalma/data/transcriptomes/GCA_00148GCA_000148955.1_Petromyzon_marinus-7.0_genomic.fastq -s "Petromyzon_marinus" -n 7757 -d 159722
agalma catalog insert -i GCA900186335.2 -p ~/scratch60/agalma/data/transcriptomes/GCA_900186335.2_Eburgeri_3.2_genomic.fastq -s "Eptatretus_burgeri" -n 1855 -d 159767
agalma catalog insert -i GCA004367855.1 -p ~/scratch60/agalma/data/transcriptomes/GCA_004367855.1_ASM436785v1_genomic.fastq -s "Oikopleura_vanhoeffeni" -n 2056977 -d 159671
agalma catalog insert -i GCA000165045.2 -p ~/scratch60/agalma/data/transcriptomes/GCA_000165045.2_Callorhinchus_milii-6.1.3_genomic.fastq -s "Callorhinchus_milii" -n 7868 -d 564644
agalma catalog insert -i SRR3213612 -p ~/scratch60/agalma/data/transcriptomes/SRR3213612_1.fastq ~/scratch60/agalma/data/transcriptomes/SRR3213612_2.fastq -s "Urobatis_jamaicensis" -n 170826 -d 621035
agalma catalog insert -i SRR3213614 -p ~/scratch60/agalma/data/transcriptomes/SRR3213614_1.fastq ~/scratch60/agalma/data/transcriptomes/SRR3213614_2.fastq -s "Carcharodon_carcharias" -n 13397 -d 159903
agalma catalog insert -i SRR5226597 -p ~/scratch60/agalma/data/transcriptomes/SRR5226597.fastq -s "Lampetra_planeri" -n 7750 -d 159720
agalma catalog insert -i SRR4448928 -p ~/scratch60/agalma/data/transcriptomes/SRR4448928_1.fastq ~/scratch60/agalma/data/transcriptomes/SRR4448928_2.fastq -s "Lethenteron_camtschaticum" -n 980415 -d 622287
agalma catalog insert -i SRR5051324 -p ~/scratch60/agalma/data/transcriptomes/SRR5051324_1.fastq ~/scratch60/agalma/data/transcriptomes/SRR5051324_2.fastq -s "Lethenteron_camtschaticum" -n 980415 -d 622287
agalma catalog insert -i SRR5312385 -p ~/scratch60/agalma/data/transcriptomes/SRR5312385_1.fastq ~/scratch60/agalma/data/transcriptomes/SRR5312385_2.fastq -s "Petromyzon_marinus" -n 7757 -d 159722
agalma catalog insert -i SRR5312374 -p ~/scratch60/agalma/data/transcriptomes/SRR5312374_1.fastq ~/scratch60/agalma/data/transcriptomes/SRR5312374_2.fastq -s "Petromyzon_marinus" -n 7757 -d 159722
agalma catalog insert -i SRR5124582 -p ~/scratch60/agalma/data/transcriptomes/SRR5124582_1.fastq ~/scratch60/agalma/data/transcriptomes/SRR5124582_2.fastq -s "Petromyzon_marinus" -n 7757 -d 159722
agalma catalog insert -i SRR5124576 -p ~/scratch60/agalma/data/transcriptomes/SRR5124576_1.fastq ~/scratch60/agalma/data/transcriptomes/SRR5124576_2.fastq -s "Petromyzon_marinus" -n 7757 -d 159722
agalma catalog insert -i SRR5124573 -p ~/scratch60/agalma/data/transcriptomes/SRR5124573_1.fastq ~/scratch60/agalma/data/transcriptomes/SRR5124573_2.fastq -s "Petromyzon_marinus" -n 7757 -d 159722
agalma catalog insert -i SRR5234495 -p ~/scratch60/agalma/data/transcriptomes/SRR5234495_1.fastq ~/scratch60/agalma/data/transcriptomes/SRR5234495_2.fastq -s "Eptatretus_burgeri" -n 1855 -d 159767
agalma catalog insert -i SRR2146922 -p ~/scratch60/agalma/data/transcriptomes/SRR2146922_1.fastq ~/scratch60/agalma/data/transcriptomes/SRR2146922_2.fastq -s "Mordacia_mordax" -n 7755 -d 159747
agalma catalog insert -i SRR2146917 -p ~/scratch60/agalma/data/transcriptomes/SRR2146917_1.fastq ~/scratch60/agalma/data/transcriptomes/SRR2146917_2.fastq -s "Geotria_australis" -n 71168 -d 159744
agalma catalog insert -i SRR2146918 -p ~/scratch60/agalma/data/transcriptomes/SRR2146918_1.fastq ~/scratch60/agalma/data/transcriptomes/SRR2146918_2.fastq -s "Geotria_australis" -n 71168 -d 159744
agalma catalog insert -i SRR2146919 -p ~/scratch60/agalma/data/transcriptomes/SRR2146919_1.fastq ~/scratch60/agalma/data/transcriptomes/SRR2146919_2.fastq -s "Geotria_australis" -n 71168 -d 159744
agalma catalog insert -i SRR2146912 -p ~/scratch60/agalma/data/transcriptomes/SRR2146912_1.fastq ~/scratch60/agalma/data/transcriptomes/SRR2146912_2.fastq -s "Eptatretus_cirrhatus" -n 78394 -d 159765
agalma catalog insert -i SRR2146913 -p ~/scratch60/agalma/data/transcriptomes/SRR2146913_1.fastq ~/scratch60/agalma/data/transcriptomes/SRR2146913_2.fastq -s "Eptatretus_cirrhatus" -n 78394 -d 159765
agalma catalog insert -i SRR2146914 -p ~/scratch60/agalma/data/transcriptomes/SRR2146914_1.fastq ~/scratch60/agalma/data/transcriptomes/SRR2146914_2.fastq -s "Eptatretus_cirrhatus" -n 78394 -d 159765
agalma catalog insert -i SRR2146915 -p ~/scratch60/agalma/data/transcriptomes/SRR2146915_1.fastq ~/scratch60/agalma/data/transcriptomes/SRR2146915_2.fastq -s "Eptatretus_cirrhatus" -n 78394 -d 159765
agalma catalog insert -i SRR2146916 -p ~/scratch60/agalma/data/transcriptomes/SRR2146916_1.fastq ~/scratch60/agalma/data/transcriptomes/SRR2146916_2.fastq -s "Eptatretus_cirrhatus" -n 78394 -d 159765
