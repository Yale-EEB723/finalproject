---
title: "compgen final project"
output: pdf_document
bibliography: Bib.bib
csl: plos.csl
---


# Final Project

Hi C! (Get it?!!)     



## Introduction

This is a final project for the [Comparative Genomics](https://github.com/Yale-EEB723/syllabus) seminar in the spring of 2019. I aim to perform synteny analysis to search for 'neural' genes that have been lost in sponge or ctenophore genomes.

## The goal

Our goal is to classify whether absences for particular 'neural' genes in sponges and ctenophores are ancestral (i.e. gene was never there) or secondary.  

I must first determine whether my genes of interest are found within conserved blocks of synteny in other animals. If absence in a particular taxon is ancestral, I would expect that the genes defining the synteny block not to be co-localized. If absence is secondary, I expect to find conservation of the synteny block in the absence of the gene of interest.  

## The data

- Data source: Published, and unpublished but publically available    
So far have:  [NOTE: couldn't add to public fork via git lfs]  
-Mnemiopsis leidyi genome [@Ryan2013]  
-Pleurobrachia bachei genome [@Moroz2014]  
-Amphimedon queenslandica genome [@Srivastava2010]  
-Oscarella carmela [@Nichols2012]. See presence/absence of 'neural' gene table in Riesgo et al., 2014 [@Riesgo2014]  

These genomes were selected because there are presence/absence lists of 'neural' genes readily available for them.  

Other genomes to use (probably): Salpingoeca rosetta, Monosiga brevicollis, Trichoplax (can use as positive control?), Nematostella vectensis, Hydra magnipapillata, Homo sapiens.  

- Data structure: FASTA files, GFF3 files, contingency table of presence/absence of 'neural' genes. More?  

## Background
While biologists characterize most animals by what they have, non-bilaterians are sometimes characterized by what they don't have. In sponges, traditionally these absences have been considered ancestral, an assumption contributing to their primitive image.  

One timely discussion is whether sponges have lost a nervous system. The flip side of this debate, that ctenophores have a convergent one, also rests on assumptions of absence - because ctenophores lack many fundamental 'neural' genes they must use a very different mechanism. For both animals, it may be productive to first understand whether these absences are ancestral or secondary. This would be valuable for inferring whether the LCA of metazoans may have had a bilaterian-like sensory/coordinating system.  

Synteny analysis provides one method of determining loss. In particular, the ghost locus hypothesis suggests that in the case of gene loss, the synteny surrounding the locus of the gene may be preserved even in the absence of the gene itself @Ramos2012. I will look for the ghost loci of absent 'neural' genes in sponges and ctenophores using synteny analysis.  


## Methods
Synteny analysis to search for ghost loci of absent 'neural' genes in sponges and ctenophores. I don't know how to do this yet...but I will learn!! 


## Results


## Discussion  
Some major assumptions:  
- surrounding syntenic block does not exist before the emergence of the gene itself.  
- there IS conservation of synteny around these genes across taxa.  


## Assessment

Was it successful in achieving the initial goal?

What are the main obstacles encountered?

What would you have done differently?

What are future directions this could go in?

## References