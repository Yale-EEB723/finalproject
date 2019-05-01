ssh -X -Y de293@farnam.hpc.yale.edu
newgrp eeb723
# interactive session with 2 cores and default 10GiB of RAM
srun -A eeb723 --pty -p interactive -c 2 bash
mkdir -p /gpfs/ysm/project/eeb723/${USER}/eeb723-seqaln
singularity shell --shell /bin/bash -B /gpfs/ysm/project/eeb723/${USER}/eeb723-seqaln:/data/eeb723-seqaln docker://eeb723/course_docker
# This is the directory I wanna work at:
cd /gpfs/ysm/project/eeb723/${USER}/eeb723-seqaln
mkdir Alignment_bats
# Now make a folder for my own data in here:
cd Alignment_bats/
mkdir alignment | mkdir fastq | mkdir genome
# START GENOME ASSEMBLY:
# ---- --- --- ---- --- --- ---- --- --- ---- --- --- ---- --- --- ---- --- --- ---- --- ---
export PROJ_DIR=/data/eeb723-seqaln/Alignment_bats
# I chose Myotis lucifugus, because it's my reference genome that I will align my other genomes into.
mkdir -p $PROJ_DIR/genome && cd $PROJ_DIR/genome
cd $PROJ_DIR/genome
# wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/900/604/845/GCA_900604845.1_TTHNAR1/*
echo 'Downloading Myotis lucifugus genome from NCBI'
 wget ftp://ftp.ncbi.nih.gov/genomes//Myotis_lucifugus/*
# GCA_000147115.1
# https://www.ncbi.nlm.nih.gov/assembly/GCF_000147115.1/
# https://www.ncbi.nlm.nih.gov/genome/?term=txid59463[orgn]
# wget ftp://ftp.ncbi.nlm.nih.gov/genome/annotation_euk/Myotis_lucifugus/101/*

https://github.com/diego-ellis-soto/container-based-alignment.git
cd container-based-alignment
