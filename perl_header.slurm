#!/bin/bash
#SBATCH -J perl_header
#SBATCH -p general
#SBATCH -N 1
#SBATCH -c 8
#SBATCH --mem-per-cpu 4000
#SBATCH -t 5:00:00
#SBATCH -A near
#SBATCH --mail-type=ALL
#SBATCH --mail-user=ava.ghezelayagh@yale.edu

cd ~/scratch60/agalma/data/transcriptomes

cat old/SRR4448928_1.fastq | perl -lane 's/_forward//; print;' > ../SRR4448928_1.fastq
cat old/SRR5124573_1.fastq | perl -lane 's/_forward//; print;' > ../SRR5124573_1.fastq
cat old/SRR5124576_1.fastq | perl -lane 's/_forward//; print;' > ../SRR5124576_1.fastq
cat old/SRR5124582_1.fastq | perl -lane 's/_forward//; print;' > ../SRR5124582_1.fastq
cat old/SRR5234495_1.fastq | perl -lane 's/_forward//; print;' > ../SRR5234495_1.fastq
cat old/SRR4448928_2.fastq | perl -lane 's/_reverse//; print;' > ../SRR4448928_2.fastq
cat old/SRR5124576_2.fastq | perl -lane 's/_reverse//; print;' > ../SRR5124576_2.fastq
cat old/SRR5234495_2.fastq | perl -lane 's/_reverse//; print;' > ../SRR5234495_2.fastq
cat old/SRR5124582_2.fastq | perl -lane 's/_reverse//; print;' > ../SRR5124582_2.fastq
cat old/SRR5234495_2.fastq | perl -lane 's/_reverse//; print;' > ../SRR5234495_2.fastq
