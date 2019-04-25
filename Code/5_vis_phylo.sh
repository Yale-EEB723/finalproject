# --- --- --- --- --- --- --- --- --- --- --- ---
# [5] Visualize gene trees - using ggTree and ete3
# --- --- --- --- --- --- --- --- --- --- --- ---


# phylo.io
Visualize the gene tree with ete3 (python plugin) or with ggtree and ape (R)
echo 'Quick bash visualization of the gene tree'
mkdir /Users/diegoellis/projects/development/Comparative_genomics/finalproject/Figures/
cd /Users/diegoellis/projects/development/Comparative_genomics/finalproject/Data/All_TLR/
ete3 view -t trimed_inout_TLR_tree_newick.nw
echo 'Plot the gene tree using ggTree'
Rscript /Users/diegoellis/projects/development/Comparative_genomics/finalproject/Code/read_tree.R
echo 'Plot the gene tree using ggTree of only 4 TLR sequences with aligned sequences next to them'
Rscript /Users/diegoellis/projects/development/Comparative_genomics/finalproject/Code/read_tree.R
# All PhyloTree instances are, by default, attached to such layout for tree visualization, thus allowing for in-place alignment visualization and evolutionary events labeling.
[9] The tree is in Newack format; I converted the TREE using ape::write.tree.
# This takes a few hours
# ete3 annotated -t tree.nw --ncbi
# http://etetoolkit.org/documentation/tools/
 iqtree -nt AUTO -b 100 -s trimmed_al_in_outgroup.fasta  # Make a tree with 100 bootstrap.
# For command line visualizaiton:
conda install -c bioconda ete3
ete3 view --text MyTreeFile.nw
