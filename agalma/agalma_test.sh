#!/bin/bash
#SBATCH --partition=general
#SBATCH --job-name=agalma_test
#SBATCH -c 4
#SBATCH --mem-per-cpu=6G
#SBATCH --time=0-02:00:00
#SBATCH --mail-type=ALL



source activate /gpfs/ysm/project/jlm329/conda_envs/agalma




cd /home/jlm329/eeb723/jlm329/agalma/tmp

agalma test