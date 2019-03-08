# Final Project
## Introduction

This is the final project for Andrew Verdegaal in [Comparative Genomics](https://github.com/Yale-EEB723/syllabus), seminar in the spring of 2019. This project will attempt to identify genetic/ genomic differences between different Salmonella species and serovars by comparing host-specific and broad host range genomes of Salmonella.

## The goal

### Big Picture
  - Differences in genomic makeup of Salmonella species and how this affects pathogenicity and virulence in different hosts.

### Specific Goals
  - I will try and find similarities and differences between Salmonella that are host-specific (eg: Salmonella enterica serovar gallinarium [Chickens]/ S. enterica serovar typhi [Humans]) and those with broad host ranges, either for pathogenicity islands, other genes, or even structure and evolution of the genomes.
  - See if there are any readily identifiable differences in gene content between these pathogens which target either specific hosts or a wide range of hosts. This problem has not been attempted to any great depth in Salmonella, although there have been increased efforts to compare Salmonella genomes in general. In the case there are no readily identifiable differences (or similarities in relation to host range), I will attempt to re-annotate current Salmonella genomic data using newly developed programs and data pipelines. I can additionally see if there are newer data sets that have not been integrated in relation to Salmonella pathogenicity, eg: newer transcriptome data.
  - Will also use Salmonella bongori as another source of comparison, as this is the other species in the genus of Salmonella. Other work has looked at how this species can help us understand the evolution of Salmonella, as it also has secretion systems yet different effectors, and has the ability to be pathogenic in humans as well (https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3158058/pdf/ppat.1002191.pdf)
  - Failing ability to compare these attributes with the sequences and tools at hand without experimental assays, I will try and reannotate the S. enterica gallinarum genome.

## The data

### Description of data:

#### Data source
 - Data will be from a combination of published and simulated data. Simulated data will be derived from attempting novel annotations of previously published Salmonella genomes.

#### Data structure
 1) Assembled genomes, in order to make potentially new annotations of these genomes
      Genomes include: Pan-Salmonella enterica genome; Salmonella gallinarium; Salmonella enterica typhimurium; Salmonella enterica typhi; perhaps others.

 2) Previously annotated genomes, which will be used in a comparative analysis of functioning genes in pathogenic pathways
#### Database sources
 - https://salmonella.biocyc.org/ -> online set of tools/database capable of multiple genome comparisons, metabolic pathway comparisons, multiple sequence alignment with over 250 Salmonella species/ sub subspecies

 - http://xbase.warwick.ac.uk/taxon/Salmonella -> another online toolset/database allowing for comparison between multiple species of Salmonella/ subspecies

 - https://www.ncbi.nlm.nih.gov/genome/genomes/152 -> Salmonella enterica database on NCBI

 - https://www.ncbi.nlm.nih.gov/Taxonomy/Browser/wwwtax.cgi?id=590 -> NCBI Full genome set of all Salmonella sp. (that were submitted to this database)

#### Specific sources of Genomic Data
 - https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4832160/ -> Complete Genome Sequence of Salmonella enterica Serovar Typhimurium Strain YU15 (Sequence Type 19)

 - https://www.nature.com/articles/35101614 -> Complete genome sequence of Salmonella enterica serovar Typhimurium LT2

 - https://www.sanger.ac.uk/resources/downloads/bacteria/salmonella.html -> Set of Salmonella genomes, published or in progress. Will use S. gallinarum, S. typhimirium, and S. bongori from here.



## Background

### Motivation for Project
Salmonella still causes illnesses even in developed nations due to tainted food sources or unsanitary conditions. Stated by the CDC, "approximately 1.2 million illnesses and 450 deaths occur due to non-typhoidal Salmonella annually in the United States". Not only could we tackle the issue of Salmonella through understanding its biology and evolution, but we can use this knowledge to catapult efforts to tackle other intracellular pathogens that are either already a threat (eg: Campylobacter jejuni) or emerging intracellular pathogens with similar biology.

### How it fits in with other work...
Salmonella has been well studied and characterized experimentally, but we still have holes in our knowledge that can be filled using bioinformatics and comparative functional genomics. Previous work has been focused on similar topics, with groups diving into the evolution of Salmonella enterica subspecies and relevant clinical serovars, as well as more cursory looks at how host specificity has evolved in the context of comparing genomes.

### What the reader needs to know to understand the project
The reader must have some knowledge of microbial genetics, as well as some understanding in how Salmonella and other intracellular pathogens infect/survive/replicate in host cells. Additionally, I believe a large part of this host specificity will coincide with differences in metabolic pathways and effectors of Type III secretion machinery, either gained or lost between species/ strains, so having a basic understanding of how these are involved in pathogenicity of Salmonell would be useful.


## Methods
  As of right now, I have a general understanding of what tools are available to complete this project, with more perhaps coming into my view as I read more literature on comparative genomics in Salmonella/ pathogens.

### General software packages
- Anaconda/ Bioconda

- SPIFinder > Salmonella Pathogenicity Island finder, useful for IDing where to look for comparing genomes potentially

- SRST2 > Short Read Sequence Typing for Bacterial Pathogens, don't think I'll need this but works with Illumina sequences to ID genes of interest within the sequences

### Annotation Tools (for potentially reannotating previously assembled Genomes)
- Prokka > Standalone command line tool for rapidly annotating prokaryotic Genomes

- RAST > Takes ~a day to annotate a single genome, may be too slow
    Virulence gene annotation software

- PATRIC > have to check if this will work for Salmonella; Online/ browser based annotation tools available

- VFDB > Virulence factor database that contains pathogenic serotypes of multiple Salmonella species/ strains, also plasmids found in Salmonella

### Genome Viewing tools
- Artemis > Genome Browser to look at annotated genes, either published or newly annotated through this Project; Runs either on Windows or through Bioconda on UNIX; Java based

- Artemis Comparison Tool > Similar software to above, but can compare multiple genomes concurrently to find similarities and differences

### Genome Comparisons
- Mauve > Multiple genome aligner, able to show large scale evolutionary events; Java based

- ACT (above)

- MuTect2 > Detect SNPs in bacterial genomes, based on GATK software (like HaploCaller); https://software.broadinstitute.org/gatk/documentation/tooldocs/3.8-0/org_broadinstitute_gatk_tools_walkers_cancer_m2_MuTect2.php

- breseq > "algorithm for identifying structural variation from DNA resequencing data as part of the breseq computational pipeline for predicting mutations in haploid microbial genomes" https://bmcgenomics.biomedcentral.com/articles/10.1186/1471-2164-15-1039

Will add more as more come into view
## Results


## Assessment

Was it successful in achieving the initial goal?

What are the main obstacles encountered?

What would you have done differently?

What are future directions this could go in?

## References
