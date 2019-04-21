require(phytools);require(ggtree);require(BiocVersion);require(ape);require(treeio)
setwd('/Users/diegoellis/projects/development/Comparative_genomics/finalproject/Data/All_TLR/') 
# "trimed_inout_TLR.fasta.iqtree"            
#  "trimed_inout_TLR.fasta.contree"           
# tree <- read.tree(text = 'trimed_inout_TLR.fasta.iqtree')
# tree <- read.iqtree('trimed_inout_TLR.fasta.iqtree')
phy <- read.tree('trimed_inout_TLR.fasta.contree')
plot(phy,no.margin=TRUE,edge.width=2)
ape::plot.phylo(phy)

plot(phy, label.offset=0.2)  
nodelabels() # add node numbers
tiplabels()  # add tip numbers

ladderized.phy <- ladderize(phy)

# This is convenient shorthand
TLR_gene_tree <- ggtree(phy) + theme_tree2()+ geom_nodepoint(col = 'cornsilk1', alpha = 0.8) + geom_tippoint() + geom_tiplab()+ geom_text(aes(label=node), hjust=-.3)+  geom_tiplab(align=TRUE, linesize=.5)

branches <- phy$edge
species <- phy$tip.label
brlength <- phy$edge.length
nodes <- phy$Nnode
# Save tree as newick file
write.tree(phy, file = "trimed_inout_TLR_tree_newick", append = FALSE,           digits = 10, tree.names = FALSE)
list.files()

tree <- read.tree('trimed_inout_TLR_tree_newick.nw')

msaplot(p=ggtree(tree), fasta="trimed_inout_TLR.fasta")

           

# https://4va.github.io/biodatasci/r-ggtree.html
# Plot internal node number
# his puts the multiple sequence alignment and the tree side-by-side
# The function takes a tree object (produced with ggtree()) and the path to the FASTA multiple sequence alignment
msaplot(p=ggtree(tree), fasta="aligned_ingr_outgr_all_TLR.fasta", window=c(150, 175))
msaplot(p=ggtree(tree), fasta="trimed_inout_TLR.fasta")
str(tree)
tree$tip.label

tree$node.label

# Tutorial: https://4va.github.io/biodatasci/r-ggtree.html
