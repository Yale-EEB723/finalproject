#!/bin/bash
#SBATCH --job-name=blastp_search
#SBATCH -c 10
#SBATCH -p general
#SBATCH --mem-per-cpu=6000
#SBATCH -t 72:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=chantal.parker@yale.edu
#SBATCH -o blastp_search.out
#SBATCH -e blastp_search.err

module load BLAST+

blastp -db /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/BLAST_results/Complete_genelist.fas -query /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/BLAST_results/Caceratus/Caceratus_Trinity-GG.fasta.transdecoder.pep -evalue 1e-5 -outfmt 6 -out /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/BLAST_results/Caceratus/results.out
blastp -db /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/BLAST_results/Complete_genelist.fas -query /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/BLAST_results/Chamatus/Chamatus_Trinity-GG.fasta.transdecoder.pep -evalue 1e-5 -outfmt 6 -out /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/BLAST_results/Chamatus/results.out
blastp -db /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/BLAST_results/Complete_genelist.fas -query /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/BLAST_results/Crastro/Crastro_Trinity-GG.fasta.transdecoder.pep -evalue 1e-5 -outfmt 6 -out /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/BLAST_results/Crastro/results.out
blastp -db /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/BLAST_results/Complete_genelist.fas -query /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/BLAST_results/Deleginoides/Deleginoides_Trinity-GG.fasta.transdecoder.pep -evalue 1e-5 -outfmt 6 -out /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/BLAST_results/Deleginoides/results.out
blastp -db /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/BLAST_results/Complete_genelist.fas -query /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/BLAST_results/Dmawsoni/Dmawsoni_Trinity-GG.fasta.transdecoder.pep -evalue 1e-5 -outfmt 6 -out /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/BLAST_results/Dmawsoni/results.out
blastp -db /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/BLAST_results/Complete_genelist.fas -query /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/BLAST_results/Emaclovinus/Emaclovinus_Trinity-GG.fasta.transdecoder.pep -evalue 1e-5 -outfmt 6 -out /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/BLAST_results/Emaclovinus/results.out
blastp -db /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/BLAST_results/Complete_genelist.fas -query /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/BLAST_results/Gacuticeps/Gacuticeps_Trinity-GG.fasta.transdecoder.pep -evalue 1e-5 -outfmt 6 -out /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/BLAST_results/Gacuticeps/results.out
blastp -db /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/BLAST_results/Complete_genelist.fas -query /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/BLAST_results/Hantarcticus/Hantarcticus_Trinity-GG.fasta.transdecoder.pep -evalue 1e-5 -outfmt 6 -out /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/BLAST_results/Hantarcticus/results.out
blastp -db /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/BLAST_results/Complete_genelist.fas -query /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/BLAST_results/Lnudifrons/Lnudifrons_Trinity-GG.fasta.transdecoder.pep -evalue 1e-5 -outfmt 6 -out /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/BLAST_results/Lnudifrons/results.out
blastp -db /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/BLAST_results/Complete_genelist.fas -query /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/BLAST_results/Ncoriiceps/Ncoriiceps_Trinity-GG.fasta.transdecoder.pep -evalue 1e-5 -outfmt 6 -out /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/BLAST_results/Ncoriiceps/results.out
blastp -db /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/BLAST_results/Complete_genelist.fas -query /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/BLAST_results/Nionah/Nionah_Trinity-GG.fasta.transdecoder.pep -evalue 1e-5 -outfmt 6 -out /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/BLAST_results/Nionah/results.out
blastp -db /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/BLAST_results/Complete_genelist.fas -query /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/BLAST_results/Pborchgrevinki/Pborchgrevinki_Trinity-GG.fasta.transdecoder.pep -evalue 1e-5 -outfmt 6 -out /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/BLAST_results/Pborchgrevinki/results.out
blastp -db /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/BLAST_results/Complete_genelist.fas -query /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/BLAST_results/Pcharcoti/Pcharcoti_Trinity-GG.fasta.transdecoder.pep -evalue 1e-5 -outfmt 6 -out /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/BLAST_results/Pcharcoti/results.out
blastp -db /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/BLAST_results/Complete_genelist.fas -query /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/BLAST_results/Pgeorgianus/Pgeorgianus_Trinity-GG.fasta.transdecoder.pep -evalue 1e-5 -outfmt 6 -out /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/BLAST_results/Pgeorgianus/results.out
blastp -db /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/BLAST_results/Complete_genelist.fas -query /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/BLAST_results/Tbernacchii/Tbernacchii_Trinity-GG.fasta.transdecoder.pep -evalue 1e-5 -outfmt 6 -out /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/BLAST_results/Tbernacchii/results.out
blastp -db /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/BLAST_results/Complete_genelist.fas -query /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/BLAST_results/Tpennellii/Tpennellii_Trinity-GG.fasta.transdecoder.pep -evalue 1e-5 -outfmt 6 -out /gpfs/ysm/scratch60/cep4/noto_immunity/transcriptomes/BLAST_results/Tpennellii/results.out

