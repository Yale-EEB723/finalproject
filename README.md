# _Portulaca amilis_ genome annotation: genomics of carbon concentrating mechanisms

## Introduction

This is a final project for the [Comparative Genomics](https://github.com/Yale-EEB723/syllabus) seminar in the spring of 2019. This main goal of this project is production of a high quality annotation of the recently sequenced [_Portulaca amilis_](https://en.wikipedia.org/wiki/Portulaca_amilis) genome. Secondary goals include characterizing gene family expansion of key photosynthetic genes (e.g. [PEPC](http://pfam.xfam.org/family/PEPcase#wpContent0)) and comparing our geneome, in general, and these gene families, in particular, to other C3, C4, and CAM taxa.

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

For a step-by-step walkthrough, refer to [the wiki](https://github.com/isgilman/finalproject/wiki/Step-by-step-genome-annotation-for-Portulaca-amilis). 

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
 
## Results


## Assessment

Use MAKER quality assessment tools (AED, specificity, accuracy, etc.).

## References
- Matasci N., Hung L.-H., Yan Z., Carpenter E.J., Wickett N.J., Mirarab S., Nguyen N., Warnow T., Ayyampalayam S., Barker M., Burleigh J.G., Gitzendanner M.A., Wafula E., Der J.P., dePamphilis C.W., Roure B., Philippe H., Ruhfel B.R., Miles N.W., Graham S.W., Mathews S., Surek B., Melkonian M., Soltis D.E., Soltis P.S., Rothfels C., Pokorny L., Shaw J.A., DeGironimo L., Stevenson D.W., Villarreal J.C., Chen T., Kutchan T.M., Rolf M., Baucom R.S., Deyholos M.K., Samudrala R., Tian Z., Wu X., Sun X., Zhang Y., Wang J., Leebens-Mack J., Wong G.K.-S. 2014. Data access for the 1,000 Plants (1KP) project. Gigascience. 3:17.
- Zhao T., Schranz M.E. 2019. Network-based microsynteny analysis identifies major differences and genomic outliers in mammalian and angiosperm genomes. Proc. Natl. Acad. Sci. U.S.A. 116:2165–2174.
- Moore A.J., Vos J.M.D., Hancock L.P., Goolsby E., Edwards E.J. 2018. Targeted Enrichment of Large Gene Families for Phylogenetic Inference: Phylogeny and Molecular Evolution of Photosynthesis Genes in the Portullugo Clade (Caryophyllales). Systematic Biol. 67:367–383.
- Wang B., Tseng E., Regulski M., Clark T.A., Hon T., Jiao Y., Lu Z., Olson A., Stein J.C., Ware D. 2016. Unveiling the complexity of the maize transcriptome by single-molecule long-read sequencing. Nature Communications. 7:1–13.
