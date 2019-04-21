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
  - Reference genomes (whole genome sequences and plasmids separately, used either .gbk or .fasta)
    - For analysis, concatenated relevant chromosomes and plasmids into single file for each serovar/ strain

      1. Salmonella enterica subsp. enterica serovar Agona str. SL483 plasmid, complete sequence
      37,978 bp circular DNA
      CP001137.1 GI:197211002

      2. Salmonella enterica subsp. enterica serovar Agona str. SL483, complete genome
      4,798,660 bp circular DNA
      CP001138.1 GI:197211055

      3. Salmonella enterica subsp. enterica serovar Choleraesuis str. SC-B67 plasmid pSCV50, complete sequence
      49,558 bp circular DNA
      AY509003.1 GI:45359286

      4. Salmonella enterica subsp. enterica serovar Choleraesuis str. SC-B67 plasmid pSC138, complete sequence
      138,742 bp circular DNA
      AY509004.1 GI:45758072

      5. Salmonella enterica subsp. enterica serovar Choleraesuis str. SC-B67, complete genome
      4,755,700 bp circular DNA
      AE017220.1 GI:62126203

      6. Salmonella enterica subsp. enterica serovar Dublin str. CT_02021853 plasmid pCT02021853_74, complete sequence
      74,551 bp circular DNA
      CP001143.1 GI:197936152

      7. Salmonella enterica subsp. enterica serovar Dublin str. CT_02021853, complete genome
      4,842,908 bp circular DNA
      CP001144.1 GI:197936256

      8. Salmonella enterica subsp. enterica serovar Enteritidis str. P125109 complete genome
      4,685,848 bp circular DNA
      AM933172.1 GI:206707319

      9. Salmonella enterica subsp. enterica serovar Gallinarum str. 287/91 complete genome
      4,658,697 bp circular DNA
      AM933173.1 GI:205271127

      10. Salmonella enterica subsp. enterica serovar Heidelberg str. SL476 plasmid pSL476_3, complete sequence
      3,373 bp circular DNA
      CP001119.1 GI:194405605

      11. Salmonella enterica subsp. enterica serovar Heidelberg str. SL476, complete genome
      4,888,768 bp circular DNA
      CP001120.1 GI:194405610

      12. Salmonella enterica subsp. enterica serovar Newport str. SL254 plasmid pSN254, complete sequence
      176,473 bp circular DNA
      CP000604.1 GI:133905002

      13. Salmonella enterica subsp. enterica serovar Newport str. SL254 plasmid pSL254_3, complete sequence
      3,605 bp circular DNA
      CP001112.1 GI:194400862

      14. Salmonella enterica subsp. enterica serovar Newport str. SL254, complete genome
      4,827,641 bp circular DNA
      CP001113.1 GI:194400866

      15. Salmonella enterica Paratyphi A IncH1 multiple drug resistance, serovar Paratyphi A
      212,711 bp circular other
      AM412236.1 GI:145848882

      16. Salmonella enterica subsp. enterica serovar Paratyphi A str. AKU_12601 complete genome, strain AKU_12601
      4,581,797 bp circular DNA
      FM200053.1 GI:197092687

      17. Salmonella enterica subsp. enterica serovar Paratyphi A str. ATCC 9150, complete genome
      4,585,229 bp circular DNA
      CP000026.1 GI:56126533

      18. Salmonella enterica subsp. enterica serovar Paratyphi B str. SPB7, complete genome
      4,858,887 bp circular DNA
      CP000886.1 GI:161361677

      19. Salmonella enterica subsp. enterica serovar Paratyphi C strain RKS4594, complete genome
      4,833,080 bp circular DNA
      CP000857.1 GI:224466365

      20. Salmonella enterica subsp. enterica serovar Paratyphi C strain RKS4594 plasmid pSPCV, complete sequence
      55,414 bp circular DNA
      CP000858.1 GI:224470944

      21. Salmonella enterica subsp. enterica serovar Schwarzengrund str. CVM19633 plasmid pCVM19633_110, complete sequence
      110,227 bp circular DNA
      CP001125.1 GI:194709275

      22. Salmonella enterica subsp. enterica serovar Schwarzengrund str. CVM19633 plasmid pCVM19633_4, complete sequence
      4,585 bp circular DNA
      CP001126.1 GI:194709398

      23. Salmonella enterica subsp. enterica serovar Schwarzengrund str. CVM19633, complete genome
      4,709,075 bp circular DNA
      CP001127.1 GI:194709404

      24. Salmonella enterica subsp. enterica serovar Typhi str. CT18 plasmid pHCM1
      218,160 bp circular DNA
      AL513383.1 GI:16505740

      25. Salmonella enterica subsp. enterica serovar Typhi str. CT18 plasmid pHCM2
      106,516 bp linear DNA
      AL513384.1 GI:16505981

      26. Salmonella enterica subsp. enterica serovar Typhi str. CT18, complete chromosome
      4,809,037 bp circular DNA
      AL513382.1 GI:30407157

      27. Salmonella enterica subsp. enterica serovar Typhi Ty2, complete genome
      4,791,961 bp circular DNA
      AE014613.1 GI:29140506

      28. Salmonella enterica subsp. enterica serovar Typhimurium str. LT2 plasmid pSLT, complete sequence
      93,933 bp circular DNA
      AE006471.2 GI:973795114

      29. Salmonella enterica subsp. enterica serovar Typhimurium str. LT2, complete genome
      4,857,450 bp circular DNA
      AE006468.2 GI:973795115

      30. Salmonella enterica subsp. enterica serovar Typhimurium SL1344 complete genome
      4,878,012 bp circular DNA
      FQ312003.1 GI:301156631

      31. Salmonella enterica subsp. enterica serovar Virchow str. SL491 plasmid pSL491_5, complete sequence
      5,880 bp circular DNA
      CP001148.1 GI:198404301

      32. Salmonella enterica subsp. enterica serovar Virchow str. SL491 plasmid pSL491_3, complete sequence
      3,176 bp circular DNA
      CP001149.1 GI:198404307

  - Draft genome candidates:
    - Abortusovis SR44
      - Sequence https://www.ncbi.nlm.nih.gov/nuccore/AUYQ00000000.2?report=gbwithparts&log$=seqview
      - Paper https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3974941/pdf/e00261-14.pdf
    - Typhimurium ST313 from India 2018
      - Sequence https://www.ncbi.nlm.nih.gov/biosample/?term=ERS2592364 (?)
      - Paper https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6256508/pdf/e00990-18.pdf

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

