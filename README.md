# Final Project

Gene evolution in some awesome bats

# Quick github notes:
 git status
git save
git commit -am "first change during class"
git push
git add .

## Instructions
repository settings so that others in the class (including the professor) can provide feedback. To submit the project, send a pull request to the original repository.

Add all code to your project repository, including shell scripts, R analyses, python, etc.

Do not commit large data files to the repository. Provide paths to where they can be downloaded if they
are from public sources, or track them with [git-lfs](https://git-lfs.github.com).

## Introduction

This is a final project for the [Comparative Genomics](https://github.com/Yale-EEB723/syllabus) seminar in the spring of 2019.

#### This project aims to study the evolution of immune genes in bats using a published referenced genome and several bat genomes from the 1k Bat project.

 This project (a very brief, ie 1-2 sentence, overview of the project)...
## The goal

The goal was to perform a comparative analysis of bat genomes to study the evolution of immune genes. I will further search for signs of positive selection or contraction in these genes by performing genes trees including other mammal genomes (mouse, human, pig, cow, horse).

## The data

### Bat species:
Full list obtained from https://bat1k.ucd.ie/species-database/

### Reference genome:
For reference genomes we will use high-quality assembly of Myotis lucifugus. I downloaded the data from NCBI using the UCSC genome browser XXX. Further, I downloaded the data from Ensembl.

### Available bat genomes:
Bat genomes will be obtained from the Bat1K genome sequencing initiative through the UCSC genome browser. Currently, there a 14 species of bat with genome assemblies in NCBI. The quality and completeness of all genome varies greatly. I will utilize these bat genomes and available mammal genomes such as pig, mouse, human, horse and cattle.
### Phylogenetic tree:
We will make use of Mammal phylogenetic tree (Upham and Jetz 2019)
### Immune genes
#### Innate immune genes:
We will look at the Toll Like Immune Receptors (TLR) genes. I will look at genes identified in (Zhang et al. 2011 Science). My class project is strongly influenced by this paper. However, at the time of the manuscript, there were only two bat genomes.
#### Adaptive immune genes:
We will look at the Immunoglobulin E (IgE) genes across bat species.
### Building a gene tree
Use agalma? https://bitbucket.org/caseywdunn/agalma.git
### Testing accuracy of resulting gene predictions:
Sensitivity, specificity and accuracy of predictions.

- Data source (simulated/ published/ unpublished?)
- Data structure

## Background

###Zoonosis

Most human emerging infectious diseases across the world are zoonotic. Especially Viruses ocurring in mammals are of major concern. Examples include Anthrax, Birdflu and Ebola (Anthrax paper XXX, Karesh et al. 2012 The Lancet, Nature Olival et al. 2018). Thus, it is of primary concern to understand the drivers and patterns of viral biodiversity in wild animals (Oliver et al. 2018, 5-6) and the evolution . 
###Bats as vectors of disease
It is important to understand how vectors of zoonosis have evolved their immune genes for difference against virulence, and key ecomorpholocial traits crucial for their survival. Bats are unique among mammals; their ability to fly, longevity, echolocation abilities and immunity systems set them apart from all other mammals (XXX, XXX, XXX). Bats have been identified as the most virulent mammalian group (Olival et al. 2018), are distributed across all continents except for Antartica with aproximately 1300 species (over 10 percent of all mammals) (Bat diversity world paper). The niche specialization certain bat species might have been driven by the diversity of their innate immune genes, olfactory receptors (Hayden et al. 2014) and echo location genes (XXX).
In this project, we investigated gene evolution of XLY immune genes in a group of XYZ bat species. We further studied which set of genes are subject to positive selection in bats dN/dS).

Motivation for the project....

How it fits in with other work...

What the reader needs to know to understand the project

## Methods
I will work with published data, mostly located in the 1K Bat genome project and NCBI. I plan on doing a compatisson of bat genomes with other mammal species (utilize published genomes) to study the evolution of immune genes genes.  Following Zheng et al. (2011), I also expect that bat and viruses coexistance across long timescales to have influenced selective pressure on bat genomes. Especially on immune genes.

## Casey: I have some troubled identifying which methods to use to answer my questions at the moment.

### Data visualization:
I will use the UCSC genome browser to visualize genome assembly and structural annotation.

### Comparative analysis:
ZZZ
### Genome Annotation
#### The algorithm to be used
Use XXX algotithm for alignment
#### Phylogenomic analysis:
Either maximum likelihood or bayesian gene trees and estimate divergence times and speciation rates and identify most recent common ancestor.

#### Phylogenetic comparative analysis:
Mr Base and R (e.g. picante,ape) for phylogenetic analysis

## Expected Results

I hope that this comparative analysis allows me to better understand the eovlution of key genes across several bat species.

### Size of all bat genomes assessed.



## Assessment

Was it successful in achieving the initial goal?

What are the main obstacles encountered?

What would you have done differently?

What are future directions this could go in?


Quote:
Bats are also exceptionally long lived given their small size and high metabolic rate. In fact, in relation to body size, only 19 species of mammal are longer lived than humans,18 of these species are bats, living up to 10 times longer than expected given their small size and high metabolic rate.

## References
Shen et al. 2012 Plos genetics

Li et al. 2010 Current Biology

Upham and Jetz bioRchiv

Olival et al. 2018 Nature

Karesh et al. 2012

Anthrax Paper

Harisson et al. 2018 Nat Eco Evo

Hayden et al. 2014

## Notes to self
Bat species in brasil: https://www.sbeq.net/updatelist
Ecuador: https://bioweb.bio/faunaweb/mammaliaweb/IndiceTaxonomico
Go to taxonomy browser of NCBI -> type in a clade ->
https://www.ncbi.nlm.nih.gov/Taxonomy/Browser/wwwtax.cgi?id=9397
G10K vertebrate have good curated genomes.
### Idea:
Galapagos torotises nature eco evo paper identified sites of longevity in animals. Could it be the same zones as in bats (also super longevity species).
