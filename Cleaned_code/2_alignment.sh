# --- --- --- --- --- --- --- --- --- --- --- ---
# [D] Alignment with Mafft
# --- --- --- --- --- --- --- --- --- --- --- ---


cd /Users/diegoellis/projects/development/Comparative_genomics/finalproject/Data/All_TLR_2
We Download MAFFT on https://anaconda.org/bioconda/mafft
echo 'Align our TLR genes with the outgroup TIR gene of humans'
mafft --auto ingr_outgr_TLR.fasta > aligned_ingr_outgr_all_TLR.fasta
# During alignment, not everything actually gets aligned.
# Could be due to low quality sequences and this affects further analysis (i.e. phlyogenetics)
