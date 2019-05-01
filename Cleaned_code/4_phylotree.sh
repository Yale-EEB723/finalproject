# --- --- --- --- --- --- --- --- --- --- --- ---
# [4] Building TLR gene tree
# --- --- --- --- --- --- --- --- --- --- --- ---

iqtree -s trimed_inout_TLR.fasta -spp All_TLR_gene_tree.nex -bb 1000 -nt AUTO # Could also be: trimed_inout_TLR.fasta.splits.nex Split support values:
# Bellow are just comments mostly:
# Now that we have aligned and trimmed our sequences its time to build our gene tree
# echo 'Lets try IQtree' | conda install -c bioconda iqtree
# Say bioconda is super useful instead of going to github pages or such to download
# Construct a maximum likelihood tree
iqtree -b 100 -nt AUTO -s trimed_inout_TLR.fasta
This simple command will perform three important steps:
Model selection (with ModelFinder) to select the best-fit model to the data.
Reconstruct the ML tree with the selected model.
Assess branch supports with the ultrafast bootstrap.
# Once the run is done, IQ-TREE will write several output files including:
# .iqtree: the main report file that is self-readable. You should look at this file to see the computational results. It also contains a textual representation of the final tree.
# .treefile: the ML tree in NEWICK format, which can be visualized in FigTree.
# .log: log file of the entire run (also printed on the screen).
# .ckp.gz: checkpoint file used to resume an interrupted analysis.
And a few other files.
# In R transform the tree to a nexus format:
require(phytools)
iqtree -s trimed_inout_TLR.fasta -spp All_TLR_gene_tree.nex -bb 1000 -nt AUTO # Could also be: trimed_inout_TLR.fasta.splits.nex Split support values:
tree <- read.tree('/Users/diegoellis/projects/development/Comparative_genomics/finalproject/Data/All_TLR_2/trimed_inout_TLR.fasta.contree')
writeNexus(tree, file = '/Users/diegoellis/projects/development/Comparative_genomics/finalproject/Data/All_TLR_2/All_TLR_gene_tree.nex')
# We now perform a partition model analysis, where one allows each partition to have its own model:
# I transformed the concensus tree to nexus:
iqtree -s trimed_inout_TLR.fasta -spp All_TLR_gene_tree.nex -bb 1000 -nt AUTO # Could also be: trimed_inout_TLR.fasta.splits.nex Split support values:
iqtree -b 100 -nt -spp
