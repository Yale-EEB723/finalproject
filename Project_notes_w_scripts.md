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
        - `ls -d -1 $PWD/* > genome_files.txt`
          - Made the .txt file with all file names needed
        - `perl spine.pl -f genome_files_full.txt --pangenome`
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
    - `$ perl subelements_to_tree.pl -c clustage_subelements.csv -k clustage_subelements.key.txt`
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
    - Then ran the `accessory_elements.txt` files for comparison through ClustAGE
      - Used `--annot` to add annotations to any subelements, files were the accessory_loci.txt List
      - Created these text files with path to file, name of genomes
        - `perl ClustAGE.pl -f accessory_elements.txt --annot accessory_loci_list.txt`
    - Had to add gnuplot to ClustAGE directory bin in order to run the program to produce graphs of accessory `accessory_loci`
      - Got this to work, by compiling with `./configure > make > make install`


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
          - Use command `ncbi-acc-download --format fasta <accession number>`
            - to download files
            - Will do this to get .fasta's of all of my 16 genomes
          - ALso downloaded concatenated .gbk files to run through progressive mauve as well
          - Running both mauve on .fasta and progressiveMauve on .gbk
  - NOTE: Need to include accession numbers ultimately used for Salmonella Sequences
  - Did progressiveMauve using windows java executable, having issues understanding if I received an xmfa file from it
    - using xmfa2fasta.pl to try and see if i can convert file salmonella_16_promauve_full into a fasta file or not
      - `perl xmfa2fasta.pl --file salmonella_16_promauve_full > salmonell_16.fasta`, after moving the file into the same directory as the alignment
    - Goal: to run the alignment file using FastTree. I had uploaded the original fasta files of all of the genomes (concatenated with their plasmids if available) to CSI Phylogeny, but still waiting in queue
      - That will ultimately use FastTree for me, but may have to find alternative route to get phylogenic tree of sequences this way
        - Found other programs:
          - ClustalML
          - ClustalOrigin
            - Both tackle that fact that bacteria experience recombination events
            - Would use these to construct trees of samples
            - If all else fails, revert to using either PhyLIP3 or RaXML
              - don't understand the difference but I think its just a matter of finding the correct pipeline and if I want to identify phylogenies based on SNPs or recombination events/ backbones / LCBs
          - `FastTree -gtr -nt salmonella_16.fasta > tree_file`
            - Did this on a VERY large file (24gb) and unsure if this is too large
            - Was much too large, did not work


