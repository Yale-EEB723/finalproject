#!/bin/bash
#SBATCH -J fastq_dump
#SBATCH -p general
#SBATCH -N 1
#SBATCH -c 16
#SBATCH --mem-per-cpu 6000
#SBATCH -t 720:00:00
#SBATCH -A eeb723
#SBATCH -o fastq_dump_system.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=ava.ghezelayagh@yale.edu

source activate biolite
source activate agalma

~/bin/sratoolkit.2.9.6-centos_linux64/bin/fastq-dump --split-3 ~/scratch60/agalma/data/sra_transcriptomes/SRR5226597.sra -O ~/scratch60/agalma/data/transcriptomes/
~/bin/sratoolkit.2.9.6-centos_linux64/bin/fastq-dump --split-3 ~/scratch60/agalma/data/sra_transcriptomes/SRR4448928.sra -O ~/scratch60/agalma/data/transcriptomes/
~/bin/sratoolkit.2.9.6-centos_linux64/bin/fastq-dump --split-3 ~/scratch60/agalma/data/sra_transcriptomes/SRR5051324.sra -O ~/scratch60/agalma/data/transcriptomes/
~/bin/sratoolkit.2.9.6-centos_linux64/bin/fastq-dump --split-3 ~/scratch60/agalma/data/sra_transcriptomes/SRR5312385.sra -O ~/scratch60/agalma/data/transcriptomes/
~/bin/sratoolkit.2.9.6-centos_linux64/bin/fastq-dump --split-3 ~/scratch60/agalma/data/sra_transcriptomes/SRR5312374.sra -O ~/scratch60/agalma/data/transcriptomes/
~/bin/sratoolkit.2.9.6-centos_linux64/bin/fastq-dump --split-3 ~/scratch60/agalma/data/sra_transcriptomes/SRR5124582.sra -O ~/scratch60/agalma/data/transcriptomes/
~/bin/sratoolkit.2.9.6-centos_linux64/bin/fastq-dump --split-3 ~/scratch60/agalma/data/sra_transcriptomes/SRR5124576.sra -O ~/scratch60/agalma/data/transcriptomes/
~/bin/sratoolkit.2.9.6-centos_linux64/bin/fastq-dump --split-3 ~/scratch60/agalma/data/sra_transcriptomes/SRR5124573.sra -O ~/scratch60/agalma/data/transcriptomes/
~/bin/sratoolkit.2.9.6-centos_linux64/bin/fastq-dump --split-3 ~/scratch60/agalma/data/sra_transcriptomes/SRR5234495.sra -O ~/scratch60/agalma/data/transcriptomes/
~/bin/sratoolkit.2.9.6-centos_linux64/bin/fastq-dump --split-3 ~/scratch60/agalma/data/sra_transcriptomes/SRR3213614.sra -O ~/scratch60/agalma/data/transcriptomes/
~/bin/sratoolkit.2.9.6-centos_linux64/bin/fastq-dump --split-3 ~/scratch60/agalma/data/sra_transcriptomes/SRR3213612.sra -O ~/scratch60/agalma/data/transcriptomes/
