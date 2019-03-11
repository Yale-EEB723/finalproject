---
title: "compgen final project"
output: pdf_document
bibliography: Bib.bib
csl: plos.csl
---


# Final Project

Hi C!  


## Introduction

This is a final project for the [Comparative Genomics](https://github.com/Yale-EEB723/syllabus) seminar in the spring of 2019. I aim to perform synteny analysis to search for 'neural' genes that have been lost in sponge or ctenophore genomes.

## The goal

Our goal is to classify whether absences for particular 'neural' genes in sponges and ctenophores are ancestral (i.e. gene was never there) or secondary.  

I must first determine whether my genes of interest are found within conserved blocks of synteny in other animals. If absence in a particular taxon is ancestral, I would expect that the genes defining the synteny block not to be co-localized. If absence is secondary, I expect to find conservation of the synteny block in the absence of the gene of interest.  

## The data

- Data source: Published, and unpublished but publically available    
So far have:  [NOTE: couldn't add to public fork via git lfs]  
-Mnemiopsis leidyi genome [@Ryan2013](https://www.ncbi.nlm.nih.gov/assembly/GCA_000226015.1/)  
-Pleurobrachia bachei genome [@Moroz2014](https://www.ncbi.nlm.nih.gov/assembly/GCA_000695325.1)  
-Amphimedon queenslandica genome [@Srivastava2010](https://www.ncbi.nlm.nih.gov/assembly/GCF_000090795.1)   
-Oscarella carmela [@Nichols2012](http://www.compagen.org/datasets.html) - choose "OCAR" not "Oscarella sp.". See presence/absence of 'neural' gene table (Fig. 3) in Riesgo et al., 2014 [@Riesgo2014](https://doi.org/10.1093/molbev/msu057)   

These genomes were selected because there are presence/absence lists of 'neural' genes readily available for them.  

Other genomes to use (probably): Salpingoeca rosetta, Monosiga brevicollis, Trichoplax (can use as positive control?), Nematostella vectensis, Hydra magnipapillata, Homo sapiens.  

- Data structure: FASTA files, GFF3 files, contingency table of presence/absence of 'neural' genes. More?  

## Background
While biologists characterize most animals by what they have, non-bilaterians are sometimes characterized by what they don't have. In sponges, traditionally these absences have been considered ancestral, an assumption contributing to their primitive image.  

One timely discussion is whether sponges have lost a nervous system. The flip side of this debate, that ctenophores have a convergent one, also rests on assumptions of absence - because ctenophores lack many fundamental 'neural' genes they must use a very different mechanism. For both animals, it may be productive to first understand whether these absences are ancestral or secondary. This would be valuable for inferring whether the LCA of metazoans may have had a bilaterian-like sensory/coordinating system.  

Synteny analysis provides one method of determining loss. In particular, the ghost locus hypothesis suggests that in the case of gene loss, the synteny surrounding the locus of the gene may be preserved even in the absence of the gene itself @Ramos2012. I will look for the ghost loci of absent 'neural' genes in sponges and ctenophores using synteny analysis.  


## Methods
There are very few papers that look into synteny of non-bilaterians. The ones that have take a manual approach to synteny analysis, looking only at one or two 'targets' at a time. The paper I am modelling my approach off of is (Ramos et al. 2012)[https://doi.org/10.1016/j.cub.2012.08.023], the original 'ghost locus' paper that examined sponges and placozoans for synteny.  

The paper starts with a list of neighbour genes known to be syntenic with their gene of interest (GOI) in humans. They then classified all genes in their genomes of interest as being orthologous to neighbour genes, orthologous to non-neighbour genes, or species-specific. Then, to identify significant clustering they used the exact binomial test to test whether the observed number of neighbour gene orthologues co-localizing to a scaffold is significantly higher than the expected number.  

However for Amphimedon they also (or instead?) did a Monte Carlo simulation, where they simulated the null distribution of neighbour genes in the absence of synteny. I'm not completely sure why they also did this MC, but perhaps because the Amphimedon scaffolds are sub-chromosomal? The p-value for a test of clustering is calculated as the proportion of simulations in which the number of scaffolds occupied by neighbour genes is less than or equal to the actual number observed. This was described in the Ramos supplement, and most of it seems to make sense to me, but not everything. For instance they say that the results are stored in an "amphisimulation" relational database, but what is that?! Google only brings up that paper and 3 random websites.  


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