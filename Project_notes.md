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
