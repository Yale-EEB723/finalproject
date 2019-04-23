---
title: "compgen final project"
output: pdf_document
bibliography: Bib.bib
csl: plos.csl
---


# Final Project

Hi C!  


## Introduction

This is a final project for the [Comparative Genomics](https://github.com/Yale-EEB723/syllabus) seminar in the spring of 2019. I aim to establish gene loss across broad evolutionary distances by synteny analysis. I will take a macrosynteny approach, establishing synteny and subsequently searching for gene loss between distantly related taxa at the whole-scaffold level.  

## The goal



Ultimately, our goal is to classify whether absences for particular 'neural' genes in sponges and ctenophores are ancestral (i.e. gene was never there) or secondary. I must first determine whether my genes of interest are found within conserved blocks of synteny in other animals. If absence in a particular taxon is ancestral, I would expect that the genes defining the synteny block not to be co-localized. If absence is secondary, I expect to find conservation of the synteny block in the absence of the gene of interest.  

**However, BEFORE I can answer this I must answer:**    
Are genomes contiguous enough to identify synteny?    
Is synteny preserved across non-bilaterian genomes?  
_These are the new goals of my project_  

## The data


## Background
While biologists characterize most animals by what they have, non-bilaterians are sometimes characterized by what they don't have. In sponges, traditionally these absences have been considered ancestral, an assumption contributing to their primitive image.  

One timely discussion is whether sponges have lost a nervous system. The flip side of this debate, that ctenophores have a convergent one, also rests on assumptions of absence - because ctenophores lack many fundamental 'neural' genes they must use a very different mechanism. For both animals, it may be productive to first understand whether these absences are ancestral or secondary. This would be valuable for inferring whether the LCA of metazoans may have had a bilaterian-like sensory/coordinating system.  

Synteny analysis provides one method of determining loss. In particular, the ghost locus hypothesis suggests that in the case of gene loss, the synteny surrounding the locus of the gene may be preserved even in the absence of the gene itself @Ramos2012. I will look for the ghost loci of absent 'neural' genes in sponges and ctenophores using synteny analysis.  

However before we can establish loss by synteny analysis, we must first establish that non-bilaterian genomes are contiguous enough to perform synteny analysis, and whether syntenic blocks exist.  

##Goals  
1. Need at least 3 genes to identify a ghost locus (two bounding to anchor, centre one is gene of interest). Determine within species distribution: histogram of no. genes per contig per species  
2. identify homologous genes across genomes - if annotation is the same as cell type data import cell tyeps results; if not import gene models as proteins and run agalma. 
3. Layer/combine ortholog IDs over the GFF3 file.   
3. ID scaffolds that do not possess all orthologs another animal's scaffolds have.  

-use synteny to refine this pic of gene loss -> have region of genome where gene usually is ,and it's missing (vs presene/absence)

## Methods


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