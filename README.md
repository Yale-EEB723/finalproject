# Final Project

## Introduction

This is a final project for the [Comparative Genomics](https://github.com/Yale-EEB723/syllabus) seminar in the spring of 2019. This project used RNA-seq data published on SRA to test the validity of the group Cyclostomata, the living jawless fishes.

## The goal

Molecular evidence supporting Cyclostoma has thus far been limited to a few mitochondrial genes. The goal of this preliminary study is to use transcriptome data to infer a tree that will test the phylogenetic relationships between hagfishes (Myxiniformes), lampreys (Petromyzontiformes), and jawed vertebrates (Gnathostomes).

## The data

Paired-end sequences are accessible on SRA for the following lamprey species:

Petromyzontinae: Petromyzon marinus, Ichthyomyzon castaneus, Ichthyomyzon fossor

Lampetrinae: Lampetra planeri, Lethenteron camtschaticum, and Lethenteron reissneri,

Geotriidae: Geotria australis

and the two hagfish species (Eptatretus burgeri and Eptatretus cirrhatus).

I have yet to determine which tunicate and lancelet representatives would be best (or possible) to include in this study, as well as which and how many representatives of the jawed vertebrates would be most useful to include. 

### Reference Genomes:

Petromyzon marinus:
First assembly of Petromyzon germline genome (highly contiguous) (Smith et al. 2018):
(https://www.ncbi.nlm.nih.gov/Traces/wgs/PIZI01?display=contigs)

Simth et al. (2013)
~6X WGS assembly available for Petromyzon marinus (from somatic liver cells, genome size is 1.92 gb)
(https://www.ncbi.nlm.nih.gov/assembly/GCA_000148955.1/)



### Things to consider:
1.) During early embryogenesis, the lamprey genome undergoes dramatic programmed genome rearrangements (Smith et al. 2018; Smith et al. 2009). Specifically, somatic cell lineages lose hundreds of millions of base pairs (and one ore more transcribed loci), resulting in somatic (blood) cells being 20% smaller than germline (sperm) cells (Smith et. al 2009). The lamprey genome is therefore highly dynamic. I'll have to think more about a.) at what stage in development were the samples from which the DNA was extracted b.) what type of cells were the DNA extracted from, and c.) does it even matter (i.e. since this effect wasn't found in germline cells, are there any potential phylogenetic/evolutionary consequences of this, in particular as they relate to methods for this study). As a result of all of this, I should just use the more recently published germline sea lamprey genome as a reference, and ignore the previous Sanger-based somatic assembly, which was relatively fragmentary anyway (Smith et al. 2013)

2.) The lamprey genome is known to have a high GC content, as well as to be highly repetitive and heterozygous.


## Background

Motivation for the project....

How it fits in with other work...

What the reader needs to know to understand the project


## Methods
I plan to use the Agalma pipelines (Dunn et al. 2013) to identify homologous sequences across the multiple species, create nucleotide alignments for each set of homologus sequence, and infer a preliminary species tree with RAxML.

Agalma repo: (https://bitbucket.org/caseywdunn/agalma/src/master/)

## Results


## Assessment

Was it successful in achieving the initial goal?

What are the main obstacles encountered?

What would you have done differently?

What are future directions this could go in?

## References

Dunn CW, Howison M, Zapata F. 2013. Agalma: an automated phylogenomics workflow. BMC Bioinformatics 14(1): 330. doi:10.1186/1471-2105-14-330

Smith, Jeramiah J., Francesca Antonacci, Evan E. Eichler, and Chris T. Amemiya. "Programmed loss of millions of base pairs from a vertebrate genome." Proceedings of the National Academy of Sciences 106, no. 27 (2009): 11212-11217.

Smith, Jeramiah J., Shigehiro Kuraku, Carson Holt, Tatjana Sauka-Spengler, Ning Jiang, Michael S. Campbell, Mark D. Yandell et al. "Sequencing of the sea lamprey (Petromyzon marinus) genome provides insights into vertebrate evolution." Nature genetics 45, no. 4 (2013): 415.

Smith, Jeramiah J., Nataliya Timoshevskaya, Chengxi Ye, Carson Holt, Melissa C. Keinath, Hugo J. Parker, Malcolm E. Cook et al. "The sea lamprey germline genome provides insights into programmed genome rearrangement and vertebrate evolution." Nature genetics 50, no. 2 (2018): 270.