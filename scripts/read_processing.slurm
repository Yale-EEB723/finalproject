#!/bin/bash
#SBATCH --job-name=filter_fq1
#SBATCH -c 6
#SBATCH --mem-per-cpu=6000
#SBATCH -t 60:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=chantal.parker@yale.edu
#SBATCH -o system1.out
#SBATCH -e error1.out

module load Biopython
module load Trimmomatic
module load Trinity
module load Bowtie
module load FastQC
git clone https://github.com/TransDecoder/TransDecoder.git
module load SAMtools
module load HISAT2

python /gpfs/ysm/home/cep4/bin/master/filter_fq.py /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/ERR793598_1.fq /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/ERR793598_2.fq Notothenioidei mt 8 /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/processed/
python /gpfs/ysm/home/cep4/bin/master/filter_fq.py /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/ERR2587158_1.fq /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/ERR2587158_2.fq Notothenioidei mt 8 /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/processed/
python /gpfs/ysm/home/cep4/bin/master/filter_fq.py /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/ERR2587161_1.fq /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/ERR2587161_2.fq Notothenioidei mt 8 /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/processed/
python /gpfs/ysm/home/cep4/bin/master/filter_fq.py /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/ERR2587165_1.fq /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/ERR2587165_2.fq Notothenioidei mt 8 /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/processed/
python /gpfs/ysm/home/cep4/bin/master/filter_fq.py /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/ERR2587193_1.fq /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/ERR2587193_2.fq Notothenioidei mt 8 /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/processed/
python /gpfs/ysm/home/cep4/bin/master/filter_fq.py /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/SRR2259813_1.fq /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/SRR2259813_2.fq Notothenioidei mt 8 /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/processed/
python /gpfs/ysm/home/cep4/bin/master/filter_fq.py /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/SRR2823736_1.fq /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/SRR2823736_2.fq Notothenioidei mt 8 /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/processed/
python /gpfs/ysm/home/cep4/bin/master/filter_fq.py /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/SRR3342841_1.fq /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/SRR3342841_2.fq Notothenioidei mt 8 /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/processed/
python /gpfs/ysm/home/cep4/bin/master/filter_fq.py /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/SRR4279902_1.fq /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/SRR4279902_2.fq Notothenioidei mt 8 /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/processed/
python /gpfs/ysm/home/cep4/bin/master/filter_fq.py /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/SRR5210463_1.fq /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/SRR5210463_2.fq Notothenioidei mt 8 /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/processed/
python /gpfs/ysm/home/cep4/bin/master/filter_fq.py /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/SRR5210464_1.fq /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/SRR5210464_2.fq Notothenioidei mt 8 /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/processed/
python /gpfs/ysm/home/cep4/bin/master/filter_fq.py /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/SRR6450838_1.fq /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/SRR6450838_2.fq Notothenioidei mt 8 /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/processed/
python /gpfs/ysm/home/cep4/bin/master/filter_fq.py /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/SRR6793935_1.fq /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/SRR6793935_2.fq Notothenioidei mt 8 /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/processed/
python /gpfs/ysm/home/cep4/bin/master/filter_fq.py /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/SRR6794062_1.fq /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/SRR6794062_2.fq Notothenioidei mt 8 /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/processed/
python /gpfs/ysm/home/cep4/bin/master/filter_fq.py /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/SRR6929342_1.fq /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/SRR6929342_2.fq Notothenioidei mt 8 /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/processed/
python /gpfs/ysm/home/cep4/bin/master/filter_fq.py /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/SRR7164558_1.fq /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/SRR7164558_2.fq Notothenioidei mt 8 /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/processed/
python /gpfs/ysm/home/cep4/bin/master/filter_fq.py /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/SRR8767971_1.fq /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/SRR8767971_2.fq Notothenioidei mt 8 /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/subsample/processed/


