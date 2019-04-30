# Final Project

## Instructions

This repository is a stub for your final project. Fork it as a template for your project, and develop your code in the forked repository. After you fork the repository, please enable the issue tracker in the repository settings so that others in the class (including the professor) can provide feedback. To submit the project, send a pull request to the original repository.

Expand on the readme questions below to provide an overview of the goals, background, and challenges for the final project. You can delete the questions as you write text that answers them, or leave the prompts in place. You can also delete this instruction section of you like.

Add all code to your project repository, including shell scripts, R analyses, python, etc.

Do not commit large data files to the repository. Provide paths to where they can be downloaded if they
are from public sources, or track them with [git-lfs](https://git-lfs.github.com).

## Introduction

This is a final project for the [Comparative Genomics](https://github.com/Yale-EEB723/syllabus) seminar in the spring of 2019. In my project, I seek to answer questions related to a gene cluster in Bacteroides fragilis encoding a bacteriocin likely used as a competitive factor to persist in gut microbial landscapes.

## The goal

The original problems I sought to answer were:

1. to better understand gene cluster occurrence across phylogenies and to determine whether they are gut bacteria restricted

2. to determine the co-occurrence patterns of the genes in question 1466, 1465, 1464, and 2671

3. to identify the genomic island boundaries for this gene cluster

4. to determine amino acid conservation across homologues

5. to understand co-occurrence patterns of other genes specific to cluster (+) and cluster (-) genomes

After assessing feasibility, I focused on aspects of questions 1. and 4., and made attempts at 2.


## The data

I used metagenomic data from a 2019 study that revealed new information about human sample-associated microbes, 77% of which did not yet have assigned genomes in known repositories. This publication is available at the following link:

https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6349461/

and the data are available here:

http://segatalab.cibio.unitn.it/data/Pasolli_et_al.html

I downloaded the 4930 species-level genome bins (SGBs) data as a set of compressed fasta files. I unzipped the folder then, in the command line, navigated to the datafile and concatenated all the fasta files into a single, 10.5 Gb file using tar -xvz -f representatives.tar.bz2.

I uploaded this fasta file into multiple genome analysis tools including PACTRIC, NCBI Genome Browser, and Geneious Prime.


The data from the following sources were considered, but not used in this analysis. They contained individual species-level that would have been less useful to this global-scale analysis.

https://www.nature.com/articles/s41587-018-0009-7

https://www.nature.com/articles/s41587-018-0008-8

https://www.nature.com/articles/s41586-019-0965-1


## Background

Motivation for the project and how it fits in with other work....
The Goodman Lab at the Yale Microbial Sciences Institute has identified a novel bacteriocin putatively used in competition with other gut bacteria by Bacteroides fragilis. Certain strains of the bacterium can kill others by secreting protein products from two separate gene clusters. The first cluster contains the 2671 gene, and the second contains 1466, along with 1465 and 1644, which may also be relevant to the phenotype. The current hypothesis is that the gene-product of 2671 cleaves the gene-product of 1466 to produce the active bacteriocin. Understanding more about the genes encoding for and associated with this bacteriocin will be important to uncovering its distribution among gut commensals and pathogenic species. It could contribute to an understanding of co-occurring genes and phenotypes that contribute to a collective fitness profile. Knowing what makes microorganisms capable of thriving in the hyper-competitive gut environment will be critical to engineering beneficial probiotic strains or cocktails for disease treatment and prevention.


What the reader needs to know to understand the project...

Bacteriocins are ribosomally produced peptides secreted by a bacterial strain or species to help establish them in a community niche. Bacteriocins can take the form of colonization factors that help the host occupy a competitive niche, or can act to directly kill competitors. The producer of the protein will have a specialized immunity mechanism that prevents it from experiencing these toxic effects. Bacteriocins can also function as signaling peptides to foster inter-bacterial or bacteria-host immune crosstalk. (1)


## Methods

1. uploaded metagenomic data to PATRIC

2. uploaded four fasta files for the genes of interest from NCBI to PACTRIC

3. BLASTED 2671 nucleotide sequence against all B. fragilis species genomes
- identified 8 strains that have the gene (99-100% identity )
- gene product is defined as Clostripain-related protein

4. BLASTED all four genes in NCBI for homologues, using most, medium, and least constraining parameters. In all cases, found two genes with 100% sequence homology, B. fragilis strain S14 and B. fragilis NCTC 9343. Other matches were only small percentages of the gene sequence.

5. Used a resource that separated digestive system from non-digestive system associated genes, to answer the question of whether the gene is gut bacteria restricted.

https://www.ebi.ac.uk/metagenomics/sequence-search/results/637D868E-6767-11E9-A18B-4561FDD569CA/score

Allows uploads of protein sequences against a microbe genome database. Obtained the translated sequences of the genes 1466 (https://www.ncbi.nlm.nih.gov/gene/?term=BF9343_1466) and 2671 (https://www.ncbi.nlm.nih.gov/gene/?term=BF9343_2671) from NCBI. Queried the protein sequences first using the constraint "human - digestive system", then "human non-digestive system". Compared the highly homologous sequences between the two. Found four highly homologous genes for 1466 in that were DS-associated, but none that weren't. Found two highly homologous genes for 2671 that were DS-associated, and one much less homologous gene that was not. Unfortunately, the results did not give additional information about the genome matches other than their identifier numbers.

6. Attempted to upload individual species-level genome bins to Genome Workbench, needed to first unzip and concatenate as described above.

7. Downloaded Geneious Prime - uploaded the concatenated metagenomic data file from above. Uploaded the four genes of interest as well. Queried these genes against the database and found highly homologous genes for each of the four genes. The genes that did not share 100% homology were translated into proteins in Geneious, and protein sequence homology analyzed.

8. Gene co-occurance analysis was attempted in Geneious, but the genes ended up being BLASTED individually. MultiGeneBlast software seems to be the best way to accomplish this, but the application was non-functional on my laptop.

## Results

Results from searching the European Bioinformatics database suggest that the 1466 and 2671 genes are restricted to gut bacteria as highly homologous protein sequences were not found in non-digestive system associated genomes.

When queried against 2019 metagenomic data from microbes sampled at four different body sites (mouth, skin, vagina, feces), the four genes of interest were each found to have two highly homologous genes present in the database. Genes 1465 and 2671 each had homologues with single amino acid changes. This could indicate that this sequence is highly conserved across B. fragilis and related strains. Homologues could not be traced back to their species, as the genome bins were labeled with scientific paper reference descriptor that did not give specific information about the species identified.


## Assessment

Was it successful in achieving the initial goal?
It was successful in answering two of the initial questions that were posed about the genes of interest.

What are the main obstacles encountered?
The first obstacle that was encountered was uploading the metagenomic data that I intended to use for searching the genes of interest. There were roadblocks including the original file format needing to be unzipped and concatenated, and the file being too large such that many gene-editing programs crashed during upload. Another obstacle was BLASTing the four genes of interest concurrently against this or any database to probe their co-occurrence.

What would you have done differently?
I would have more thoroughly hashed out which gene variants belonged to B. fragilis specifically so I could then use this knowledge to search outside databases for other unrelated species harboring these genes.

What are future directions this could go in?
The co-occurrence patters of these genes could be determined to better understand the necessary complement of proteins or genes to elicit the observed bacteriocidal effect.
Additionally, determining the functional implications of the gene homologues that were uncovered would also be of value. This could be accomplished by transforming B. fragilis with a plasmid containing these altered forms of the genes and testing for changes in phenotype.

## References

[1] 2012 Review on bacteriocins in the microbiota: https://aem.asm.org/content/78/1/1

[2] Kim, P., & Price, N. D. (2011). Genetic Co-Occurrence Network across Sequenced Microbes. PLoS Computational Biology, 7(12). doi:10.1371/journal.pcbi.1002340

[3] Metagenomics, E. (n.d.). Retrieved from https://www.ebi.ac.uk/metagenomics/sequence-search/results/637D868E-6767-11E9-A18B-4561FDD569CA/score

[4] Pasolli, E., Asnicar, F., Manara, S., Zolfo, M., Karcher, N., Armanini, F., … Segata, N. (2019). Extensive Unexplored Human Microbiome Diversity Revealed by Over 150,000 Genomes from Metagenomes Spanning Age, Geography, and Lifestyle. Cell, 176(3), 649–662.e20. doi:10.1016/j.cell.2019.01.001

[5] Forster, S. C., Kumar, N., Anonye, B. O., Almeida, A., Viciani, E., Stares, M. D., . . . Lawley, T. D. (2019). A human gut bacterial genome and culture collection for improved metagenomic analyses. Nature Biotechnology, 37(2), 186-192. doi:10.1038/s41587-018-0009-7

[6] Zou, Y., Xue, W., Luo, G., Deng, Z., Qin, P., Guo, R., . . . Xiao, L. (2019). 1,520 reference genomes from cultivated human gut bacteria enable functional microbiome analyses. Nature Biotechnology, 37(2), 179-185. doi:10.1038/s41587-018-0008-8

[7] Almeida, A., Mitchell, A. L., Boland, M., Forster, S. C., Gloor, G. B., Tarkowska, A., . . . Finn, R. D. (2019). A new genomic blueprint of the human gut microbiota. Nature, 568(7753), 499-504. doi:10.1038/s41586-019-0965-1
