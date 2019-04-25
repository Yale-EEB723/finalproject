# --- --- --- --- --- --- --- --- --- --- --- ---
# [D] Trimming with Trimal
# --- --- --- --- --- --- --- --- --- --- --- ---
# I tried with gBlock and had troubles, so I went from trimal for trimming
# conda install -c bioconda gblocks

INDIR=/Users/diegoellis/projects/development/Comparative_genomics/finalproject/Data/All_TLR_2/
trimal -in aligned_ingr_outgr_all_TLR.fasta -out trimed_inout_TLR.fasta -htmlout trimed_inout_TLR.html -gt 0.8 -st 0.01 # Gap scores
echo  'remove all columns with gaps in more than 20% of the sequences or with a similarity score lower than 0.001 unless this removes more than 40% of the columns in the original alignment'
echo 'In such cases trimAl v1.2 will add the necessary number of columns (in decreasing order of scores) so that the minimum coverage is respected.'
