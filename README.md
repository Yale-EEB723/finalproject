# Final Project
## Introduction

This is the final project for Andrew Verdegaal in [Comparative Genomics](https://github.com/Yale-EEB723/syllabus), seminar in the spring of 2019. This project will attempt to identify genetic/ genomic differences between different Salmonella species and serovars by comparing host-specific and broad host range genomes of Salmonella with new, unexplored draft genomes.

## The Goal

### Big Picture
  - Differences in genomic makeup of Salmonella species and how this affects pathogenicity and virulence in different hosts. A large portion of pathogenicity tends to stem from an "accessory" genome, where elements are introduced or lost over time, and can help determine the virulence/ pathogenicity/ host adaptation of individual species or serovar strains; whereas the "core" genome is shown to be shared by all closely related strains. By looking at previously studied and annotated genomes, we can potentially identify factors in newly sequenced genomes by understanding differences related to the core and accessory genomes

### Specific Goals
  - I will use 18 previously studied Salmonella annotated reference genomes to determine the core and accessory genomes associated with them using the Spine and AGEnt software programs in the ClustAGE pipeline.
  - I will identify new strains that have been recently sequenced and not experimentally manipulated to the extent of the reference strains.
    - This means I may find draft genomes, assemble, and annotate them in order to curate them for processing them in ClustAGE pipeline.
  - I will look for similarities and differences between Salmonella that are host-specific (eg: Salmonella enterica serovar gallinarium [Chickens]/ S. enterica serovar typhi [Humans]) and those with broad host ranges. This could be a range of different genes, but focus on the following:
    - Pathogenicity islands
    - Type III Secretion System effectors
    - Metabolic House-keeping genes
  - Will also use Salmonella bongori as another source of comparison, as this is the other species in the genus of Salmonella. Other work has looked at how this species can help us understand the evolution of Salmonella, as it also has secretion systems yet different effectors, and has the ability to be pathogenic in humans as well (https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3158058/pdf/ppat.1002191.pdf)
  - Identify specific genes and look at their relationship and evolution in species identified earlier, by use of output files stemming from ClustAGE analysis
    - Potentially use progressiveMauve multiple genome alignment as a supplemental tool to help ID genes of interest as well.

## The Data

### Description of data:

#### Data source
 - NCBI Genome database

#### Data structure
 1) Assembled/annotated genomes, in order to make potentially new annotations of these genomes
  - Reference genomes in GenBank format

 2) Sequenced draft genomes that have to be processed through assembly and annotation pipelines
  - This includes:
    - Draft genome sequence of S. Typhimurium ST313 isolated from an elderly immunosuppressed patient with Non-Hodgkins Lymphoma from India
    - Salmonella enterica subsp. enterica serovar Abortusovis str. SS44, whole genome shotgun sequencing project
#### Genomic Data Sources
  - (Write sources for the accession numbers above)

  - Draft genome candidates:
            - Abortus
              - Sequence https://www.ncbi.nlm.nih.gov/nuccore/AUYQ00000000.2?report=gbwithparts&log$=seqview
              - Paper https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3974941/pdf/e00261-14.pdf
            - Typhimurium from India 2018
              - Sequence https://www.ncbi.nlm.nih.gov/biosample/?term=ERS2592364 (?)
              - Paper https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6256508/pdf/e00990-18.pdf

 - https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4832160/ -> Complete Genome Sequence of Salmonella enterica Serovar Typhimurium Strain YU15 (Sequence Type 19)

 - https://www.nature.com/articles/35101614 -> Complete genome sequence of Salmonella enterica serovar Typhimurium LT2

 - https://www.sanger.ac.uk/resources/downloads/bacteria/salmonella.html -> Set of Salmonella genomes, published or in progress. Will use S. gallinarum, S. typhimirium, and S. bongori from here.



## Background

### Motivation for Project
Salmonella still causes illnesses even in developed nations due to tainted food sources or unsanitary conditions. Stated by the CDC, "approximately 1.2 million illnesses and 450 deaths occur due to non-typhoidal Salmonella annually in the United States". Not only could we tackle the issue of Salmonella through understanding its biology and evolution, but we can use this knowledge to catapult efforts to tackle other intracellular pathogens that are either already a threat (eg: Campylobacter jejuni) or emerging intracellular pathogens with similar biology. Many new strains of Salmonella enterica that are clinically relevant are constantly being isolated, and there is a need to understand similarities and differences that these strains have in comparison to other well-studied serovar strains.

### How it fits in with other work...
Salmonella has been well studied and characterized experimentally, but we still have holes in our knowledge relating to relevant clinical strains that have yet to be isolated or studied. This need can be filled using bioinformatics and comparative functional genomics. Previous work has been focused on similar topics, with groups diving into the evolution of Salmonella enterica subspecies and relevant clinical serovars, as well as more cursory looks at how host specificity has evolved in the context of comparing genomes.

### What the reader needs to know to understand the project
The reader must have some knowledge of microbial genetics, as well as some understanding in how Salmonella and other intracellular pathogens infect/survive/replicate in host cells. Additionally, I believe a large part of this host specificity will coincide with differences in metabolic pathways and effectors of Type III secretion machinery, either gained or lost between species/ strains, so having a basic understanding of how these are involved in pathogenicity of Salmonella would be useful.



## Methods

### General software packages
- Anaconda/ Bioconda

- SPIFinder > Salmonella Pathogenicity Island finder, useful for IDing where to look for comparing genomes potentially

- SRST2 > Short Read Sequence Typing for Bacterial Pathogens, don't think I'll need this but works with Illumina sequences to ID genes of interest within the sequences

### Genome Assembly
- Ray > http://denovoassembler.sourceforge.net/, de novo assembler, can assemble single genomes using FastQ files or others as input