- Windows Subsystem for Linux "Pengwyn" > Debian build, able to get many known genomic software packages through Debian releases

### Genome Assembly
- Ray > http://denovoassembler.sourceforge.net/, de novo assembler, can assemble single genomes using FastQ files or others as input

- Velvet > Attempted to use

### Annotation Tools (for potentially reannotating previously assembled Genomes)
- Prokka > Standalone command line tool for rapidly annotating prokaryotic Genomes

- RAST >  Virulence gene annotation software
      - Used, but ended up going with Prokka
      - Ran into issues re: regions missing CDS annotations downstream for some reason

### Genome Viewing tools
- progressiveMauve > Multiple genome alignment and graphical viewer of shared regions between different genomes

- ClustAGE > Has own graphs output of accessory element loci regions; also has online tool to create a circular map of these elements compared between the genomes

### Genome Comparisons
- ClustAGE > Alignment and analysis of accessory genomic elements IDed in Spine/AGEnt programs

- Spine > ID core genomes of reference genomes, and use this information to inform what the accessory genomic elements are of these as well

- AGEnt > In silico comparison of new (either whole or draft genome) sequences in order to ID accessory genomic elements in reference to the core genome produced in Spine

- progressiveMauve > Multiple genome aligner, able to show large scale evolutionary events; Java based
  - Have data from this, but ended up using ClustAGE pipeline as main source moving forward

- MAFFT
  - Attempted, ran into issues running locally, and didn't work with my dataset in web-based format

- REALPhy
  - Failed to run with the sequenced reads I had assembled, as with CSI Phylogeny


### Phylogenetic Methods
- FastTree (attempted, not used)

