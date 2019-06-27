#!/bin/bash
#SBATCH --job-name=trinity_guided_assembly1
#SBATCH -c 10
#SBATCH -p general
#SBATCH --mem-per-cpu=6000
#SBATCH -t 72:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=chantal.parker@yale.edu
#SBATCH -o trinity_guided1.out
#SBATCH -e trinity_guided1.err

source activate salmon
module load SAMtools
module load Jellyfish
module load Trinity

Trinity --genome_guided_bam /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/processed/filtered_reads/ERR793598.bam --genome_guided_max_intron 10000 --max_memory 110G --CPU 10
Trinity --genome_guided_bam /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/processed/filtered_reads/ERR2587158.bam --genome_guided_max_intron 10000 --max_memory 110G --CPU 10
Trinity --genome_guided_bam /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/processed/filtered_reads/ERR2587161.bam --genome_guided_max_intron 10000 --max_memory 110G --CPU 10
Trinity --genome_guided_bam /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/processed/filtered_reads/ERR2587165.bam --genome_guided_max_intron 10000 --max_memory 110G --CPU 10
Trinity --genome_guided_bam /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/processed/filtered_reads/ERR2587193.bam --genome_guided_max_intron 10000 --max_memory 110G --CPU 10
Trinity --genome_guided_bam /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/processed/filtered_reads/SRR2823736.bam --genome_guided_max_intron 10000 --max_memory 110G --CPU 10
Trinity --genome_guided_bam /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/processed/filtered_reads/SRR3342841.bam --genome_guided_max_intron 10000 --max_memory 110G --CPU 10
Trinity --genome_guided_bam /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/processed/filtered_reads/SRR4279902.bam --genome_guided_max_intron 10000 --max_memory 110G --CPU 10
Trinity --genome_guided_bam /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/processed/filtered_reads/SRR5210463.bam --genome_guided_max_intron 10000 --max_memory 110G --CPU 10
Trinity --genome_guided_bam /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/processed/filtered_reads/SRR5210464.bam --genome_guided_max_intron 10000 --max_memory 110G --CPU 10
Trinity --genome_guided_bam /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/processed/filtered_reads/SRR6450838.bam --genome_guided_max_intron 10000 --max_memory 110G --CPU 10
Trinity --genome_guided_bam /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/processed/filtered_reads/SRR6793935.bam --genome_guided_max_intron 10000 --max_memory 110G --CPU 10
Trinity --genome_guided_bam /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/processed/filtered_reads/SRR6794062.bam --genome_guided_max_intron 10000 --max_memory 110G --CPU 10
Trinity --genome_guided_bam /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/processed/filtered_reads/SRR6929342.bam --genome_guided_max_intron 10000 --max_memory 110G --CPU 10
Trinity --genome_guided_bam /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/processed/filtered_reads/SRR7164558.bam --genome_guided_max_intron 10000 --max_memory 110G --CPU 10
Trinity --genome_guided_bam /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/processed/filtered_reads/SRR8767971.bam --genome_guided_max_intron 10000 --max_memory 110G --CPU 10