### Project Notes 4/10/19
  - Still confused on differences between phylogenetic programs
  - Helpful website: https://www.ridom.de/u/FAQ%253AHow_to_build_Advanced_Phylogenetic_Trees%253F.html
    - Currently looking at using either:
      - Core & Accessory Genome Phylogeny comparison
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
       - `sudo apt-get install gubbins`
    - Installing MAFFT
      - `sudo apt-get install MAFFT`
      - using mafft: `mafft`
        - use fasta file with all genomes/sequences
        - `cat * .fasta > all_salmonella.fasta`
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

  - Later in day:
    - Want to re-download ONLY the chromosomal sequences in FASTA format  
      - Can do this both as one large file and also individually, depending on what service I am using
      - Edited .fasta files to only get chromosomes
        - Uploading to MAFFT online tool, all default except using parameters:
          - `G-INS-1` (Slow; progressive method with an accurate guide tree) to see how it does
        - Also attempting locally:
           - `$ mafft --localpair --maxiterate 1000 salmonella_chromosomes.fasta`
           - actually realized this method may take forever, going with "fast progressive method" as stated on website
         - `$ mafft --retree 2 --maxiterate 0 salmonella_chromosomes.fasta`
          - Ended up not working, always stalling after 5 alignments
            - Would need to use core like Farnam to do this type of alignment, or shorten how many sequences I use which I do not want to do


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
        - `$ conda install bioconvert`
        - `$ bioconvert xfma2phylip`
        - https://github.com/bioconvert/bioconvert
          - numpybase causing issue?
          - going to update Conda Now
          - `$ conda update --prefix /home/aaverdegaal/anaconda3 anaconda`
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
    - Ding better than Ive seen yet so hopeful
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
      - Downloaded it using debian
        - `$ sudo apt-get install clustalml`
      - Ran program using CSI Phylogeny files as input
        - `$ ClonalFrameML snp_tree.main_tree.newick snp_tree.aln.fasta salmonella_clustalml_first`
        - Need to install two R packages to visualize Results
          - `$ conda install -c bioconda r-phangorn`
          - `$ conda install -c r r-ape`
      - Results came out in same folder as CSI_Phylogeny_Results
        - Results had been run through FastTree in pipeline
      - Results for RealPHY are being run in FastTree to see if there are differences
        - `FastTree -nt polymorphisms_move.fas > salmonella_poly_realphy_ft`
        - Created tree successully(?)
          - salmonella_poly_realphy_ft
          - Compare with Clustage Tree and CSI Tree
            - PhyML tree vs FastTree
          - Didn't work correctly for some reason
      - Now run ClustAGE Pipeline with all genomes, including plasmids
          - Re running ClustAGE using all 18 genomes
          - Doing same process as before, as stated above using command line to run Spine then ClustAGE programs
      - And run ClustalFrameML with Rscript now that they are installed
      - IDEA:
        - Maybe run the ClustAGE pipeline, get information on core/ accessory elements in reference genomes, then find a draft genome to run through the software
        - "In this study, we propose a new comparative genomics
