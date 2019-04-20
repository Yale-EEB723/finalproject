## The data  
All genomes and gff3 files were downloaded from Ensembl. In general, only the toplevel assembly was available, so all synteny analysis was run on either toplevel or primary assemblies. GFF3 statistics were run on chromosomal level assemblies for Drosophila, Danio, Homo and Taeniopygia since the presence of many short scaffolds lacking annotated genes produced misleading results.  

**The genome versions I used:**    
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

```
{r preliminaries}
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

The human and zebrafish fastas were too large to run through this code, but median scaffold length was found online. The many small unplaced scaffolds in the Drosophila toplevel assembly reduced median scaffold length, so only chromosomes were used.  

```
{r distr scaffold length}
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

```
{r count no genes per contig/scaffold}
#install.packages("ape")

gff3_dir<-"data/genomes/gff3/"
gff3<-c("Amphimedon_queenslandica.Aqu1.42.gff3","Capitella_teleta.Capitella_teleta_v1.0.42.gff3","Danio_rerio.GRCz11.96.chr.gff3","Drosophila_melanogaster.BDGP6.22.96.chr.gff3","Helobdella_robusta.Helro1.42.gff3","Homo_sapiens.GRCh38.96.chr.gff3","Lottia_gigantea.Lotgi1.42.gff3","Mnemiopsis_leidyi.MneLei_Aug2011.42.gff3","Nematostella_vectensis.ASM20922v1.42.gff3","Strongylocentrotus_purpuratus.Spur_3.1.42.gff3","Taeniopygia_guttata.taeGut3.2.4.96.chr.gff3","Trichoplax_adhaerens.ASM15027v1.42.gff3")

for (blah in gff3){
  
gff3_path<-paste0(gff3_dir,blah)
contig.gene.df <- ape::read.gff(file=gff3_path, GFF3=TRUE) %>% select(.,"seqid","type","start","end") %>% filter(.,type == "gene")

#for histogram, take just the contig names and gene counts
gene.count<- as.data.frame(table(contig.gene.df$seqid))

#plot frequency of frequencies
gff3.plot<-ggplot(data = gene.count, aes(x=gene.count$Freq)) + geom_histogram(binwidth=1) + geom_vline(xintercept = 3,color="red")+ggtitle(blah)
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
### Prep sequences for Agalma  
#### Simplify sequence names  
Download genome protein sequences from Ensembl. Agalma cuts off sequence names after the first space. Also, for certain genomes, the gene name, peptide name, and transcript do not follow a simple pattern and are not easily derived from each other. Simplify sequence names to this format:  
`>p:protID:s:scaffoldID:g:geneID:t:transID`  

To simpify, use Regex "Find":  
Amphimedon:  
>`>(.*?)@pep@scaffold:Aqu1:(Contig\w+):\w+?:\w+?:.*?@gene:(.*?)@transcript:(.*)@gene_biotyp.*`  

Capitella:  
>`>(.*?)@pep@supercontig:Capitella_teleta_v1.0:(CAPTEscaffold_\w+?):\w+?:\w+?:.*?@gene:(.*?)@transcript:(.*?)@.*?$`  

Danio:    
>`>(.*?)@pep@chromosome:GRCz11:(\w+):\w+?:\w+?:.*?@gene:(.*?)@transcript:(.*)@gene_biotype.*`  

Drosophila:    
>`>(.*?)@pep@chromosome:BDGP6:(\w+):\w+?:\w+?:.*?@gene:(.*?)@transcript:(.*)@gene_biotyp.* `  
  
Helobdella:  
>`>(.*?)@pep@supercontig:Helro1:(\w+):\w+?:\w+?:.*?@gene:(.*?)@transcript:(.*)@gene_biotyp.*`  

Homo:   
-need chromosome version AND scaffold version    
>`>(.*?)@pep@scaffold:GRCh38:(.*):\w+?:\w+?:.*?@gene:(.*?)@transcript:(.*)@gene_biotyp.*`    
`>(.*?)@pep@chromosome:GRCh38:(.*):\w+?:\w+?:.*?@gene:(.*?)@transcript:(.*)@gene_biotyp.*`   
 
Danio:    
>`>(.*?)@pep@chromosome:GRCz11:(\w+):\w+?:\w+?:.*?@gene:(.*?)@transcript:(.*)@gene_biotyp.*`    
`>(.*?)@pep@scaffold:GRCz11:(.*):\w+?:\w+?:.*?@gene:(.*?)@transcript:(.*)@gene_biotyp.*`    

Lottia:  
>`>(.*?)@pep@supercontig:Lotgi1:(.*):\w+?:\w+?:.*?@gene:(.*?)@transcript:(.*)@gene_biotyp.*`  
  
Mnemiopsis:     
>`>(.*?)@pep@supercontig:MneLei_Aug2011:(.*):\w+?:\w+?:.*?@gene:(.*?)@transcript:(.*)@gene_biotyp.*`    
`>(.*?)@pep@chromosome:MneLei_Aug2011:(.*):\w+?:\w+?:.*?@gene:(.*?)@transcript:(.*)@gene_biotyp.*`    

Nematostella:  
>`>(.*?)@pep@supercontig:ASM20922v1:(.*):\w+?:\w+?:.*?@gene:(.*?)@transcript:(.*)@gene_biotyp.*`    

Strongylocentrotus:    
>`>(.*?)@pep@supercontig:Spur_3.1:(.*):\w+?:\w+?:.*?@gene:(.*?)@transcript:(.*)@gene_biotyp.*`    

Taeniopygia:  
>`>(.*?)@pep@chromosome:taeGut3.2.4:(.*):\w+?:\w+?:.*?@gene:(.*?)@transcript:(.*)@gene_biotyp.*`    

Trichoplax:  
>`>(.*?)@pep@scaffold:ASM15027v1:(.*):\w+?:\w+?:.*?@gene:(.*?)@transcript:(.*)@gene_biotyp.*`  


Then, Replace with `>p:\1:s:\2:g:\3:t:\4`.  

#### Select longest peptide only  
From comparing the number of gene entries in the gff3 file vs number of peptide sequences, it is clear that many genes have more than one peptide associated with it.  
no. genes: `grep "gene:" gff3.gff3|wc -l`  
no. peptides: `grep ">" pepfile.fasta|wc -l`  
Create a fasta where each gene has only 1 peptide sequence. Choose the longest peptide.  

The below code was modified from code by [story (Jan 9'17')](https://bioinformatics.stackexchange.com/questions/595/how-can-longest-isoforms-per-gene-be-extracted-from-a-fasta-file) and [nassimhddd (Jul 18 '16)](https://stackoverflow.com/questions/24237399/how-to-select-the-rows-with-maximum-values-in-each-group-with-dplyr). 

```
{r longest pep only}
#install bioconductor 3.8 https://www.bioconductor.org/install/  
#install Biostrings: BiocManager::install("Biostrings", version = "3.8") ; do not update mclust because it will have a warning and then biostrings module not installed.  

