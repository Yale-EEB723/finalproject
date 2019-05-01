# --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
# Download of TLR genes of Myotis lucifugus - our reference genome
#
# --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
# I went to NCBI and manually downloaded the FASTA sequences of TLR genes as FASTA files
# This lead to the downlaod of a total of 4 TLR genes: TLR 3, 4, 8 and 9
# There are located at 
ls /Users/diegoellis/projects/development/Comparative_genomics/finalproject/Data/*.FASTA

# Setup SUMAC: 
 conda create --name Python2 python=2.7
 source activate Python2 # To activate the environment. 
-c conda-forge biopython
conda install -c conda-forge matplotlib 
 conda list
conda install -c bioconda mafft 
conda install -c bioconda vsearch 
 conda install -c bioconda blast 
git clone https://github.com/wf8/sumac.git
cd sumac/src/
 python setup.py install
 head README.md

# python -m sumac -d MAM -i Myotis -o Murina -minl 750 --cores 4 -g /Users/diegoellis/projects/development/Comparative_genomics/finalproject/Data/TLR_gene_9_myotis_lucifugus.FASTA -de 

# --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
# 
# --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---


