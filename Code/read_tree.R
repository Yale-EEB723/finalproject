require(phytools);require(ggtree);require(BiocVersion);require(ape);require(treeio);require(seqinr);require(taxonomizr)
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
# tree <- read.tree('trimed_inout_TLR.fasta.contree')
# msaplot(p=ggtree(tree), fasta="trimed_inout_TLR.fasta")

setwd('/Users/diegoellis/projects/development/Comparative_genomics/finalproject/Data/TLR_7/')
phy_TLR7 <- read.tree('/Users/diegoellis/projects/development/Comparative_genomics/finalproject/Data/TLR_7/trimmed_al_in_outgroup.fasta.contree')
plot(phy_TLR7,no.margin=TRUE,edge.width=2, label.offset=0.2)
nodelabels() # add node numbers
tiplabels()  # add tip numbers
TLR7_gene_tree <- ggtree(phy_TLR7) + theme_tree2()+ geom_nodepoint(col = 'cornsilk1', alpha = 0.8) + geom_tippoint() + geom_tiplab()+ geom_text(aes(label=node))+  geom_tiplab(align=TRUE, linesize=.5)
# msaplot(p=ggtree(phy_TLR7), fasta="trimmed_al_in_outgroup.fasta", window=c(150, 175))
msaplot(p=ggtree(phy_TLR7), fasta="trimmed_al_in_outgroup.fasta")
p <- ggtree(phy_TLR7)
f <- "trimmed_al_in_outgroup.fasta"
msaplot(TLR7_gene_tree, f, width=.3, offset=.05)
# ggtree made shorter
# pp <- ggtree(tree) %>% phylopic("79ad5f09-cf21-4c89-8e7d-0c82a00ce728", color="steelblue", alpha = .3)
# Add phylopic of a bat. 


pp <- ggtree(tree) %>% phylopic('image/18bfd2fc-f184-4c3a-b511-796aafcc70f6/', color="steelblue", alpha = .3)



ggtree(phy, layout="circular", branch.length = 'none') + theme_tree2()+ geom_nodepoint(col = 'cornsilk1', alpha = 0.8) + geom_tippoint() + geom_tiplab()+ geom_text(aes(label=node))+  geom_tiplab(align=TRUE, linesize=.5)

ggtree(phy, layout="circular", branch.length = 'none') + theme_tree2()+ geom_nodepoint(col = 'cornsilk1') + geom_tiplab(size = 0.8, align=TRUE)
# ggsave('/Users/diegoellis/projects/development/Comparative_genomics/finalproject/Figures/All_TLR_genetree_ggtree.pdf', width = 60, height = 60, units = "cm")
# Know the order -> concatenate all the names -> ggtree -> add the tip names -> Colour by order!!!! 
ggtree(phy, branch.length='none', layout='circular')+ theme_tree2()+ geom_nodepoint(col = 'cornsilk1', alpha=1/4, size=0.8) + geom_tiplab(size = 0.8, align=TRUE) # , color = 'firebrick')


#####
# Tree all TLR with 1000 bootstrap
#####
require(phytools)
tree <- read.tree('/Users/diegoellis/projects/development/Comparative_genomics/finalproject/Data/All_TLR_2/trimed_inout_TLR.fasta.contree')
writeNexus(tree, file = '/Users/diegoellis/projects/development/Comparative_genomics/finalproject/Data/All_TLR_2/All_TLR_gene_tree.nex')

# phytools::writeNexus('/Users/diegoellis/projects/development/Comparative_genomics/finalproject/Data/All_TLR_2/trimed_inout_TLR.fasta.contree',
#file = '/Users/diegoellis/projects/development/Comparative_genomics/finalproject/Data/All_TLR_2/All_TLR_gene_tree')

trimed_inout_TLR.fasta.splits.nex



All_DNA_seqs <- read.fasta('/Users/diegoellis/projects/development/Comparative_genomics/finalproject/Data/All_TLR/aligned_ingr_outgr_all_TLR.fasta')
bat_accesion_names <- names(All_DNA_seqs)

df_bats <- data.frame(matrix(ncol = 2, nrow = length(bat_accesion_names)))
names(df_bats) <- c('Accesion_number', 'Species')

for(i in 1:length(bat_accesion_names)){
  print( bat_accesion_names[i])
  bat_sequences <- read.GenBank(bat_accesion_names[i]) #read sequences and place
  df_bats[i,]$Accesion_number <- names(bat_sequences)
  df_bats[i,]$Species <- attr(bat_sequences, "species")
  Sys.sleep(10)
  }
# Loop through bat_accesion_name and do read.Genbank and get the species name.
# bat_sequences <- read.GenBank(bat_accesion_names[1])
# str(bat_sequences)

# Use taxyzeR -> Get family and group:
# df_bats
library("taxize")
# Make a family and a genus column:
df_bats$genus <- NA
df_bats$family <- NA
df_bats2 <- df_bats # backup
df_bats <- df_bats2 # backup
for(i in 1:nrow(df_bats)){
  print(df_bats[i,])
  df_bats[i,]$genus <- tax_name(query = paste0(df_bats[i,]$Species), get = "genus", db = "ncbi")$genus
  Sys.sleep(10)
  df_bats[i,]$family <- tax_name(query = paste0(df_bats[i,]$Species), get = "family", db = "ncbi")$family
}

#get unique number of species:
unique_sp <- unique(df_bats$Species)
bat_taxonomy <- data.frame(matrix(ncol = 3, nrow = length(unique_sp)))
names(bat_taxonomy) <- c('Species', 'genus', 'family')
bat_taxonomy$Species <- unique_sp
for(i in 1:nrow(bat_taxonomy)){
  print(bat_taxonomy[i,]$Species)
  bat_taxonomy[i,]$genus <- tax_name(query = paste0(bat_taxonomy[i,]$Species), get = "genus", db = "ncbi")$genus
  Sys.sleep(30)
  bat_taxonomy[i,]$family <- tax_name(query = paste0(bat_taxonomy[i,]$Species), get = "family", db = "ncbi")$family
  Sys.sleep(30)
}



for(i in 1:length(bat_accesion_names)){
  print( bat_accesion_names[i])
  bat_sequences <- read.GenBank(bat_accesion_names[i]) #read sequences and place
  df_bats[i,]$Accesion_number <- names(bat_sequences)
  df_bats[i,]$Species <- attr(bat_sequences, "species")
  tax_name(query = paste0(df_bats[i,]$Species), get = "genus", db = "ncbi")
  tax_name(query = paste0(df_bats[i,]$Species), get = "family", db = "ncbi")
  
  Sys.sleep(10)
}


tax_name(query = "Helianthus annuus", get = "genus", db = "ncbi")


bat_sequences <- read.GenBank(bat_accesion_names)
bat_sequences_GenBank_IDs <- paste(attr(bat_sequences, "species"), names
                                       (bat_sequences), sep ="_RAG1_")
write.dna(lizards_sequences, file ="lizard_fasta_1.fasta", format = "fasta", append =
            FALSE, nbcol = 6, colsep = " ", colw = 10) 
# http://www.jcsantosresearch.org/Class_2014_Spring_Comparative/pdf/week_2/Jan_13_15_2015_GenBank_part_2.pdf



attributes(bat_sequences) #see the list of attributes and contents  


bat_sequences <- read.GenBank(bat_accesion_names) #read sequences and place




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
# Read in the sequences:
read.GenBank 




grep(> )

> After the carrot finishes with a space ,; replace with whatever is in the curly bracket




