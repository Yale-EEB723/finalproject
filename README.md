# Final Project

Gene evolution in some awesome bats

# Quick github notes:
 git status
git save
git commit -am "first change during class"
git push
git add .

## Introduction

This is a final project for the [Comparative Genomics](https://github.com/Yale-EEB723/syllabus) seminar in the spring of 2019.

#### This project aims to study the evolution of immune genes in bats using a published referenced genome and several bat genomes from the 1k Bat project.

## The goal

The goal was to perform a comparative analysis of bat genomes to study the evolution of immune genes. I will further search for signs of positive selection or contraction in these genes by performing genes trees including other mammal genomes (mouse, human, pig, cow, horse).
Update: I only managed to assess the first of these two objectives. I analyzed immune genes in the bat family Myotis and further in the entire Chiroptera species gorup.
Update: I have deleted most of my past readme file as most of the steps that I planned on doing at the beginning of the projects I was unable to archieve.

## The data

### Bat species:
Full list obtained from https://bat1k.ucd.ie/species-database/

### Reference genome:
For reference genomes we will use high-quality assembly of Myotis lucifugus. I downloaded the data from NCBI using the UCSC genome browser XXX. Further, I downloaded the data from Ensembl.

### Available bat genomes:
Bat genomes will be obtained from the Bat1K genome sequencing initiative through the UCSC genome browser. Currently, there a 14 species of bat with genome assemblies in NCBI. The quality and completeness of all genome varies greatly. I will utilize these bat genomes and available mammal genomes such as pig, mouse, human, horse and cattle.
### Phylogenetic tree:
We will make use of Mammal phylogenetic tree (Upham and Jetz 2019). I used this tree to identify a suitable outgroup for the family Myotis and for all Chiroptera in general.
### Immune genes
#### Innate immune genes:
We will look at the Toll Like Immune Receptors (TLR) genes. I will look at genes identified in (Zhang et al. 2011 Science). My class project is strongly influenced by this paper. However, at the time of the manuscript, there were only two bat genomes.
I ended up looking at TLR 7 for a single bat species Myotis, and all TLR genes for Chiroptera.
## Background

###Zoonosis

Most human emerging infectious diseases across the world are zoonotic. Especially Viruses ocurring in mammals are of major concern. Examples include Anthrax, Birdflu and Ebola (Karesh et al. 2012, Olival et al. 2018). Thus, it is of primary concern to understand the drivers and patterns of viral biodiversity in wild animals (Oliver et al. 2018) and the evolution.
###Bats as vectors of disease
It is important to understand how vectors of zoonosis have evolved their immune genes for difference against virulence, and key ecomorpholocial traits crucial for their survival. Bats are unique among mammals; their ability to fly, longevity, echolocation abilities and immunity systems set them apart from all other mammals (XXX, XXX, XXX). Bats have been identified as the most virulent mammalian group (Olival et al. 2018), are distributed across all continents except for Antartica with aproximately 1300 species (over 10 percent of all mammals) (Bat diversity world paper). The niche specialization certain bat species might have been driven by the diversity of their innate immune genes, olfactory receptors (Hayden et al. 2014) and echo location genes (XXX).
In this project, we investigated gene evolution of XLY immune genes in a group of XYZ bat species. We further studied which set of genes are subject to positive selection in bats dN/dS).


## Methods
I will work with published data, mostly located in the 1K Bat genome project and NCBI. I plan on doing a compatisson of bat genomes with other mammal species (utilize published genomes) to study the evolution of immune genes genes.  Following Zheng et al. (2011), I also expect that bat and viruses coexistance across long timescales to have influenced selective pressure on bat genomes. Especially on immune genes.

Downloaded bat genome of Myotis lucifugus
Identified that I need TLR genes 3, 7, 8 and 9
In NCBI I performed a query of "gene" -> "Toll Like Receptor" AND Myotis lucifugus. Stored locally as gene_results.txt