#~~~~~ Beginning of 'story''s code.~~~~~

## read your fasta in as Biostrings object
fasta.s <- readDNAStringSet("./data/sample_data/fasta_sample.fasta")

## get the read names (in your case it has the isoform info)
names.fasta <- names(fasta.s)

## extract only the relevant gene and isoform (JM: aka pep) id (split name by the period symbol)
#JM: modify line to fit my name format
gene.iso <- sapply(names.fasta,function(j) cbind(unlist(strsplit(j,'\\:'))[1:8]))

## convert to good data.frame = transpose result from previous step and add relevant column names
gene.iso.df <- data.frame(t(gene.iso))
#JM: alter to put your own column names in:
colnames(gene.iso.df) <- c('p','pepID','s','scaffID','g','geneID','t','transID')
gene.iso.df<-select(gene.iso.df, geneID, pepID)

## and length of isoforms
gene.iso.df$width <- width(fasta.s)

#Did not use rest of code.
#~~~~~ End of 'story''s code.~~~~~

#JM:
gene.iso.df<-rownames_to_column(gene.iso.df)

#~~~~~beginning of code by nassimhddd (Jul 18 '16) Stackoverflow~~~~~
longest.pep.df <-gene.iso.df%>%group_by(geneID)%>%mutate(the_rank = rank(-width,ties.method="random")) %>%filter(the_rank==1)%>%select(-the_rank)
#~~~~~End of nassimhddd's code.~~~~~