approach to identify accessory genomic elements in draft
genomes produced by NGS" - (Ozer et al. 2014 BMC Genomics)
          - Draft genome candidates:
            - Abortus
              - Sequence https://www.ncbi.nlm.nih.gov/nuccore/AUYQ00000000.2?report=gbwithparts&log$=seqview
              - Paper https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3974941/pdf/e00261-14.pdf
            - Typhimurium from India 2018
              - Sequence https://www.ncbi.nlm.nih.gov/biosample/?term=ERS2592364 (?)
              - Paper https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6256508/pdf/e00990-18.pdf
      - Code for ClustAGE this run:
       make list for Spine run for reference genome; creating core genome
        `$ ls * .gb > salmonella_clustage_list.txt`
          - added path to each file using replace command in atom
            - `/c/users/aaver/documents/_ Yale/Spring_2019/Comparative_Genomics/Final_project/Full_Sequence_Set/gbk_full/``
            - Added title (strain name) and gbk after path
            - placed list file in Spine folder (same as `spine.pl`)
       - run Spine with option to create pan genome of reference genomes, and output files to have prefix salmonella_clustage
       - navigate to Final_project/Programs/Spine
        `$ perl spine.pl -f genome_files_full.txt --pangenome -o salmonella_clustage`

#### Project Notes April 16, 2019
  - Today going to try and finish the ClustAGE Pipeline
  - Was reading the Spine/AGEnt Paper and they had to annotate their own Genomes for two of theirs
    - https://bmcgenomics.biomedcentral.com/articles/10.1186/1471-2164-15-737
    - They used RAST
      - If I have to do so, I will use RAST or Prokka, mainly might have to for the draft genome being tested
  - Read in paper as well, that including outlier strain (soil Pseudomonas aeruginosa PA7) greatly changed what the "core" genome was
    - Therefore, they used the parameter -a 90 in order to tell the program that core is any segment of the genome in >90% of the reference strains
      - Doing the same for mine as well
        - `$ perl spine.pl -f salmonella_clustage_list.txt -a 90 -o salmonella_clust_90 --pangenome`
        - Can compare the differences later perhaps based on whatever they did
  - Will have to assemble genome of at least the 313 strain I was looking at
    - Data is from Illumina NextSeq 500 base paired end reads
    - Can use Ray software for this (from paper as well)
      - `$ sudo apt-get install ray`
      http://denovoassembler.sourceforge.net/
    - One set of reads is in SRA format, have to get sra-toolkit
      - `$ sudo apt-get install sra-toolkit`
    - Can run to get fastq files from sra files, with accession number
      - `$ fastq-dump ERX2691743`
    - Running Ray on own computer to try and assemble reads from this fastq file; paired end so assuming they are interleaved?
      - `$ mpiexec -n 2 Ray -k 31 -i ERX2691743`
      - NOTE: Looking back, should have looked to do some quality control on the reads from this set of SRA files, as others have talked about previously in class
        - Seems to have worked well enough to create a working genome to use for the ClustAGE pipeline, however, although a caveat may be if genes are missing from the small regions that were not assembled.
    - Once this is done, going to run through Prokka using a reference Typhimurium genome gbk file that i have (probably the non LT2 one)
    - Description I found of Prokka online when looking at differences between RAST and Prokka
      - "Genome annotation is a two-step process, first you have to predict where the genes are - which tools like Augustus and GeneMark do - then you have to assign function to the predicted genes - usually by means of similarity searches using good quality databases. This is what Prokka and RAST are doing, but integrated in a pipeline. I don't know how RAST works, but prokka uses several programs to predict genes (protein coding, non-coding RNA, tRNA, rRNA, and more) from the genome, then, after having these predictions, it tries to annotated them by searching available databases. Prokka uses Prodigal for protein coding gene prediction, which I don't know if it appropriate for virus gene prediction. But the most important reason your annotation came up mostly as hypothetical proteins probably is you don't have installed an appropriate database to annotate viral genomes - you can pass one at run time with the --proteins option, which will have precedence over other installed databases."
  - Ray finished and was successful
    - Have `contigs.fasta` and `scaffold.FastA`
  - Uploaded `contigs.fasta` to RAST server (got access)
    - using taxonomy ID 90371 to insert information
  - In parallel, will run Prokka on the contigs
    - Use S Typhimurium SL1344 as reference gbk for This
    - `$ prokka --proteins S_Typhimurium_SL1344_FQ.gb --outdir S_Typhimurium_ST313 --prefix S_Typhimurium_ST313 Contigs.fasta`
  - Also do same for S Abortusovis SR44
    - Already in Contigs
      - `$ prokka --proteins S_Typhimurium_SL1344_FQ.gb --outdir S_Abortusovis_SR44 --prefix S_Abortusovis_SR44 AUYQ02.1.fa`
  - Now ready to use AGEnt to predict accessory elements in two new draft Genomes
    - Paper states that they used the core genome generated by Spine as the core/reference (-r) sequence in the AGEnt command
    - Moved files relevant to this to the Programs/AGEnt/ folder
      - `$ perl AGEnt.pl -r salmonella_clustage.backbone.fasta -q S_Abortusovis_SR44.gbk -o S_Abortusovis_SR44_AGEnt`
        - Used Prokka annotated genome .gbk file for this
    - Now for S_Typhimurium_ST313
      - `$ perl AGEnt.pl -r salmonella_clustage.backbone.fasta -q S_Typhimurium_ST313.gbk -o S_Typhimurium_ST313_AGEnt`
        - Attempted to use RAST annotated genome file for this, but ran into issue with CDS region not included (?)
        - Just used the Prokka annotated one instead
    - For ClustAGE, wanted to remove a prefix I had added (salmonella_clustage.) so I actually (sadly) found the easiest command to be in powershell for both .fasta and .txt files
      - `get-childitem * .txt | foreach { rename-item $_ $_ .Name.Replace("salmonella_clustage.", "") }`
      - `get-childitem * .fasta | foreach { rename-item $_ $_ .Name.Replace("salmonella_clustage.", "") }`
    - Moving files to make it easier for ClustAGE analysis (same directory)
      - `$ mv * accessory.fasta FASTA_Accessory`
      - `$ mv * accessory_loci.txt Txt_loci_Accessory`
    - Making files for referencing these files in the ClustAGE software command line
      - Helpful command to make list of path and file to easily work with after:
        - `$ find $(pwd) > fasta_accessory_list.txt`
    - Running ClustAGE with all 20 Genomes
      - `$ perl ClustAGE.pl -f fasta_accessory_list.txt --annot loci_accessory_list.txt -p`
    - Move to Clustage/utilies/ folder
    - Used .csv and .key.txt files to create a tree file to use to construct a Phylogeny
      - `$ perl subelements_to_tree.pl -c out_subelements.csv -k out_subelements.key.txt`
        - This used Phylip3 to create a NJ tree from the comparison of the accessory genomic elements of all of the genomes analyzed
    - Plotting circular plot to show bin relationships between Genomes
      - http://vfsmspineagent.fsm.northwestern.edu
      - default settings


### April 18, 2019 Project Notes
-   Looking at papers for Spine/AGEnt and ClustAGE before moving forward
  - Goals today:
      - To identify specifically why this is a useful pipeline for my work
      - Nuances in the pipeline that dictate why we did what we Did
        - ie: Why use the reference genomes to make the core genome and then add two draft genomes in later using AGEnt? Why not do them simultaneously
      - Try and ID one or two genes or gene islands that were IDed in this screen that are unique or the same between species
        - ie: Look at the accessory genome of S_Abortusovis_SR44 and determine what the pathogenic islands or genes could be since this genome was just sequenced late last year
      - Create a better graph than ClustAGE Plot webtool can
      - ID stats on assembling the reads for S_Typhimurium_ST313 Genome (from Ray software)
          - Took about 1h 12m Processing gene ontologies	2019-04-16T12:31:33	9 seconds	1 hours, 12 minutes, 32 seconds
          - Using QUAST online webtool to analyze the assembly of the contigs from S_Typhimurium_ST313
            - http://quast.bioinf.spbau.ru/
            - Used S_Typhimurium_SL1344_FQ as the reference (.fasta) and its annotations (.gff3)
            - Have information on the Ray assembly now
      - Re run ST313 with velvet
        - Getting velvet and velvetoptimiser from `sudo apt-get install`
        - `$ velveth Assem 31 -shortPaired -fastq ERX2691743.fastq`
          - Using this website to help
          - http://evomics.org/learning/assembly-and-alignment/velvet/
        - `$ velvetg auto_33 -exp_cov auto`
          - Final graph has 1481591 nodes and n50 of 29, max 269, total 20415996, using 99802/591656 reads
        - Ended up not using velvet, there seem to be some issues with the output, unsure of how to move forward with files output
        - Going to just stick with assembly that I got from using Ray



    - From Spine/AGEnt paper:
      - "Only completed genomic sequences were used to calculate the core genome to minimize the potential for core sequence to be excluded as the result of undersequencing or misassembly in incomplete draft sequences."
        - States why whole genomes are used as reference and why AGEnt is important to use that core genome to decipher accessory genome of newly assembled, potentially draft genome strains
      - "As more completed genomes become available and are added to this analysis, it is anticipated that the size of the core genome will decrease. A curve fit to the data in Figure 2 suggests that the core genome size may plateau at approximately 5.10 Mbp, or 78% of the P. aeruginosa genome.""
      - "novel accessory genomic sequences will continue to be forthcoming, especially in bacteria such as P. aeruginosa with theoretically open genomes. For this reason, methods for rapidly and accurately identifying accessory genome sequences are needed. To accomplish this, we developed a new software algorithm for identification of both core and accessory genomes from bacterial genome sequences."
  - Also created file of list of chromosome and plasmid accession numbers used in the analysis
    - `Accession_list_chromosomes_plasmids.txt`
  - In parallel, wanted to see what I would get with using RealPHY as a way to infer phylogenetic relationships between the same two draft genomes and the reference genomes:
    - https://realphy.unibas.ch/realphy/
    - Placed the 18 reference Genomes
    - Used .fa of Abortusovis and the .fastq of S_Typhimurium_ST313
    - Going to see if this works
      - Failed
    - Retrying using contigs.fasta file received from Ray assembly of fastq files
  - Paper on P. aeruginosa that was a lead-in to creating Spine/AGEnt/ ClustAGE talks about core genome components and reasoning for looking at accessory parts of the genome
    - https://www.pnas.org/content/pnas/105/8/3100.full.pdf
    - Paper has nice figures, trying to figure out how to create the circular figure with the pangenome and other accessory elements within it
    - Also, paper has Supp Table 1, which lists genomes and particular aspects of them that are IMPORTANT
      - Origin, Size, ORFs, tRNAs, GC content, # of genes, # of essential genes, # of RGPs, References to genomes
        - Might want to consider doing this for my set of genomes!!
- Make phylogeny of these serovars and include on the tree if they are host adapted/ specific or generalists
  - Maybe add this to the table of looking at genome qualities
- Do I need to worry about prophage sequences? Do I need to annotate these? Looking at paper, they went beyond using RAST to annotate genome, quoted here:
    - "which were not yet annotated in GenBank, were downloaded and automated annotation performed using the Rapid Annotations using Subsystems Technology (RAST) web service [62]. Functional annotation of genes and transposase identification was accomplished by BLASTp alignment of annotated ORFs against the COG database [46,47] using BLAST + v2.2.24 [92,93]. Prophage sequence was predicted in the reference strains using the web-based service PHAST [94], which detects prophage sequences in bacterial genomes using database comparisons and feature identifications. ICE genes were identified by BLAST homology to proteins in the ICEberg database [95] using homology cutoffs of Evalue ≤1e-6 and percent identity ≥ 85%. To identify integron sequences, the type 1 integron flanking sequences of sul1 and intI1 from NCGM2.S1 were obtained from the Pseudomonas Genome Database [96]. Nucleotide BLAST alignment of these sequences against the reference genomic sequences was used to identify potential type 1 integron structures."
    - Does prokka take care of this?
  - See if I can determine the same things that the Spine/AGEnt paper did about the Pseudomonas genomes
    - Composition of accessory elements
- Re doing Prokka for S_Typhimurium_ST313
  - Found out that should have used the scaffolds.fasta not the contigs.fasta, for contiguous sequence
    - Actually dont think it really matters now
  - `$ prokka --proteins S_Typhimurium_SL1344_FQ.gb --outdir S_Typhimurium_ST313_scaffold --prefix S_Typhimurium_ST313 scaffolds.fasta`
    - Taking this .gbk file and running it through webtool ICEfinder
      - http://202.120.12.136:7913/ICEfinder/ICEfinder.html
  - Doing same for S_Abortusovis_SR44 to annotate that file in a similar fashion
  - Once S_Abortusovis_SR44 is done in Prokka, going to run that .gbk file through ICEfinder as well
      - Ended up not working correctly, tried to use webtool but it wouldn't run the whole file, just kept running only one contig?
  - Running RAST again as well with S_Typhimurium_ST313 `scaffolds.fasta` file instead this time
    - Should help with any missing regions, so get those and use both ST313 and SR44 together in the Spine analysis later
    - ERROR: Got convergent overlap error again, dont know how to fix
      - Going to move forward with just the Prokka annotations
  - Looking at ICEberg since Spine paper used it for its annotations
    - http://db-mml.sjtu.edu.cn/ICEberg/
    - But appears to be a blast service to create a blast database, dont know how they then went ahead and use this information to annotate their genome
      - Ended up not doing this part of the pipeline (ICE finding)
    -


#### Ideas for Presentation
  - Talk about these things in this order or similar:
    - Background on pathogenic bacteria
    - Background of Salmonella and differences in pathogenicity and host adaptation
      - What is responsible for this? Accessory parts of genome?
    - Methods that I had hoped to use and what I ended up doing
      - Multiple genome alignments and issues with that
        - file format of Mauve alignment
        - MAFFT computing power needed, doing locally vs. web based tool, could have utilized Farnam
      - wanting to make phylogenetic trees based on different ways of intepreting this info
      - Decided on CLustAGE pipeline due to variation in gene content of pathogens most likely for differences in host specificity (thinking other example of Pseudomonas)
    - Go over data used how it was isolated
      - Reference genomes
      - Draft genomes
    - GO over Spine/AGEnt tools
      - Spine to get core genome using reference genomes (whole genomes, gbk (fasta+gff3) files)
      - AGEnt to determine new draft genomes accessory elements
        - Take draft genomes
          - Assemble ST313
            - Ask about best way to pursue This
            - Talk about issues regarding:
              - Using velvet
              - Finding right Kmer length
              - Doing QC analysis (using Quast) on the data
              - Dont know how to fix, or work with this, also apparently the draft genome is already available somewhere but I didnt find it
          - Annotate SR44 and ST313 with Prokka
            - Used S_Typhimurium_SL1344_FQ as the reference for this, along with protein databases
            - Talk about issues with Prokka, basically just find genes already known but not going to make an ab-initio assumptions of CDS regions
              - This might be alright, since these genes are so closely related, that most likely genes of interest will be annotated from database having a plethora of Salmonella enterica genes already, so shoud be able to annotate
              - Interesting part is combination or presence/ lack of genes in reference to other genes that are found in similar serovars
    - How ClustAGE is used
    - Data from ClustAGE
      - SHow graphs, examples of accessory elements
    - GO over potential genes and look at where these genes are located in the accessory elements and which species share them


### Presentation Notes
- Jasmine's Presentation
  - Agalma
    - Identifying homologs, possible with bacterial genes?
      - Get homoloy ID and gene name from This
    - GFF3 + Homology info
      - Can aggregate and ID genes, scaffold, and what genes they are homologous to
  - Make contingency matrix, then use this to make similarity matrix (Jaccard matching coefficient), Clustering algorithm (Cross clustering) then you get syntenic blocks defined by cluster ID
  - Use tsne to represent cluster information
    - Maybe use this for homologs if I do this in Salmonella?
  - Tinyverse analysis at Amazon Cloud?
    - Do small data sets
  - Run R analysis on singularity on the cluster
  - Running R analyses on different platforms will give different file formats

- ggplot2 to plot data?
  - Suggested by Casey

### April 19, 2019

  - Looking at best way to assemble these reads
    - Running into issues with finding the actual draft genome from ST313 paper, assumed that the reads were the only thing available, could not find the draft genome, so I had used Ray > Prokka  to assemble/ annotate
    - ST313 paper states they use CGE Assembler which works off a Velvet core
      - https://cge.cbs.dtu.dk/services/Assembler/
    - Just uploaded the .fastq files I had to this service to see if I got the same assemble as they did (79 contig instead of 100+)
      - Used the "trim reads" option
    - Error: Needs paired end Illumina reads to be in two files
    - Splitting the fastq interleaved file using Galaxy webtool for FastQ Splitter then trying again
      - https://usegalaxy.org/
    - Downloading files and going to apply to the CGE Assembly server
    - Ended up not working, and kept running into errors uploading these fastq files
      - Going to just use the Ray output, although it itself is not perfect

### April 20, 2019

  - With newly annotated forms of ST313 and SR44 serovars (using the scaffolds.fa instead of contigs.fa), rerunning Spine/AGEnt/ ClustAGE pipeline as described above
    - In review:
```
# Spine creates core genomes as well as identify accessory genomes of all input reference genomes; Core genomes identified as being found in 90% of genomes input (17/18)
$ perl spine.pl -f salmonella_clustage_list.txt -a 90 -o salmonella_clust_90 --pangenome
# AGEnt used to ID accessory genomic elements of newly annotated draft genomes
`$ perl AGEnt.pl -r salmonella_clustage.backbone.fasta -q S_Abortusovis_SR44.gbk -o S_Abortusovis_SR44_AGEnt`
`$ perl AGEnt.pl -r salmonella_clustage.backbone.fasta -q S_Typhimurium_ST313.gbk -o S_Typhimurium_ST313_AGEnt`
# Run the accessory genomes (referred to in the list fasta_accessory_list.txt) with another input identified the annotated CDS of each region (--annot <file>)
`$ perl ClustAGE.pl -f fasta_accessory_list.txt --annot loci_accessory_list.txt -p`
# Relocate output files that include the subelements present in each accessory genome along with a key of the annotated region to folder containing a perl command to analyze the similarity of the serovars using a Neighbor Joining method in Phylip3, creating a tree output file along with a heat map that ID's similarities between the genomes
`$ perl subelements_to_tree.pl -c out_subelements.csv -k out_subelements.key.txt`
```
  - Use the output files (.tree and heatmap files) in iTOL, a free online tool for displaying and creating visualizations of trees
  - This will be used to show the relationships of all 19 enterica genomes, along with their relationship to the one S. bongori genome included; Comparing this to the tree previously created of only 16 reference genomes

- Found chloramphenicol resistance genes, type III secretion effector proteins, and hypothetical proteins that were then used as images in class presentation
  - Bins were identified by looking at literature or potential genes that I personally am knowledgeable about concerning what would be interesting
  - Did not do anything fancy, I did so by looking at individual bins that had shared or dissimilar gene patterns and seeing if those genes related to something of interest by then searching for the relevant Annotations in `out_subelements.annotations.txt`
    - Bins IDed were:
      - 93
      - 220
        - Genes unique to S_Abortusovis_SR44
      - 297
        - Hypothetical Genes unique to S_Abortusovis_SR44
      - 524
        - Efflux pump for chloramphenicol resistance (source: UniProt)
      - 555
        - Hypothetical protein for abx resistance (sourch: UniProt)
        - cat2
          - Known protein for Chloramphenicol resistance
- Including these bins in separate folder in Data on git repository
- Also including an attempted BLAST search done on one of the proteins found in one of the bins (524) by looking for the gene ENA|ACF88516|ACF88516.1 Salmonella enterica subsp. enterica serovar Schwarzengrund str. CVM19633 chloramphenicol resistance protein using BLAST search on NCBI of any bacteria that share this, just to see its spread
- IDed genes that were similar in other species, downloaded those in `seqdump.fasta` and tried a MEGA alignment, although it doesn't show much anything interesting, just that it is a similar protein in all of these different bacterial species
  - Possible event of Horizontal Gene Transfer so that only two of the genomes (CVM1966 and SCB67) had this gene, which could be clinically relevant

### April 21, 2019

  - Attempted to rerun MAFFT alignment locally and with different parameters (fastest available)
     - `$ mafft salmonella_chromosomes.txt > salmonella_chrom_mafft.txt`
      - Basically default parameters, auto detecting which ones to use; salmonella_chromosomes.txt is a list of only chromosomes of the serovars (and not including any chromosomes) just to see if I could get the MAFFT to work for the chromosomes alone
      - Again, program made it to the fifth iteration about (5/17 chromosomes being analyzed) and got hung up for hours
      - Had to cancel program and move on without using another multiple genome aligner

## Final Note

  - To get genomes used in this study, I ID'ed genomes that I wanted, found their accession numbers, and used the Batch Entrez function of NCBI to call all genomes by providing the accession number in a .txt file and download the information directly from NCBI
    - https://www.ncbi.nlm.nih.gov/sites/batchentrez
    - Information received from GenBank
      - https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4702903/pdf/gkv1276.pdf
