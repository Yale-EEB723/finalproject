## The data  
All genomes and gff3 files were downloaded from Ensembl. In general, only the toplevel assembly was available, so all synteny analysis was run on either toplevel or primary assemblies. GFF3 statistics were run on chromosomal level assemblies for Drosophila, Danio, Homo and Taeniopygia since the presence of many short scaffolds lacking annotated genes produced misleading results.  

*The genome versions I used:*    
Amphimedon queenslandica: Aqu1
Capitella telata: Capitella telata v1.0  
Danio rerio: GRCz11  
Drosophila melanogaster: BDGP6.22.96   
Helobdella robusta: Helro1  
Homo sapiens: GRCh38  
Lottia gigantea: Lotgi1  
Mnemiopsis leidyi: MneLei_Aug2011  
Nematostella vectensis: ASM20922v1  
Strongylocentrotus pupuratus: Spur_3.1  
Taeniopygia guttata: taeGut3.2.4  
Trichoplax adhaerens:  ASM15027v1  

## Methods  
All code was written in R, except where indicated.  
Load libraries:    

```{r preliminaries}
library( tidyverse )
library(ggplot2)
library(seqinr)
library(ape)
library(Biostrings)
library(dplyr)

#clustering
library(cluster)
library(CrossClustering)
library(vegan)
library(Rtsne)
```

### Genome Statistics  

#### What is the distribution of median assembly scaffold length?  
How fragmented are the genomes?  

The human and zebrafish fastas were too large to run through this code, but median scaffold length was found online. The many small unplaced scaffolds in the Drosophila toplevel assembly reduced markedly median scaffold length, so only chromosomes were used.  

```{r distr scaffold length}
fasta_dir<-"~/Desktop/compgen/repo/ensembl/genome_fasta/"
fasta<-c("Amphimedon_queenslandica.Aqu1.dna.toplevel.fa","Capitella_teleta.Capitella_teleta_v1.0.dna.toplevel.fa","Drosophila_chr.fa", "Helobdella_robusta.Helro1.dna.toplevel.fa","Lottia_gigantea.Lotgi1.dna.toplevel.fa","Mnemiopsis_leidyi.MneLei_Aug2011.dna.toplevel.fa","Nematostella_vectensis.ASM20922v1.dna.toplevel.fa","Strongylocentrotus_purpuratus.Spur_3.1.dna.toplevel.fa","Taeniopygia_guttata.taeGut3.2.4.dna.toplevel.fa","Trichoplax_adhaerens.ASM15027v1.dna.toplevel.fa")

for (blah in fasta){
fasta_path<-paste0(fasta_dir,blah)  

#histogram of call ontig lengths,
scaffold.length.plot<-read.fasta(fasta_path)%>%getLength(.)%>%as.data.frame()%>%ggplot()+geom_histogram(aes(x=.), fill="skyblue3", color="black",binwidth=100)+xlab("Scaffold Length")+labs(title=blah)
scaffold.length.plot

#histogram of contig lengths, restricted to scaffolds < 10,000 bp. 
restricted.plot<-read.fasta(fasta_path)%>%getLength(.)%>%as.data.frame()%>%filter(.<10000)%>%ggplot()+geom_histogram(aes(x=.), fill="skyblue3", color="black",binwidth=100)+xlab("Scaffold Length")+labs(title=blah)
restricted.plot

#stats
fasta.len=read.fasta(fasta_path)%>%getLength()
print(paste("Median scaffold/contig length (bp):",median(as.numeric(fasta.len))))
print(paste("Max scaffold/contig length (bp):",max(as.numeric(fasta.len))))
print(paste("Minimum scaffold/contig length (bp):",min(as.numeric(fasta.len))))
  
}

```

#### How many scaffolds have at least 3 genes?  
To what degree is synteny analysis possible in my genomes? 

The minimum number of genes on a scaffold required for synteny analysis is 3 - two on either side of the gene of interest to serve as anchors in identifying the synteny block, and the gene of interest itself.  

```{r count no genes per contig/scaffold}
#Please replace gff3_sample.gff3 with path to desired gff3 file. GFF3 files can be found in data/genomes/annot

#install.packages("ape")

gff3_dir<-"data/genomes/gff3/"
gff3<-c("Amphimedon_queenslandica.Aqu1.42.gff3","Capitella_teleta.Capitella_teleta_v1.0.42.gff3","Danio_rerio.GRCz11.96.chr.gff3","Drosophila_melanogaster.BDGP6.22.96.chr.gff3","Helobdella_robusta.Helro1.42.gff3","Homo_sapiens.GRCh38.96.chr.gff3","Lottia_gigantea.Lotgi1.42.gff3","Mnemiopsis_leidyi.MneLei_Aug2011.42.gff3","Nematostella_vectensis.ASM20922v1.42.gff3","Strongylocentrotus_purpuratus.Spur_3.1.42.gff3","Taeniopygia_guttata.taeGut3.2.4.96.chr.gff3","Trichoplax_adhaerens.ASM15027v1.42.gff3")

for (blah in gff3){
  
gff3_path<-paste0(gff3_dir,blah)
contig.gene.df <- ape::read.gff(file=gff3_path, GFF3=TRUE) %>% select(.,"seqid","type","start","end") %>% filter(.,type == "gene")

#for histogram, take just the contig names and gene counts
gene.count<- as.data.frame(table(contig.gene.df$seqid))

#plot frequency of frequencies
gff3.plot<-ggplot(data = gene.count, aes(x=gene.count$Freq)) + geom_histogram(binwidth=1) + geom_vline(xintercept = 3,color="red")
gff3.plot

#use for custom axes
#gff3.plot<-ggplot(data = gene.count, aes(x=gene.count$Freq)) + geom_histogram(binwidth=1) + geom_vline(xintercept = 3,color="red") +xlim(0,10)+ylim(0,3000)

#stats
print(blah)

print(paste("proportion contigs with gene count >= 3:",nrow(subset(gene.count, gene.count$Freq >= 3))/nrow(gene.count)*100))

print(paste("Median no. genes/contig:",median(gene.count$Freq)))

print(paste("Max no. genes/contig:",max(gene.count$Freq))) 

}


```



What to do differently:  
-Top-level assemblies, which can possess many unplaced scaffolds, were used for. Perhaps introducing many low quality scaffolds lead to noise, preventing clustering.  