- PhyML (attempted, not used)

- iTOL > Online tool for viewing newick tree files, able to format and create publishable images

- CSI Phylogeny > Web based pipeline that will compare whole genomes and use FastTree to determine phylogenetic relationships between SNPs characteristics in the genomes
  - Failed due to difficulties with reads being uploaded in FastQ format

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

  - Successfully analyzed a range of Salmonella enterica (and one bongori) serovars, that are relevant strains in public health, for organization of "core" and "accessory" genomic Elements
    - These accessory genomic elements can be useful in identifying strain specific genes related to general virulence or host-adpatation within that serovar
      - ie: Why Salmonella enterica serovar Dublin infects bovine hosts while Typhimurium is a generalist
  - Utilized Ray genome assembly software to assemble one set of sequenced pair reads from S_Typhimurium_ST313, while using Prokka annotation software to annotate S_Typhimurium_ST313 and S_Abortusovis_SR44 successful for further downstream analysis.
  - Using the Spine software, identified core genomes relating to 18 reference Salmonella complete genomes (along with plasmids if present), while also identifying their accessory genomic Elements
  - Used AGEnt software, identified accessory genomic elements of the two draft genome sequences, acting as surrogates for newly discovered Salmonella serovars that are in need of analysis
  - Used ClustAGE to align these accessory regions and create both alignments and graphical representations of absence or presence of annotated CDS between the serovars analyzed
  - Produced phylogenetic relationship of serovars analyzed in reference to their accessory genomes
    - Bray- Curtis distances calculated for each pairwise relationship
    - Neighbor-joining tree generated depicting these relationships
  - Looked through data and identified regions that acted as positive controls that the process worked
    - Type III Secretion System Effectors for S. enterica were identified to be shared between all S. enterica serovars, while being absent from S. bongori, as expected
  - Identified potentially new regions that could aid in understanding of pathogenesis:
    - S. enterica serovar Abortusovis SR44 region of hypothetical proteins ID'ed
      - Can look into these and see if there are any similar genes in other Salmonella or bacteria at large, and look at function
    - Chloramphenicol resistance genes and regions ID'ed in Choleraesuis and Schwarzengrund
      - Known genes ID'ed (cat2, chloramphenicol acetyltransferase)
      - Also unknown genes (SCH_012)
      - Shows differences in virulence between species, which is definitely important in terms of what antibiotic resistances of serovars are and how these can spread through HGT

## Assessment

Was it successful in achieving the initial goal?
  - Ultimately, I believe I found an effective pipeline to analyze potential genomic aspects of pathogenicity in Salmonella enterica serovars regarding host specificity and/ or Virulence
  - However, the scope is much less than expected, with not much information extracted in the end regarding specific genes/ genomic islands that are relevant
  - Still, have set up the preliminary ground work for searching for these genomic elements, as I have data that can now be gone through, and knowledge of a pipeline that can be run again with ease.

What are the main obstacles encountered?

  - Main obstacles was trying to use software that was a bit more obscure compared to what other labs probably use at Yale, so didn't try to use Farnam core and did everything locally
  - This led to issues when I wanted to do a new multiple genome alignment that was very computationally intensive with the genomes I had
    - ie: MAFFT is a great program people recommend to get a multiple genome alignment in fasta format, and to use to generate phylip files for creating phylogenetic trees, but my computer couldnt handle the load, and the online webbased servers did not want to take that large of a load either
  - In general, I am on a windows computer so using shell at first was very difficult
    - Found a GREAT work around through using Windows Subsystem for Linux, where I bought and installed a debian-based release of a program called Pengwin
      - This allowed me to use unix based command line scripts/ software that would normally not run on Windows or would be extremely difficult. and if I had X Moba Term open as well, this allowed me to load GUIs of unix based programs that would not have run on a Windows only device. I was even able to easiy install many programs that were loaded in the debian database, where all I needed to do was sudo apt-get install <program>
      - However, I still did run into issues regarding some program installations that required command line install such as using ./configure, make, make install
      - Something about the WSL was very difficult to install some programs at the command line and led to a lot of hair pulling when I needed to install multiple packages of something for a dependency of one program I wanted to try
        - This especially happened with ClustalFrameML
  - Another obstacle in the preliminary stages was finding programs with outputs that were in the correct file/ format for other programs as inputs
    - This happened with progressiveMauve which was very frustrating
      - By all accounts, this program was highly recommended as a multiple genome sequence alignment tool, but the output file was supposedly in xmfa, not fasta format, and even had a .align file associated with it. I tried many different ways of using this file in downstream analysis such as creating a true phylogenetic tree (since the tree in the Mauve output was just a guide tree) using a program like PhyML or FastTree, but no matter what I did, this file couldn't be used or even converted into a working file from what I saw.
  -

