#!/bin/bash
#SBATCH --job-name=transdecoder_Cras
#SBATCH -c 10
#SBATCH -p general
#SBATCH --mem-per-cpu=6000
#SBATCH -t 72:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=chantal.parker@yale.edu
#SBATCH -o transdecoder.out
#SBATCH -e transdecorder.err

/gpfs/ysm/home/cep4/bin/TransDecoder/TransDecoder.LongOrfs -t /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/transdecoder/Caceratus/Caceratus_Trinity-GG.fasta
/gpfs/ysm/home/cep4/bin/TransDecoder/TransDecoder.Predict -t /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/transdecoder/Caceratus/Caceratus_Trinity-GG.fasta

/gpfs/ysm/home/cep4/bin/TransDecoder/TransDecoder.LongOrfs -t /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/transdecoder/Chamatus/Chamatus_Trinity-GG.fasta
/gpfs/ysm/home/cep4/bin/TransDecoder/TransDecoder.Predict -t /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/transdecoder/Chamatus/Chamatus_Trinity-GG.fasta

/gpfs/ysm/home/cep4/bin/TransDecoder/TransDecoder.LongOrfs -t /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/transdecoder/Crastrospinosus/Crastrospinosus_Trinity-GG.fasta
/gpfs/ysm/home/cep4/bin/TransDecoder/TransDecoder.Predict -t /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/transdecoder/Crastrospinosus/Crastrospinosus_Trinity-GG.fasta

/gpfs/ysm/home/cep4/bin/TransDecoder/TransDecoder.LongOrfs -t /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/transdecoder/Deleginoides/Deleginoides_Trinity-GG.fasta
/gpfs/ysm/home/cep4/bin/TransDecoder/TransDecoder.Predict -t /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/transdecoder/Deleginoides/Deleginoides_Trinity-GG.fasta

/gpfs/ysm/home/cep4/bin/TransDecoder/TransDecoder.LongOrfs -t /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/transdecoder/Emaclovinus/Emaclovinus_Trinity-GG.fasta
/gpfs/ysm/home/cep4/bin/TransDecoder/TransDecoder.Predict -t /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/transdecoder/Emaclovinus/Emaclovinus_Trinity-GG.fasta

/gpfs/ysm/home/cep4/bin/TransDecoder/TransDecoder.LongOrfs -t /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/transdecoder/Gacuticeps/Gacuticeps_Trinity-GG.fasta
/gpfs/ysm/home/cep4/bin/TransDecoder/TransDecoder.Predict -t /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/transdecoder/Gacuticeps/Gacuticeps_Trinity-GG.fasta

/gpfs/ysm/home/cep4/bin/TransDecoder/TransDecoder.LongOrfs -t /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/transdecoder/Hantarcticus/Hantarcticus_Trinity-GG.fasta
/gpfs/ysm/home/cep4/bin/TransDecoder/TransDecoder.Predict -t /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/transdecoder/Hantarcticus/Hantarcticus_Trinity-GG.fasta

/gpfs/ysm/home/cep4/bin/TransDecoder/TransDecoder.LongOrfs -t /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/transdecoder/Lnudifrons/Lnudifrons_Trinity-GG.fasta
/gpfs/ysm/home/cep4/bin/TransDecoder/TransDecoder.Predict -t /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/transdecoder/Lnudifrons/Lnudifrons_Trinity-GG.fasta

/gpfs/ysm/home/cep4/bin/TransDecoder/TransDecoder.LongOrfs -t /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/transdecoder/Ncoriiceps/Ncoriiceps_Trinity-GG.fasta
/gpfs/ysm/home/cep4/bin/TransDecoder/TransDecoder.Predict -t /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/transdecoder/Ncoriiceps/Ncoriiceps_Trinity-GG.fasta

/gpfs/ysm/home/cep4/bin/TransDecoder/TransDecoder.LongOrfs -t /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/transdecoder/Nionah/Nionah_Trinity-GG.fasta
/gpfs/ysm/home/cep4/bin/TransDecoder/TransDecoder.Predict -t /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/transdecoder/Nionah/Nionah_Trinity-GG.fasta

/gpfs/ysm/home/cep4/bin/TransDecoder/TransDecoder.LongOrfs -t /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/transdecoder/Pborchgrevinki/Pborchgrevinki_Trinity-GG.fasta
/gpfs/ysm/home/cep4/bin/TransDecoder/TransDecoder.Predict -t /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/transdecoder/Pborchgrevinki/Pborchgrevinki_Trinity-GG.fasta

/gpfs/ysm/home/cep4/bin/TransDecoder/TransDecoder.LongOrfs -t /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/transdecoder/Pcharcoti/Pcharcoti_Trinity-GG.fasta
/gpfs/ysm/home/cep4/bin/TransDecoder/TransDecoder.Predict -t /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/transdecoder/Pcharcoti/Pcharcoti_Trinity-GG.fasta

/gpfs/ysm/home/cep4/bin/TransDecoder/TransDecoder.LongOrfs -t /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/transdecoder/Pgeorgianus/Pgeorgianus_Trinity-GG.fasta
/gpfs/ysm/home/cep4/bin/TransDecoder/TransDecoder.Predict -t /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/transdecoder/Pgeorgianus/Pgeorgianus_Trinity-GG.fasta

/gpfs/ysm/home/cep4/bin/TransDecoder/TransDecoder.LongOrfs -t /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/transdecoder/Tbernacchii/Tbernacchii_Trinity-GG.fasta
/gpfs/ysm/home/cep4/bin/TransDecoder/TransDecoder.Predict -t /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/transdecoder/Tbernacchii/Tbernacchii_Trinity-GG.fasta

/gpfs/ysm/home/cep4/bin/TransDecoder/TransDecoder.LongOrfs -t /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/transdecoder/Tpennellii/Tpennellii_Trinity-GG.fasta
/gpfs/ysm/home/cep4/bin/TransDecoder/TransDecoder.Predict -t /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/transdecoder/Tpennellii/Tpennellii_Trinity-GG.fasta

/gpfs/ysm/home/cep4/bin/TransDecoder/TransDecoder.LongOrfs -t /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/transdecoder/Dmawsoni/Dmawsoni_Trinity-GG.fasta
/gpfs/ysm/home/cep4/bin/TransDecoder/TransDecoder.Predict -t /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/transdecoder/Dmawsoni/Dmawsoni_Trinity-GG.fasta
