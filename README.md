# _Portulaca amilis_ genome annotation: genomics of carbon concentrating mechanisms

## Introduction

This is a final project for the [Comparative Genomics](https://github.com/Yale-EEB723/syllabus) seminar in the spring of 2019. The main goal of this project is production of a high quality annotation of the recently sequenced [_Portulaca amilis_](https://en.wikipedia.org/wiki/Portulaca_amilis) genome. Secondary goals include characterizing gene family expansion of key photosynthetic genes (e.g. [PEPC](http://pfam.xfam.org/family/PEPcase#wpContent0)) and comparing our geneome, in general, and these gene families, in particular, to other C3, C4, and CAM taxa.

## Goals

1. Annotate the _P. amilis_ genome
2. Characterizing PEPC gene family expansion
3. Comparing PEPC gene family expansion to publicly available C3, C4, and CAM genomes

## The data

1. _P. amilis_ genome
    - Source: Edwards Lab, sequenced and assembled by Dovetail Genomics
    - Format: `.fasta`
    - Status: ~408Mbp assembled into 9 scaffolds representing the 9 _P. amilis_ chromosomes
2. _P. amilis_ transcriptome
    - Source: reference ID [ERR2040261](https://www.ncbi.nlm.nih.gov/sra/ERR2040261)
    - Format: `.fasta`
    - Status: unassembled raw reads
3. PEPC alignments
    - Source: Edwards Lab and [1KP Initiative](https://sites.google.com/a/ualberta.ca/onekp/)
    - Format: `.fasta`
    - Status: alignment of hundreds of _ppc_ contigs from many species representing many paralogs
4. Genome size and quality metrics for other angiosperms
   - Source: [Zhao and Schranz (2019)](https://www.pnas.org/content/116/6/2165) supplementary material
   - Format: `.csv`
   - Status: NA

## Methods

For a step-by-step walkthrough, refer to [the wiki](https://github.com/isgilman/finalproject/wiki/Step-by-step-genome-annotation-for-Portulaca-amilis). Here is a brief outline of the methodology.

1. Sequencing and assembly by Dovetail genomics
2. Quality control using `QUAST`, `gVolante`, and `BUSCO`
3. Evidence gathering
    * Transciptome assembled with genome-guided `Trinity`
    * Proteomes from _Beta vulgaris_ and _Arabidopsis thaliana_
    * Coding sequences extracted from assembled transcripts using `Transdecoder` with _Beta vulgaris_ and _Arabidopsis thaliana_ proteomes
    * Repeat libraries extracted using `RepeatModeler` and masked with `RepeatMasker`
5. Initial genome annotation with `MAKER`
6. Train _ab initio_ gene predictors `SNAP` and `Augustus`
7. Genome annotation with `MAKER` and _ab initio_ gene prediction
8. Iterate training gene predictors and annotation until stabilization
9. Infer homology of final gene models

## Results
The main result of the project is itself the annotated genome, which is currently a work in progress. At this time I have finished the initial annotation, trained gene model predictors, and begun reannotating using these predictors. Along the way I have recorded a number of important statistics about the size, completeness, and content of the _P. amilis_ genome.

_**Size distribution**_

Total length (nt) |	403885173
--|--
Longest sequence (nt) | 53436919
Shortest sequence (nt)	| 1000
Mean sequence length (nt)	| 99651
Median sequence length (nt)	| 1476
N50 sequence length (nt)	| 42597560
L50 sequence count	| 5
Number of sequences > 1K (nt)	| 4046 (99.8% of total number)
Number of sequences > 10K (nt)	| 32 (0.8% of total number)
Number of sequences > 100K (nt)	| 13 (0.3% of total number)
Number of sequences > 1M (nt)	| 9 (0.2% of total number)
Number of sequences > 10M (nt)	| 9 (0.2% of total number)
Sum length of sequences > 1M (nt)	| 395389203 (97.9% of total length)
Sum length of sequences > 10M (nt)	| 395389203 (97.9% of total length)

_**Genome completeness**_

My first annotation with `MAKER` recovered a large fraction of those found in the raw scaffolds. I expected that the number of duplicated genes would be higher in this annotation because we retained isoforms for many gene from the transcriptome analysis during annotation.

BUSCO  | Initial `MAKER`| Input scaffolds
--|--|--
Complete BUSCOs | 1031 (71.6%) | 1291 (89.7%)
Complete and single-copy BUSCOs | 814 (56.5%) | 1228 (85.3%)
Complete and duplicated BUSCOs | 217 (15.1%) | 63 (4.4%)
Fragmented BUSCOs | 158 (11.0%) | 29 (2.0%)
Missing BUSCOs | 251 (17.4%) | 120 (8.33%)
Total BUSCO groups searched | 1440 | 1440

I also combined some data on genome size and completeness from Zhao and Schranz (2019) to see how our assembly compares to other angiosperm assemblies. The _P. amilis_ genome is among the highest quality (at least in terms of N50 and BUSCO) of publically available angiosperm genomes.

<img src="https://github.com/isgilman/finalproject/blob/master/Figures/Gsize.BUSCO.pdf" align="middle" width="500"/>

_**Genome content**_

After the initial `MAKER` analysis I recovered **23,893 predicted genes** with a mean length of  3,661.38 bp. I estimated the genome to be constituted of ~46% repetitive elements.

<img src="https://github.com/isgilman/finalproject/blob/master/Figures/P_amilis.repeatlandscape.pdf" align="middle" width="500"/>

## Next steps
The next computational steps in annotating the _Portulaca amilis_ genome include

- Continuing the annotation process with `MAKER`
- Visualizing genome (e.g. [`circos`](http://circos.ca)) and gene models with a genome browser
- Trying another annotation pipeline called [`funannotate`](https://funannotate.readthedocs.io/en/latest/) with some additional/updated methodology
    - [Purging haplotigs](https://bitbucket.org/mroachawri/purge_haplotigs)
    - Updated repeat analysis with [Dfam 3.0](http://www.dfam.org/home), which was released after my repeat analysis
    - Generating transcriptome evidence with [`PASA`](https://github.com/PASApipeline/PASApipeline/wiki#A_intro)
    - Adding [GeneMark-ET](http://opal.biology.gatech.edu/GeneMark/), another _ab initio_ gene predictor

In addition to expanding my computational methodology, I am also in the process of generating more molecular data to bolster our annotation. In particular, I am generating transcriptomes from multiple tissue types of _P. amilis_ under normal environmental conditions that should increase the completeness of our genome annotation. I am also generating long-read transcriptomes for normal and drought-stressed leaves, to understand the full diversity of photosynthesis-related transcripts.

## References
- Matasci N., Hung L.-H., Yan Z., Carpenter E.J., Wickett N.J., Mirarab S., Nguyen N., Warnow T., Ayyampalayam S., Barker M., Burleigh J.G., Gitzendanner M.A., Wafula E., Der J.P., dePamphilis C.W., Roure B., Philippe H., Ruhfel B.R., Miles N.W., Graham S.W., Mathews S., Surek B., Melkonian M., Soltis D.E., Soltis P.S., Rothfels C., Pokorny L., Shaw J.A., DeGironimo L., Stevenson D.W., Villarreal J.C., Chen T., Kutchan T.M., Rolf M., Baucom R.S., Deyholos M.K., Samudrala R., Tian Z., Wu X., Sun X., Zhang Y., Wang J., Leebens-Mack J., Wong G.K.-S. 2014. Data access for the 1,000 Plants (1KP) project. Gigascience. 3:17.
- Zhao T., Schranz M.E. 2019. Network-based microsynteny analysis identifies major differences and genomic outliers in mammalian and angiosperm genomes. Proc. Natl. Acad. Sci. U.S.A. 116:2165–2174.
- Moore A.J., Vos J.M.D., Hancock L.P., Goolsby E., Edwards E.J. 2018. Targeted Enrichment of Large Gene Families for Phylogenetic Inference: Phylogeny and Molecular Evolution of Photosynthesis Genes in the Portullugo Clade (Caryophyllales). Systematic Biol. 67:367–383.
- Wang B., Tseng E., Regulski M., Clark T.A., Hon T., Jiao Y., Lu Z., Olson A., Stein J.C., Ware D. 2016. Unveiling the complexity of the maize transcriptome by single-molecule long-read sequencing. Nature Communications. 7:1–13.
