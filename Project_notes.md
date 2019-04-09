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
