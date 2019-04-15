### Comparative Notes 4/7/19
  - Going to create tree using Mauve alignment output files (hopefully)
    - Found instructions how to do son
  - Found new program as well
    - https://github.com/xavierdidelot/clonalorigin
    -  Looks at recombination events of species using whole genomes
    - May just give it a try with a few of our strains
  - Going to annotate LT2 fasta file, then make a new alignment
  - Having issue determining which seq file goes to which node on the tree created using the online software
    - http://etetoolkit.org/treeview/
  - Another software package found for phylogenetic analysis is MEGA
    -  https://www.megasoftware.net/


### Project Notes 4/8/2019
  - Running Spine through web-based tool using genebank (.gbk) files instead of gff3+FastA
    - Had issues reconciling which files had what, thought my gff files had both fasta+gff in there but the program did not recognize fasta portion
    - Spine: "Spine identifies a core genome from input genomic sequences. Sequences are aligned using Nucmer and regions found to be in common between all or a user-defined subset of genomes will be returned."
      - Nucmer:
        - "nucmer (NUCleotide MUMmer) is the most user-friendly alignment script for standard DNA sequence alignment. It is a robust pipeline that allows for multiple reference and multiple query sequences to be aligned in a many vs. many fashion."
        - http://nebc.nox.ac.uk/bioinformatics/docs/nucmer.html
      - Attempting spine on my computer as well, figured out the file mistakes I think, just needed to add in all file names to a .txt file and then run the program with that
        - ls -d -1 $PWD/* > genome_files.txt
          - Made the .txt file with all file names needed
        - perl spine.pl -f genome_files_full.txt --pangenome
          - got output core genome, aligned similar loci, and a pangenome
        - Now running AGEnt on my own to see what I get
  - Should get from Spine
    - Core genome
    - Pangenome
    - Data of alignment regions to allow me to use these loci in AGEnt before moving on to using ClustAGE
  - Citations of this software:
  " If you find the tools Spine and AGEnt useful in your own research, please cite our manuscript:
Ozer EA, Allen JP, and Hauser AR. Characterization of the core and accessory genomes of Pseudomonas aeruginosa using bioinformatic tools Spine and AGEnt. BMC Genomics 2014 15:737

If you use ClustAGE, please cite this manuscript:
Ozer EA. ClustAGE: a tool for clustering and distribution analysis of bacterial accessory genomic elements. BMC Bioinformatics 2018 19:150 "
  - From Spine webtool, able to go directly with those results into ClustAGE webtool
    - Had fasta and accessory loci automatically placed to be used in analysi, just need to run
    - Running ClustAGE now

#### ClustAGE Results
    - Got many bins with shared or unique (depending on the strain) genomic loci between the strains I analyzed
    - Can apparently use this information to create a tree of relationship of containing these elements (instead of just based on sequence similarity)
    - This pipeline script calculates a Bray-Curtis distance matrix from distributions of accessory elements that it uses to create a neighbor joining tree of accessory element distribution patterns. Note these distances are not based on sequence similarity, but only on presence or absence of an accessory element within a genome within the threshold parameters given to ClustAGE. It will also produce output files that can be used to create a heatmap of Bray-Curtis similarity values.
    - Analyzing further using subelements_to_tree.pl
    - Makes a tree file as well as heatmap for comparing presence of similar regions between Genomes
    - Used Phylip to help run This
      - http://evolution.genetics.washington.edu/phylip/getme-new1.html
      - perl subelements_to_tree.pl -c clustage_subelements.csv -k clustage_subelements.key.txt
    - ClustAGE site says to use either iTOL (online) or FigTree (software) to view trees
    - Can also produce a ClustAGE plot here:
      - http://vfsmspineagent.fsm.northwestern.edu/cgi-bin/clustage_plot.cgi

##### Clustage paper
  - From the paper itself
    - " The approach to accessory genome characterization taken by ClustAGE differs from these other approaches in that ClustAGE compares the complete nucleotide sequences of the accessory genome rather than just the protein-coding sequences. A nucleotide-sequence-based, gene-agnostic approach offers several advantages in characterizing AGE distributions. First, the identification of shared accessory elements does not depend on annotation techniques, which may differ in technique and results between strains available from public databases or collaborators. Second, intergenic sequence distribution can be studied, allowing distributions of non-protein-coding sequences such as promoter sequences or small RNAs with potential biological relevance in the accessory genome of the population to more easily be analyzed. Third, this approach has the potential to capture variable regions within otherwise conserved genes that may have arisen by homologous recombination or other mechanisms. The data generated by this software allow detailed analysis of the flexible portion of a population’s pangenome."


### More Data
  - Now that I have sucessfully used the ClustAGE pipeline, I will now attempt to do a larger number of Salmonella representative genomes:
    - List of accession numbers
      - CP003047
      - CP001138
      - CP001144
      - CP001120
      - CP001113
      - CP001127
      - AE017220
      - AM933172
      - AM933173
      - FM200053
      - CP000026
      - CP000886
      - CP000857
      - AL513382
      - AE014613
      - AE006468
    - Then there is this set of contigs from an ovine adapted strain, with 213 contigs
      - AUYQ00000000
      - If I can, I may try to assemble this genome myself if it is not available online
      - Probably won't since that would be a side Project
    - Used Spine to run the alignment to create accessory element files along with correct annotations
      - Used .gbk files found from NCBI search
        - Used plasmids as well this time if the annotated/ assembled sequences were available
        - Important for virulent strains
        - Ran the plasmid+chromosomes together by using commas to separate the files
          - perl spine.pl -f genome_list_plus_plasmids.txt --pangenome
        - Ran into issues with using Salmonella_Typhi_Ty2.gb downloaded from NCBI
          - Just ran it through Prokka instead, and used that gbk file
            - Was missing a CDS annotation
    - Then ran the accessory_elements.txt files for comparison through ClustAGE
      - Used --annot to add annotations to any subelements, files were the accessory_loci.txt List
      - Created these text files with path to file, name of genomes
        - perl ClustAGE.pl -f accessory_elements.txt --annot accessory_loci_list.txt
    - Had to add gnuplot to ClustAGE directory bin in order to run the program to produce graphs of accessory accessory_loci
      - Got this to work, by compiling with ./configure > make > make install


### Project Notes 4/9/2019
  - Want to find one or two programs to run phylogenetic analysis on the whole genome as a contrast to the method using Clustage
  - Found two programs, well actually one, but one is an pipeline and one is just using the program manually
    - FastTree is the manual program, trying to figure out how to compile and run this on my computer
      - Attempting to install through a conda package currently
    - Other is CGE CSI Phylogeny
      - https://cge.cbs.dtu.dk/services/CSIPhylogeny/
      - Will use both, both ultimately used FastTree
        - Supposed to be better than PhyLIP3 (that is usually referred to previously)
  - Same time, figuring out a way to download ncbi files quickyl
    - Found a program called
        - ncbi-acc-download
          - https://github.com/kblin/ncbi-acc-download
          - Use command ncbi-acc-download --format fasta <accession number>
            - to download files
            - Will do this to get .fasta's of all of my 16 genomes
          - ALso downloaded concatenated .gbk files to run through progressive mauve as well
          - Running both mauve on .fasta and progressiveMauve on .gbk
  - NOTE: Need to include accession numbers ultimately used for Salmonella Sequences
  - Did progressiveMauve using windows java executable, having issues understanding if I received an xmfa file from it
    - using xmfa2fasta.pl to try and see if i can convert file salmonella_16_promauve_full into a fasta file or not
      - perl xmfa2fasta.pl --file salmonella_16_promauve_full > salmonell_16.fasta, after moving the file into the same directory as the alignment
    - Goal: to run the alignment file using FastTree. I had uploaded the original fasta files of all of the genomes (concatenated with their plasmids if available) to CSI Phylogeny, but still waiting in queue
      - That will ultimately use FastTree for me, but may have to find alternative route to get phylogenic tree of sequences this way
        - Found other programs:
          - ClustalML
          - ClustalOrigin
            - Both tackle that fact that bacteria experience recombination events
            - Would use these to construct trees of samples
            - If all else fails, revert to using either PhyLIP3 or RaXML
              - don't understand the difference but I think its just a matter of finding the correct pipeline and if I want to identify phylogenies based on SNPs or recombination events/ backbones / LCBs
          - FastTree -gtr -nt salmonella_16.fasta > tree_file
            - Did this on a VERY large file (24gb) and unsure if this is too large


### Project Notes 4/10/19
  - Still confused on differences between phylogenetic programs
  - Helpful website: https://www.ridom.de/u/FAQ%253AHow_to_build_Advanced_Phylogenetic_Trees%253F.html
    -   Currently looking at using either:
      -   Core & Accessory Genome Phylogeny comparison
        - multiple alignment with MAFFT (Mol Biol Evol. 2013, 30:772)
        - ClonalFrameML (PLoS Comput Biol. 2015, 11:e100404),
        - ( or ClonalOrigin)
        - Also believe my analysis using ClustAGE is similar to this approach
          - Need to review what makes ClustAGE different from ClonalFramML
      - Whole Genome SNP Phylogeny approach:
        - multiple alignment of de novo assemblies with progressiveMauve (PLoS One. 2010, 5:e11147)
        - Gubbins masking of recombinatory sites in multiple alignment
        - FastTree MP- or ML-trees
      - Seems from research that MAFFT and MAUVE are similar in terms of algorithm in aligning Genomes
        - However, I need an output where I can then use this file to analyze downstream with Gubbins and then FastTree
#### Today, going to attempt two things and research something:
    - Install Gubbins, see where I can get with making a phylogeny using this method (does it use progressiveMauve alignment as input?)
      -   Then make tree using FastTree (hopefully)
    - Install ClonalML pipeline and run that process
      - I believe it has alignment built in
    - Research differences between mauve/Gubbins, ClonalFrameML, and ClustAGE
    - Installing gubbins (http://sanger-pathogens.github.io/gubbins/)
      sudo apt-get install gubbins
    - Installing MAFFT
      - sudo apt-get install MAFFT
      - using mafft: mafft
        - use fasta file with all genomes/sequences
        - cat * .fasta > all_salmonella.fasta
        - Seems to be stalling, dont know how fast it will go to be honest
        - Choosing to see if the online tool works any better for the 30 sequences I am uploading (since some of the plasmids are involved)
    - Using MAUVE to align genomes (instead of ProgressiveMauve)
      - Still don't understand how to either have or convert alignment files for use in gubbins
  - IMPORTANT:
    - Found software to analyze evolution of nucleotide traits/ relationships between related bacteria
      - BEAST 2 and the Bacter package
        - Idea: upon identifying a useful gene/ island, use this software to analyze the evolution of that alignment
    - Found bioarxiv paper talking about how they aligned genomes and analyzed
      - used REALPHY online tool (or can use command line)
        - https://github.com/fredeBio/REALPHY
        - https://realphy.unibas.ch/realphy/
        - Results: https://realphy.unibas.ch/REALPHY/scratch/data_op230wmv/report/

    - Later
      - Want to re-download ONLY the chromosomal sequences in FASTA format  
        - Can do this both as one large file and also individually, depending on what service I am using
        - Edited .fasta files to only get chromosomes
          - Uploading to MAFFT online tool, all default except using parameters:
            - G-INS-1 (Slow; progressive method with an accurate guide tree) to see how it does
          - Also attempting locally:
             mafft --localpair --maxiterate 1000 salmonella_chromosomes.fasta
             - actually realized this method may take forever, going with "fast progressive method" as stated on website
           mafft --retree 2 --maxiterate 0 salmonella_chromosomes.fasta


### April 15, 2019
  - Running CSIPhylogeny online tool using LT2 as reference genome
    - Seems like it was successful this time
    - Forgot to include LT2 in phylogeny, so redoing, and trying do to with full genome fasta files
  - Will run genomes also through:
    - ClonalOrigin and/or ClonalFrameML
    - ClustAGE
  - Make sure progressiveMauve data is there as well
    - Identify gene that is different between different species
      - Compare this gene and create phylogeny based on its evolution
      - Use MEGA to do this alignment/ phylogeny
  - Running all genome comparison on RealPHY
    - Reference is Salmonella_Typhi_Ty2
    - Used all gbk full files
  - Running salmonella_chromosomes.txt on MAFFT server, default settings on FS-1
    - https://www.genome.jp/tools-bin/mafft
    - Didnt work (txt file too large, too many NTs)
  - Goal is to get alignment in order to run it on PhyML (phylip file) to get starting tree, and a multiple alignment file (either fasta or XFMA), both needed for ClonalML pipeline
    - For some reason, have trouble finding a way to use mauve output files
      - for .alignment (xfma) conversion, found software package in conda (bioconvert)
        - conda install bioconvert
        - bioconvert xfma2phylip
        - https://github.com/bioconvert/bioconvert
          - numpybase causing issue?
          - going to update Conda Now
          - conda update --prefix /home/aaverdegaal/anaconda3 anaconda
  - Found new software called MUGSY
    - Getting desperate since online service for MAFFT above said my file was too big (>50kb, mine is 86kb)
    - Will look at MUGSY now
      - https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3031037/
      - http://mugsy.sourceforge.net/
      - Will try Mugsy after MAFFT is done running or cant run on my laptop
      - May also try MrBayes
        - Just getting into the idea that there are different methods for Phylogeny
        - Bayesian inference, Maximum Parsimony, and Maximum Likelihood
  - Running MAFFT on own computer with FS-1 setting, default everything else
    - Should output a phylip and fasta file if works
    - DOing better than Ive seen yet so hopeful
  - Also want to use Brig to show comparison of Genomes
    - http://brig.sourceforge.net/
  - Read about:
    - ClustAGE
    - ClustalML
    - progressiveMauve
    - CSI Phylogeny
  - Reading papers from xavierdidelot
    - ClonalFram original paper (Inference of bacterial microevolution using multilocus sequence data) very useful for background on clonal comparison
    - ClonalFrameML paper good follow up to this, discussing how they used the new frame work in C diff
      - They discuss that while using ClonalFrameML, in a couple papers and on the website, that they had to use the CORE genome of S aureus else it would upset what they were studying
  - Ultimately, I think I will most likely try and compare what information progressiveMauve, ClustalFrameML, and ClustAGE can give you (?)
    - Will have to flesh this out more, however

  - Code:
    - ClustalML
      - #Downloaded it using debian
        - sudo apt-get install clustalml
      - #Ran program using CSI Phylogeny files as input
        - ClonalFrameML snp_tree.main_tree.newick snp_tree.aln.fasta salmonella_clustalml_first
        - Need to install two R packages to visualize Results
          - conda install -c bioconda r-phangorn
          - conda install -c r r-ape
      - Results came out in same folder as CSI_Phylogeny_Results
        - Results had been run through FastTree in pipeline
      - Results for RealPHY are being run in FastTree to see if there are differences
        -  FastTree -nt polymorphisms_move.fas > salmonella_poly_realphy_ft
        - Created tree successully
          - salmonella_poly_realphy_ft
          - Compare with Clustage Tree and CSI Tree
            - PhyML tree vs FastTree
      - Now run ClustAGE Pipeline with all genomes, including plasmids
      - And run ClustalFrameML with Rscript now that they are installed