What would you have done differently?

  - I think going into this project I was a bit naive in terms of my expectations on what I could get done.
  - I also really got ahead of myself of trying to use many programs all at once without a SPECIFIC goal in mind every time I started to use one.
  - I would have done a bit more research and spent more time methodically sifting through programs and what the ultimate downstream output of them was and how that could help me determine differences in genomic makeup of Salmonella species.
  - I think I got the hang of using command line programs by the end, but I would have spent more time determining the best path instead of just throwing myself into the deep-end metaphorically speaking.

What are future directions this could go in?

  - Definitely gene discovery, or at the very least gene identification for relevant experimental studies
  - Using this comparative functional genomics approach, it is feasible to identify accessory genomic elements in new and emerging relevant Salmonella strains to help better identify their lineage and what factors are important for their virulence, be it in animals or humans.
  - Using multiple genome alignments to rapidly identify specific genes to be tested and experimentally manipulated
  - Could be useful information for Salmonella vaccine development as well
  - Look specifically at the region I identified that is unique to S_Abortusovis_SR44 with the hypothetical proteins, could be important to its unique pathogenesis in ovine sp.

## References

### Blast

  - Gene [Internet]. Bethesda (MD): National Library of Medicine (US), National Center for Biotechnology Information; 2004 – [cited 2019 April 20]. Available from: https://www.ncbi.nlm.nih.gov/gen

### ClustAGE

  - Ozer EA. ClustAGE: a tool for clustering and distribution analysis of bacterial accessory genomic elements. BMC Bioinformatics 2018 19:150
  - Saitou, N. and Nei, M., 1987. The neighbor-joining method: a new method for reconstructing phylogenetic trees. Molecular biology and evolution, 4(4), pp.406-425. (Neighbor joining tree)

### iTOL

  - Letunic I and Bork P (2006) Bioinformatics 23(1):127-8 Interactive Tree Of Life (iTOL): an online tool for phylogenetic tree display and annotation (abstract, full article)
  - Letunic I and Bork P (2011) Nucleic Acids Res doi: 10.1093/nar/gkr201 Interactive Tree Of Life v2: online annotation and display of phylogenetic trees made easy (abstract, full article)
  - Letunic I and Bork P (2016) Nucleic Acids Res doi: 10.1093/nar/gkw290 Interactive Tree Of Life (iTOL) v3: an online tool for the display and annotation of phylogenetic and other trees (abstract, full article)
  - Letunic I and Bork P (2019) Nucleic Acids Res doi: 10.1093/nar/gkz239 Interactive Tree Of Life (iTOL) v4: recent updates and new developments (full article)

### MAFFT

  - Katoh, K. and Standley, D.M., 2013. MAFFT multiple sequence alignment software version 7: improvements in performance and usability. Molecular biology and evolution, 30(4), pp.772-780.

### progressiveMauve

  - Darling, A.E., Mau, B. and Perna, N.T., 2010. progressiveMauve: multiple genome alignment with gene gain, loss and rearrangement. PloS one, 5(6), p.e11147.

### Prokka
  - Seemann T, "Prokka: Rapid Prokaryotic Genome Annotation", Bioinformatics, 2014 Jul 15;30(14):2068-9. PMID:24642063 doi:10.1093/bioinformatics/btu153, http://www.ncbi.nlm.nih.gov/pubmed/24642063

