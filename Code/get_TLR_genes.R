# --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
# 
# --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
# In NCBI gene search:
# (Toll Like receptor) AND Myotis lucifugus 
# Look at TLR 3, 7, 8 and 9
library(ape)
packageVersion("ape")
#import each sequence list from its CSV file
#NO "strings as factor"
#coi <- read.table("C:/MyWorkingDirectory/csv_lists/coi.csv", quote="\"", stringsAsFactors=FALSE)
#name them: 
#coi      =coi
#cytb     =cyt
gene_results <- read.table('/Users/diegoellis/Downloads/gene_result.txt', sep="\t", header=TRUE)
head(gene_results)

# Now that I have the GeneID:
TLR_genes<-read.GenBank(gene_results$GeneID)
str(TLR_genes) #a list of the DNAbin elements with length of the sequences 
#notice the one of the attributes is the species names 

head(gene_results)
# Download SUMAC
# Figure out how to use SUMAC! -> Install the python package
# 

efetch -db gene -format fasta -id 102427949 > my_seqs.faa



python -m sumac -d anml -i Vespertilionidae -o 	Myotinae



python -m sumac -d # mammal -i Onagraceae -o Lythraceae -g 





require('biomartr')
getGO(organism = ‘Homo sapiens’,
      genes = ‘GUCA2A’,
      filters = ‘hgnc_symbol’)


# The problem now is that within each object, sequences are still listed by GenBank accession number. It would be much more convenient to replace the name of each list with the name of the species. This becomes even more crucial if you work with multiple gene sequences and want to use a supermatrix for tree inference: at some point you'll need to concatenate all the gene sequences for all the species (e.g. using a program like SequenceMatrix). This is really only feasible if each sequence is named according to the species from which it comes.

# We'll now extract metadata (species' names and GenBank numbers) from each of these objects into user-friendly data.frame objects. From each new data.frame, we will extract the species' names and apply them to the sequences using the base R function attr():

names_TLR_genes <- data.frame(species = attr(TLR_genes,"species"),
                        accs = names(TLR_genes))
names(names_TLR_genes) <- attr(names_TLR_genes,"species")
names_cyt <- data.frame(species = attr(cytgen,"species"),
                        accs = names(cytgen))
names(cytgen) <- attr(cytgen,"species")


write.dna(coigen,"renamed_COI.fasta", format="fasta")
write.dna(cytgen,"renamed_CYTB.fasta", format="fasta")