### Annotation Tools (for potentially reannotating previously assembled Genomes)
- Prokka > Standalone command line tool for rapidly annotating prokaryotic Genomes

- RAST > Takes ~a day to annotate a single genome, may be too slow
    Virulence gene annotation software

- PATRIC > have to check if this will work for Salmonella; Online/ browser based annotation tools available

- VFDB > Virulence factor database that contains pathogenic serotypes of multiple Salmonella species/ strains, also plasmids found in Salmonella

- Glimmer > http://ccb.jhu.edu/software/glimmer/index.shtml

- BAsys > Web based bacterial genome annotator; https://www.basys.ca/server3/basys/cgi/submit.pl



### Genome Viewing tools
- Artemis > Genome Browser to look at annotated genes, either published or newly annotated through this Project; Runs either on Windows or through Bioconda on UNIX; Java based

- Artemis Comparison Tool > Similar software to above, but can compare multiple genomes concurrently to find similarities and differences

- progressiveMauve > Multiple genome alignment and graphical viewer of shared regions between different genomes

- ClustAGE > Has own graphs output of accessory element loci regions; also has online tool to create a circular map of these elements compared between the genomes

### Genome Comparisons
- progressiveMauve > Multiple genome aligner, able to show large scale evolutionary events; Java based

- MAFFT

- MEGA

- CSI Phylogeny

- REALPhy

- ClustAGE Pipeline

### Phylogenetic Methods
- bcgTree > https://github.com/molbiodiv/bcgTree ; Method created to use own or database genomes of closely related strains of bacteria to determine a phylogenetic tree representation of these relationships. Uses core genes found in nearly all bacteria to do the phylogenetic comparisons.

- FastTree

- PhyML

- iTOL > Online tool for viewing newick tree files, able to format and create publishable images

- CSI Phylogeny > Web based pipeline that will compare whole genomes and use FastTree to determine phylogenetic relationships between SNPs characteristics in the genomes

### Approaches
- Use Spine/AGEnt pipeline to determine the core and accessory genomes of 18 Salmonella reference Genomes
  - Use AGEnt to identify these properties in new draft genomes that have previously not been studied
    - Draft genome will be:
      - Assembled with Ray
      - Annotated with Prokka (local) or RAST (online server)
  - Use the reference genomes as a basis for what to look for in the new genomes
- Use ClustAGE to compare these and create a phylogenetic relationship showing how these strains may have evolved over time and what their relation to one another is in the context of accessory genomic elements
- Use iTOL to simulate a tree and heatmap of these relationships from this pipeline
- Use ClustAGE output of comparing accessory genomic elements in tandem with known research into pathogenicity islands of Salmonella and/or other pathogenic elements to determine loss or conservation of a couple specific ones between these serovars
- Use progressiveMauve as a supplemental genomic comparison tool
  - Has its own viewer where one can look at LCBs and determine similarities between genomes
  - Look for the specific genes in this context as well
- Other Phylogenetic methods:
  - Use CGE online tool CSI Phylogeny to characterize these genomes in a different phylogenetic context, this time in terms of SNPs
  - Use sequences of the one or two specific genetic elements discussed above and compare them using MEGA or another nucleotide sequence comparison tool

## Results


## Assessment

Was it successful in achieving the initial goal?

What are the main obstacles encountered?

  - Main obstacles was trying to use software that was a bit more obscure compared to what other labs probably use at Yale, so didn't try to use Farnam core and did everything locally
  - This led to issues when I wanted to do a new multiple genome alignment that was very computationally intensive with the genomes I had
    - ie: MAFFT is a great program people recommend to get a multiple genome alignment in fasta format, and to use to generate phylip files for creating phylogenetic trees, but my computer couldnt handle the load, and the online webbased servers did not want to take that large of a load either
  - In general, I am on a windows computer so using shell at first was very difficult
    - Found a GREAT work around through using Windows Subsystem for Linux, where I bought and installed a debian-based release of a program called Pengwin
      - This allowed me to use unix based command line scripts/ software that would normally not run on Windows or would be extremely difficult. and if I had X Moba Term open as well, this allowed me to load GUIs of unix based programs that would not have run on a Windows only device. I was even able to easiy install many programs that were loaded in the debian database, where all I needed to do was sudo apt-get install <program>
      - However, I still did run into issues regarding some program installations that required command line install such as using ./configure, make, make install
      - Somethng about the WSL was very difficult to install some programs at the command line and led to a lot of hair pulling when I needed to install multiple packages of something for a dependency of one program I wanted to try
        - This especially happened with ClustalFrameML
  - Another obstacle in the preliminary stages was finding programs with outputs that were in the correct file/ format for other programs as inputs
    - This happened with progressiveMauve which was very frustrating
      - By all accounts, this program was highly recommended as a multiple genome sequence alignment tool, but the output file was supposedly in xmfa, not fasta format, and even had a .align file associated with it. I tried many different ways of using this file in downstream analysis such as creating a true phylogenetic tree (since the tree in the Mauve output was just a guide tree) using a program like PhyML or FastTree, but no matter what I did, this file couldn't be used or even converted into a working file from what I saw.

What would you have done differently?

  - I think going into this project I was a bit naive in terms of my expectations on what I could get done. I also really got ahead of myself of trying to use many programs all at once without a SPECIFIC goal in mind every time I started to use one. I would have done a bit more research and spent more time methodically sifting through programs and what the ultimate downstream output of them was and how that could help me determine differences in genomic makeup of Salmonella species. I think I got the hang of using command line programs by the end, but I would have spent more time determining the best path instead of just throwing myself into the deep-end metaphorically speaking.

What are future directions this could go in?

## References