### RAST
  - The RAST Server: Rapid Annotations using Subsystems Technology.
    - Aziz RK, Bartels D, Best AA, DeJongh M, Disz T, Edwards RA, Formsma K, Gerdes S, Glass EM, Kubal M, Meyer F, Olsen GJ, Olson R, Osterman AL, Overbeek RA, McNeil LK, Paarmann D, Paczian T, Parrello B, Pusch GD, Reich C, Stevens R, Vassieva O, Vonstein V, Wilke A, Zagnitko O. BMC Genomics, 2008, [ PubMed entry ]
  - The SEED and the Rapid Annotation of microbial genomes using Subsystems Technology (RAST).
    - Overbeek R, Olson R, Pusch GD, Olsen GJ, Davis JJ, Disz T, Edwards RA, Gerdes S, Parrello B, Shukla M, Vonstein V, Wattam AR, Xia F, Stevens R. Nucleic Acids Res. 2014 [ PubMed entry ]
    - RASTtk: A modular and extensible implementation of the RAST algorithm for building custom annotation pipelines and annotating batches of genomes.
      - Brettin T, Davis JJ, Disz T, Edwards RA, Gerdes S, Olsen GJ, Olson R, Overbeek R, Parrello B, Pusch GD, Shukla M, Thomason JA, Stevens R, Vonstein V, Wattam AR, Xia F. Sci Rep., 2015, [ PubMed entry ]

### Spine/ AGEnt

  - Ozer EA, Allen JP, and Hauser AR. Characterization of the core and accessory genomes of Pseudomonas aeruginosa using bioinformatic tools Spine and AGEnt. BMC Genomics 2014 15:737

### Paper for phylogeny of Salmonella

  - Worley, J., Meng, J., Allard, M.W., Brown, E.W. and Timme, R.E., 2018. Salmonella enterica Phylogeny Based on Whole-Genome Sequencing Reveals Two New Clades and Novel Patterns of Horizontally Acquired Genetic Elements. MBio, 9(6), pp.e02303-18.

### Paper for generalist vs host adapted graphic

  - Feasey, N.A., Dougan, G., Kingsley, R.A., Heyderman, R.S. and Gordon, M.A., 2012. Invasive non-typhoidal salmonella disease: an emerging and neglected tropical disease in Africa. The Lancet, 379(9835), pp.2489-2499.

### Papers for strain Information
  - Bangera, S.R., Umakanth, S., Mukhopadhyay, A.K., Leekitcharoenphon, P., Chowdhury, G., Hendriksen, R.S. and Ballal, M., 2018. Draft Genome Sequence of Salmonella enterica subsp. enterica Serotype Typhimurium Sequence Type 313, Isolated from India. Microbiol Resour Announc, 7(8), pp.e00990-18.

  - Deligios, M., Bacciu, D., Deriu, E., Corti, G., Bordoni, R., De Bellis, G., Leori, G.S., Rubino, S. and Uzzau, S., 2014. Draft genome sequence of the host-restricted Salmonella enterica serovar abortusovis strain SS44. Genome Announc., 2(2), pp.e00261-14.

  - Fookes, M., Schroeder, G.N., Langridge, G.C., Blondel, C.J., Mammina, C., Connor, T.R., Seth-Smith, H., Vernikos, G.S., Robinson, K.S., Sanders, M. and Petty, N.K., 2011. Salmonella bongori provides insights into the evolution of the Salmonellae. PLoS pathogens, 7(8), p.e1002191.

  - Fricke, W.F., Mammel, M.K., McDermott, P.F., Tartera, C., White, D.G., LeClerc, J.E., Ravel, J. and Cebula, T.A., 2011. Comparative genomics of 28 Salmonella enterica isolates: evidence for CRISPR-mediated adaptive sublineage evolution. Journal of bacteriology, 193(14), pp.3556-3568.

  - Kingsley, R.A., Kay, S., Connor, T., Barquist, L., Sait, L., Holt, K.E., Sivaraman, K., Wileman, T., Goulding, D., Clare, S. and Hale, C., 2013. Genome and transcriptome adaptation accompanying emergence of the definitive type 2 host-restricted Salmonella enterica serovar Typhimurium pathovar. MBio, 4(5), pp.e00565-13.