list<-longest.pep.df[,1,drop=FALSE]
write.csv(list,"longestpep_list.txt",quote=FALSE,row.names=FALSE)
```   

The code above produces a list of all of the longest peptide per gene. Use the below Python script I wrote to pull out each sequence in the list. The fasta headers in this list must perfectly match those in the fasta file, and names must be in a single column with no column header.

```
#! /usr/bin/env python
import sys
import re

#def
identity = 0.0
Namefile = []
keep = False

#pull out sequences from a fasta file by name
#usage: fasta_puller.py <listofseqnames> <fastafile.fasta>  
#seq names should be listed in a single column and must exactly match fasta headers.

#open the file with list of sequence names 
#put each name into the list Namefile
File = sys.argv[1]
File = open(File, 'rU')
for Line in File:
	Line = Line.strip('\n')
	Namefile.append(Line)
File.close()

#open the transcriptome file from which sequences are to be pulled from
#since names must match exactly, if you have >TR_blah_blah|cblah_gblah_iblah as name only must alter fastsa names to match 

File = sys.argv[2]
File = open(File, 'rU')
for Line in File:
	Line = Line.strip('\n')
	
	if Line[0]==">":				#for name lines
		keep = False
		for Name in Namefile:
			if Name == Line:
				print Name
				keep = True
				#Namefile.remove(Name)	#hash out if working with gene names only, but want to keep multiple isoforms
	if Line[0] != ">":				#for non-name, ATCG lines
		if keep == True:
			print Line

``` 

### Run Agalma
A single run-through of Agalma consists of three scripts:    
**1. Catalog the fasta files**  
```
#!/bin/bash
#SBATCH --partition=general
#SBATCH --job-name=agalma_catalog_compgen_noNA_nohydra
#SBATCH -c 1
#SBATCH --mem-per-cpu=6G
#SBATCH --time=0-02:00:00
#SBATCH --mail-type=ALL

export AGALMA_DB="./compgen_homologs_nohydra.sqlite"

source activate /gpfs/ysm/project/jlm329/conda_envs/agalma

set -e



agalma catalog insert -p ../pep/Amphimedon_longestpep.fasta -s 'Amphimedon queenslandica' --id 'Aqu_7c2ad7b'
agalma catalog insert -p ../pep/Capitella_longestpep.fasta -s 'Capitella telata' --id 'Cte_aef8c97'
agalma catalog insert -p ../pep/Danio_longestpep.fasta -s 'Danio rerio' --id 'Dre_a1c97d2'
agalma catalog insert -p ../pep/Drosophila_longestpep.fasta -s 'Drosophila melanogaster' --id 'Dme_05eee07'
agalma catalog insert -p ../pep/Helobdella_longestpep.fasta -s 'Helobdella robusta' --id 'Hro_793004c'
agalma catalog insert -p ../pep/Homo_longestpep.fasta -s 'Homo sapiens' --id 'Hsa_f36e9f9'
agalma catalog insert -p ../pep/Lottia_longestpep.fasta -s 'Lottia gigantea' --id 'Lgi_e03f004'
agalma catalog insert -p ../pep/Mnemiopsis_longestpep.fasta -s 'Mnemiopsis leidyi' --id 'Mle_309f7a5'
agalma catalog insert -p ../pep/Nematostella_longestpep.fasta -s 'Nematostella vectensis' --id 'Nve_2427268'
agalma catalog insert -p ../pep/Strongylocentrotus_longestpep.fasta -s 'Strongylocentrotus purpuratus' --id 'Spu_a9c5697'
agalma catalog insert -p ../pep/Taeniopygia_longestpep.fasta -s 'Taeniopygia guttata' --id 'Tgu_290e6b7'
agalma catalog insert -p ../pep/Trichoplax_longestpep.fasta -s 'Trichoplax adhaerens' --id 'Tad_bdc7fb0'
```

**2. Import**
```
#!/bin/bash
#SBATCH --partition=general
#SBATCH --job-name=agalma_import_compgen_nohydra
#SBATCH -c 16
#SBATCH --mem-per-cpu=6G
#SBATCH --time=2-00:00:00
#SBATCH --mail-type=ALL