# --- --- --- --- --- --- --- --- --- --- --- ---
[A] Getting the sequence data
# --- --- --- --- --- --- --- --- --- --- --- ---
# Go to NCBI Protein:
[1] Type in TLR7,TLR5,TLR3,TLR8,TLR9 Myotis
Type in NCBI Protein: Toll-like receptor Chiroptera
Type in NCBI Protein: interleukin 1 receptor Homo sapiens. This will serve as the outgroup
Download them all together as .FASTA
# --- --- --- --- --- --- --- --- --- --- --- ---
# [B] Combine TLR and outgroup .fasta files into a single one
# --- --- --- --- --- --- --- --- --- --- --- ---
# For alignment we have to put the ingroup (TLR genes) and the outgroup .fasta sequences into a single file.
INDIR=/Users/diegoellis/projects/development/Comparative_genomics/finalproject/Data/All_TLR
cat $INDIR/all_TLR_chiroptera.fasta $INDIR/interleukin_1_receptor_Homo_sapiens.fasta >$INDIR/ingr_outgr_TLR.fasta

# --- --- --- --- --- --- --- --- --- --- --- ---
# [C] Blast the downloaded sequences against the entire NCBI databases
# --- --- --- --- --- --- --- --- --- --- --- ---

To confirm the predicted and low quality TLR protein sequences
BlastP
I did this for TLR 3,4,5,7

# --- --- --- --- --- --- --- --- --- --- --- ---
# [D] Alignment with mafft
# --- --- --- --- --- --- --- --- --- --- --- ---

Alignment was conducted using Mafft. See script XXX
# --- --- --- --- --- --- --- --- --- --- --- ---
# [E] Trimming
# --- --- --- --- --- --- --- --- --- --- --- ---

Triming was conducted using Trimal. See script XXX

# --- --- --- --- --- --- --- --- --- --- --- ---
# [F] Building TLR gene tree
# --- --- --- --- --- --- --- --- --- --- --- ---

Building the tree was conducted using iqtree using a total of 1000 bootstrap replicates and using default settings. For a detailed overview on these settings please see http://www.iqtree.org

Now that we have aligned and trimmed our sequences its time to build our gene tree
We further store a copy of our gene trees into newick format.
For tree building see script XXX

# --- --- --- --- --- --- --- --- --- --- --- ---
# [G] Visualizing the gene tree
# --- --- --- --- --- --- --- --- --- --- --- ---

Visualize the gene tree with ete3 (python plugin) or with ggtree and ape (R)
Please see script XXX

### Next steps:
I would like to identify signs of gene contractions or expansion and look at signs of positive or negative selection of TLR genes within the Chiroptera species group. I would further use tools such as Mr. Base or R packages such as picante and ape for phylogenetic analysiss. Further I would use CAFE: A computational tool to study gene family evolution (De Bie et al. 2006).
I hope that this comparative analysis allows me to better understand the evolution of key innate immune genes across several bat species.


## Assessment

Was it successful in achieving the initial goal?

Given that the main goal I had for this class was to obtain a better understanding of compartive genomics; I think I archieved this initital goal. I came in with very limited knowledge, but great interest in this quickly developing field.
Regarding my research project, I have to admit that I encountered major barriers along the way. Especially at the very beginning it was overwhelming to know where to even start to get the data.

The major obstacles I encountered were: (1) Actually understanding logical workflows and pipelines to get from my question to any sort of results and insights based on these results.
(2) Watch and read countless tutorials of a large variety of tools and packages to employ for obtaining sequences, annotating, trimming, building phylogenetic trees and visualizing them.
(3) Installing packages and making them work was a large hurdle.
(4) Overall, I wish I had performed the final step of my project which was to study the evolution of these gene trees.
(5) I would have perhaps taken a introductory course on bioinformatics specific for analysing sequence data prior to this course (to learn more about NCBI, BLAST, how to deal with sequence data in general, QC of Fasta files, etc)
(6) I explain future direcitons extensively in my powerpoint. But as mentioned above, I owuld like to study genee evolution of immune genes in bats. Further I am interested in cmbining phylogeographic models of viruses transmited by bats with movement and habitat connectivity models of zoonotic vectors (i.e. ebola carrying fruit bats in Africa) to better forecast potential zoonotic spillover effects in the future.
