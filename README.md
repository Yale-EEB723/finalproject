# Final Project

## Instructions

This repository is a stub for your final project. Fork it as a template for your project, and develop your code in the forked repository. After you fork the repository, please enable the issue tracker in the repository settings so that others in the class (including the professor) can provide feedback. To submit the project, send a pull request to the original repository.

Expand on the readme questions below to provide an overview of the goals, background, and challenges for the final project. You can delete the questions as you write text that answers them, or leave the prompts in place. You can also delete this instruction section of you like.

Add all code to your project repository, including shell scripts, R analyses, python, etc.

Do not commit large data files to the repository. Provide paths to where they can be downloaded if they
are from public sources, or track them with [git-lfs](https://git-lfs.github.com).

## Introduction

This is a final project for the [Comparative Genomics](https://github.com/Yale-EEB723/syllabus) seminar in the spring of 2019. This project will attempt to identify differences between different Salmonella species and serovars by comparing host-specific and broad host range genomes of Salmonella.

## The goal

Specifically, I will try and find similarities and differences between Salmonella that are host-specific (eg: Salmonella gallinarium [Chickens]/ S. enterica serovar typhi [Humans]), either for pathogenicity islands, other genes, or even structure and evolution of the genomes. The goal is to see if there are any readily identifiable differences in gene content between these pathogens which target either specific hosts or a wide range of hosts. This problem has not been attempted to any great depth in Salmonella, although there have been increased efforts to compare Salmonella genomes in general.

## The data

Description of data...

- Data source
 - Data will be from a combination of published and simulated data. Simulated data will be derived from attempting novel annotations of previously published Salmonella genomes.
- Data structure
    1) Assembled genomes, in order to make potentially new annotations of these genomes
      Genomes include: Pan-Salmonella enterica genome; Salmonella gallinarium; Salmonella enterica typhimurium; Salmonella enterica typhi; perhaps others.
    2) Previously annotated genomes, which will be used in a comparative analysis of functioning genes in pathogenic pathways

## Background

Motivation for Project
  Salmonella still causes illnesses even in developed nations due to tainted food sources or unsanitary conditions. Stated by the CDC, "approximately 1.2 million illnesses and 450 deaths occur due to non-typhoidal Salmonella annually in the United States". Not only could we tackle the issue of Salmonella through understanding its biology and evolution, but we can use this knowledge to catapult efforts to tackle other intracellular pathogens that are either already a threat (eg: Campylobacter jejuni) or emerging intracellular pathogens with similar biology.

How it fits in with other work...
  Salmonella has been well studied and characterized experimentally, but we still have holes in our knowledge that can be filled using bioinformatics and comparative functional genomics. Previous work has been focused on similar topics, with groups diving into the evolution of Salmonella enterica subspecies and relevant clinical serovars, as well as more cursory looks at how host specificity has evolved in the context of comparing genomes.

What the reader needs to know to understand the project
  The reader must have some knowledge of microbial genetics, as well as some understanding in how Salmonella and other intracellular pathogens infect/survive/replicate in host cells. Additionally, I believe a large part of this host specificity will coincide with differences in metabolic pathways and effectors of Type III secretion machinery, either gained or lost between species/ strains, so having a basic understanding of how these are involved in pathogenicity of Salmonell would be useful.


## Methods
  As of right now, I have a general understanding of what tools are available to complete this project, with more perhaps coming into my view as I read more literature on comparative genomics in Salmonella/ pathogens.

    General software packages
      - Anaconda/ Bioconda
      SPIFinder > Salmonella Pathogenicity Island finder, useful for IDing where to look for comparing genomes potentially
      SRST2 > Short Read Sequence Typing for Bacterial Pathogens, don't think I'll need this but works with Illumina sequences to ID genes of interest within the sequences

    Annotation Tools (for potentially reannotating previously assembled Genomes)
      - Prokka > Standalone command line tool for rapidly annotating prokaryotic Genomes
      - RAST > Takes ~a day to annotate a single genome, may be too slow
    Virulence gene annotation software
      - PATRIC > have to check if this will work for Salmonella; Online/ browser based annotation tools available
      - VFDB > Virulence factor database that contains pathogenic serotypes of multiple Salmonella species/ strains, also plasmids found in Salmonella

    Genome Viewing tools
      - Artemis > Genome Browser to look at annotated genes, either published or newly annotated through this Project; Runs either on Windows or through Bioconda on UNIX; Java based
      - Artemis Comparison Tool > Similar software to above, but can compare multiple genomes concurrently to find similarities and differences

    Genome Comparisons
      - Mauve > Multiple genome aligner, able to show large scale evolutionary events; Java based
      - ACT (above)

Will add more as more come into view
## Results


## Assessment

Was it successful in achieving the initial goal?

What are the main obstacles encountered?

What would you have done differently?

What are future directions this could go in?

## References