export AGALMA_DB="./compgen_homologs_nohydra.sqlite"

source activate /gpfs/ysm/project/jlm329/conda_envs/agalma


set -e


export BIOLITE_RESOURCES="threads=16,memory=6G"


agalma import --id Aqu_7c2ad7b --seq_type aa
agalma annotate --id Aqu_7c2ad7b

agalma import --id Cte_aef8c97 --seq_type aa
agalma annotate --id Cte_aef8c97

agalma import --id Dre_a1c97d2 --seq_type aa
agalma annotate --id Dre_a1c97d2

agalma import --id Dme_05eee07 --seq_type aa
agalma annotate --id Dme_05eee07

agalma import --id Hro_793004c --seq_type aa
agalma annotate --id Hro_793004c

agalma import --id Hsa_f36e9f9 --seq_type aa
agalma annotate --id Hsa_f36e9f9

agalma import --id Lgi_e03f004 --seq_type aa
agalma annotate --id Lgi_e03f004

agalma import --id Mle_309f7a5 --seq_type aa
agalma annotate --id Mle_309f7a5

agalma import --id Nve_2427268 --seq_type aa
agalma annotate --id Nve_2427268

agalma import --id Spu_a9c5697 --seq_type aa
agalma annotate --id Spu_a9c5697

agalma import --id Tgu_290e6b7 --seq_type aa
agalma annotate --id Tgu_290e6b7

agalma import --id Tad_bdc7fb0 --seq_type aa
agalma annotate --id Tad_bdc7fb0
```

**3. Homologize, align, and make gene trees**
```
#!/bin/bash
#SBATCH --partition=general
#SBATCH --job-name=agalma_genetrees_compgen_nohydra
#SBATCH -c 16
#SBATCH --mem-per-cpu=6G
#SBATCH --time=6-00:00:00
#SBATCH --mail-type=ALL

# Script must be run from same directory as existing sqlite database
export AGALMA_DB=$(pwd)"/compgen_homologs_nohydra.sqlite"

source activate /gpfs/ysm/project/jlm329/conda_envs/agalma

set -e


export BIOLITE_RESOURCES="threads=16,memory=6G"

ID=CompGen_nohydra

mkdir -p $ID
cd $ID

agalma homologize --id $ID
agalma multalign --id $ID
agalma genetree --id $ID
```

Parse the Agalma output.
```
SELECT DISTINCT
       homology.id          AS homology_id,
       genes.gene           AS gene,
       models.catalog_id    AS catalog_id,
       models.id            AS id,
       homology_models.homology_id,
       homology_models.model_id,
       sequences.model_id,
       genes.model_id
FROM agalma_homology        AS homology        JOIN
     agalma_homology_models AS homology_models JOIN
     agalma_models          AS models          JOIN
     agalma_genes           AS genes          JOIN
     agalma_sequences       AS sequences
     ON homology.id=homology_models.homology_id AND
        homology_models.model_id=models.id AND
        models.id=sequences.model_id AND
        models.id=genes.model_id
ORDER BY homology.id ASC;
```
To run the database query:
`sqlite3 -csv -header homologs.sqlite < query_homology.sql > homology_results.csv`











What to do differently:  
-Top-level assemblies, which can possess many unplaced scaffolds, were used for. Perhaps introducing many low quality scaffolds lead to noise, preventing clustering.  