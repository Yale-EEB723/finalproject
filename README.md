# Final Project

## Introduction

This is a final project for the [Comparative Genomics](https://github.com/Yale-EEB723/syllabus) seminar in the spring of 2019. This project used RNA-seq data published on SRA to test the monophyly of Cyclostomata, the living jawless fishes.

## The Goal

The goal of this preliminary study was to use RNA-seq data to infer a tree that will test the phylogenetic relationships between hagfishes (Myxiniformes), lampreys (Petromyzontiformes), and jawed vertebrates (Gnathostomata). Originally, the goal was to use all relevant publicly available transcriptome and genome data in this analysis. Although I was able to load and edit paired-end SRR data from all relevant studies into my Agalma database for future use, to reduce the computing time and resources of the analyses, I shifted the goal of my project to simply getting the Agalma pipelines to work all the way through, and to inferring a vertebrate phylogeny with a tunicate outgroup.

## Background

A longstanding problem in vertebrate phylogenetics is the disagreement between morphological and molecular data in inferring the relationships between hagfishes, lampreys, and jawed vertebrates. In the early 19th century, taxonomists divided Vertebrata into two major taxonomic divisions: 1.) Gnathostomata (comprised of the jawed vertebrates) and 2.) Agnatha (the jawless vertebrates), of which lampreys (Petromyzontiformes) and hagfishes (Myxiniformes) are the only extant lineages. Hagfishes and lampreys collectively comprise Cyclostomata, a taxonomic class defined by their epidermal teeth-like structures and their internally positioned branchial arches. 

The advent of cladistics, however, began to cast doubt on the legitimacy of Cyclostomata. Indeed, though there has consistently been strong support for the monophyly of Myxiniformes and Petromyzontiformes themselves, phenotypic data has historically supported the paraphyly of Cyclostomata, with hagfishes hypothesized to fall outside the vertebrate node (Lovtrup, 1977). Most notably, the presence of a complete cranium and a rudimentary vertebrae in petromyzontiforms suggest that lampreys are perhaps more closely related to the vertebrate crown group (in contrast, hagfishes display only a partial braincase made of cartilage and have no vertebrae) (Ota and Kuratani 2007). Most morphological hypotheses therefore supported the paraphyly of Cyclostomata, suggesting that the anatomical similarities between Myxiniformes and Petromyzontiformes were not synapomorphies, but ancestral accommodations to their burrowing and parasitic modes of life.
 
Although phenotypic characters support the monophyly of lampreys and jawed vertebrates, early molecular analyses reaffirmed the monophyly of Cyclostomata and its sister relationship to Gnathostomata (Kuraku 2008, Near 2009, Kuraku 2010, Heimberg *et al.* 2010). The addition of just a few phenotypic characters into a molecular analysis however, has been shown to sway the phylogenetic inferences of cyclostome monophyly and override the effects of even large molecular datasets (Near 2009). This discrepancy between phenotypic and molecular vertebrate trees, is suspected to be partially due to the timing of diversification between hagfishes and lampreys (~400 mya) (Near 2009, Kuraku 2010). Nevertheless, a recent study marrying morphological and molecular data, as well as a new, significantly-timed hagfish fossil, supports the sister relationship of hagfishes and lampreys relative to jawed vertebrates (Miyashita *et al* 2019). This class project was inspired by this Miyashita *et al.* (2019) study, as I was surprised to see that they used only one mtDNA gene (CO1), given that there have been many hagfish and lamprey transcriptomes published over the past ten years. Only one previously published study has inferred the relationships between lampreys, hagfishes, and jawed vertebrates using phylogenomic data (Delsuc *et al.* 2018). This study found strong support for Cyclostomata as a clade. However, the focus of this Delsuc *et al* (2018) study was to infer the relationships within Tunicata, so data from only one hagfish and one lamprey were included. The aim of this class project was therefore to infer the relationships between these three significant vertebrate lineages using more RNA-seq data than was included in the Delsuc *et al.* (2018) study.


## The Data
Please refer to the Final_samplelist.xlsx file in the repo for further information on the data that was used in this study, as well as sequences/assemblies that are available for future related projects. Since the goal of this project shifted to getting practice with transcriptome data and assembly pipelines rather than producing a tree with the most comprehensive dataset possible, I disregarded  potentially useful data from 16+ sequencing runs. 

Paired-end sequences are accessible on the NCBI Sequence Read Archive (SRA) for the following lamprey species: *Petromyzon marinus* (Petromyzontidae: Petromyzontinae), *Lethenteron camtschaticum* (Petromyzontidae: Lampetrinae), *Mordacia mordax* (Mordaciidae), and *Geotria australis* (Geotriidae). Here, we chose to use RNA-seq data for the lamprey species *Petromyzon marinus* (Petromyzontindae) and *Mordacia mordax* (Mordaciidae). A 5X assembled genome for *Petromyzon marinus* is publicly available on the SRA. The SRA also has published transcriptome data for *Lampetra planeri* (Petromyzontidae: Lampetrinae) but although the library is listed as paired on the database, processing the downloaded data using fastq-dump resulted in only one sequence. Although at first I assumed this meant the data is unpaired, in retrospect I believe the problem may have been caused by the fact that the sequencing instrument used was a NextSeq 500 rather than an Illumina instrument. In the future, further thought will have to go in to how to utilize non-Illumina data (from what I have read, it seems to be problematic in the Agalma pipeline anyway).

RNA-seq data for hagfish species is more limited (both in terms of species-coverage and overall projects), though there exists a publicly available *Eptatretus burgeri* genome (210X). The SRA holds paired-end transcriptome data for two hagfish species (*Eptatretus burgeri* and *Eptatretus cirrhatus*), which were both included in this study.

To represent Vertebrata, we included transcriptome data for *Urobatis jamaicensis* (yellow stingray), a  member of Chondrichthyes, the earliest-diverging extant gnathostomes. For future works, be advised that there exists an assembled genome (~19X coverage) for the elephant shark, *Callorhinchus milii*, which could be used to guide the assembly of shark transcriptomes.

As an outgroup, we included RNA-seq data for the tunicate *Polycarpa mamillaris* (Stolidobranchia: Styelidae). An assembled 70X genome of the tunicate *Oikopleura vanhoeffeni* is also publicly available.


### Things I considered during selection of SRA accessions:

Many of the SRA hagfish and lamprey accessions correspond to evo-devo experiments, so I made sure to always select accessions from control specimens. For all hagfish and lamprey samples, I selected runs that used tissue from the heads of either adult or juvenile fishes (the *Urobatis jamaicensis* DNA was extracted from heart tissue), in order to avoid problems caused by what I will describe in the next paragraph.

### Things I should consider in the future when repeating with more accessions:
1.) During early embryogenesis, the lamprey genome undergoes dramatic programmed genome rearrangements (Smith *et al.* 2018; Smith *et al.* 2009). Specifically, somatic cell lineages lose hundreds of millions of base pairs (and one or more transcribed loci), resulting in somatic (blood) cells being 20% smaller than germline (sperm) cells (Smith *et. al* 2009). The lamprey genome is therefore highly dynamic. Following Casey's advice, I decided it was important to select accessions corresponding to DNA that had been extracted from adult somatic cells. Given this information though, in the future I will have to continue to be mindful of a.) the stage in development specimens were in when DNA was extracted b.) what type of cells the DNA was extracted from, and c.) how much does all of this matter (since this genome rearrangement was not found in germline cells, are there any potential phylogenetic/evolutionary consequences of this, in particular as they relate to methods for this study?). In particular, future genome-based assemblies should probably use the older Sanger-based somatic assemblies that are relatively fragmentary over the more recently published germline sea lamprey genome (Smith *et al.* 2013).

2.) The lamprey genome is known to have a high GC content, as well as to be highly repetitive and heterozygous. All of the transcriptome data I downloaded seems to indicate that hagfish genomes are nearly equally high in GC content.


## Methods

### Preparing the Data for the Pipeline

#### Transcriptomes

RNA sequences were uploaded to the Linux cluster from the NCBI Sequence Read Archive (SRA) in .sra format using the NCBI SRA Toolkit.

Note that after downloading the SRA Toolkit onto the cluster, it  is helpful to change the location of where you want the accessions sent upon uploading. The following command
```
./vbd-config -i
```
will open a window that will allow you to change the Workspace Location (use the tab key to move the cursor). It's easiest to just move to the Goto option and type in the path to the directory.

To retrieve the SRA accessions, type the following command for whatever SRR number you're trying to fetch: 

```
./prefetch SRR#######
```

To convert files from .sra to .fq format, I ran fastq-dump through the SRA toolkit (-O indicates an output directory; the default offset to use for ASCII scores is already set to 33, which is required for Agalma). Note that in retrospect, you could've run fastq-dump to begin with when uploading the files on to the server, but I didn't know better and therefore didn't actually do that here. Here's an example for how to dump the fastq file:

```
~/bin/sratoolkit.2.9.6-centos_linux64/bin/fastq-dump --defline-seq '@$sn[_$rn]/$ri' --split-3 ~/scratch60/agalma/data/sra_transcriptomes/SRR######.sra -O ~/scratch60/agalma/data/transcriptomes/
```

I automated this step with the fastq_dump.slurm file. The --split-3 option will output 1, 2, or 3 files. Since all your data here was paired, at least two files should have been outputted. If a third outputted file is produced (that never happened here), it consists of orphaned, unpaired reads after trimming. It is normal practice to just ignore this third file (unless you really need the extra reads). One accession in this study that was supposed to be paired resulted in only one fastq file after being processed through fastq-dump with the split option (the *Lampetra planeri* accession). This happened frequently as I looked for tunicate data to include as an outgroup. I believe it is a result of the sequencing instrument that was used. 

Just running fastq-dump as above still caused issues in Step 1 of Trinity for some of the reads.  The headers of four of the pairs of reads were followed by an underscore and "forward" or "reverse," depending on the strand. I corrected this with a perl command similar to the following (see perl_header.slurm script)

```

cat file_1.fastq | perl -lane 's/_forward//; print;' > file_1.adj.fastq

cat file_2.fastq | perl -lane 's/_reverse//; print;' > file_2.adj.fastq
````
and then used the .adj.fastq files as input into Trinity.


#### Genomes

I searched through the NCBI assembly tool to find assembled genomes (identifiable by their GCA numbers). On their right side, there should be an "Access the Data" header with the option to "Download the GenBank assembly". Click through there for all the assembly related files. The .fna.gz files should be zipped files in fasta format. Since I didn't have too many to download, the easiest/quickest way to get these assembly files on to Farnam is to just download the zipped file on to your computer, and transfer them over to Farnam. The files were unzipped with

```
gunzip filename.fna.gz
```

Since .fna files are in FASTA format, all I had to do to make them readable by Agalma was to rename the files (with the mv BASH command) to have a .fastq ending.


### The Agalma Pipeline

I used the Agalma pipelines (Dunn *et al.* 2013) to identify homologous sequences across the multiple species and to create nucleotide alignments for each set of homologus sequences. The Agalma repo can be found here: (https://bitbucket.org/caseywdunn/agalma/src/master/).

Once you've created a conda environment for Agalma, make sure you're always activating it with:

```
source activate agalma
```
and double check that you're actually in that conda environment with 

```
which conda
```

#### Registering Data in the BioLite Catalog

To keep track of things (different taxonomic names, etc) always look up the species codes at the [NCBI Taxonomy database](https://www.ncbi.nlm.nih.gov/taxonomy) and the [Integrated Taxonomic Information System database](https://www.itis.gov/). NCBI IDs and ITIS IDs must just be labelled with the number. Catalog these IDs with a command like this (-p or path directs Agalma to the file you're referring to):

```
agalma catalog insert -i SRR### -p ~/scratch60/agalma/data/transcriptomes/SRR###_1.fastq ~/scratch60/agalma/data/transcriptomes/SRR###_2.fastq -s "Species_name" -n NCBI_ID -d ITIS_ID
```

This can be automated with a script like the catalog.slurm script in this repo.

Adding the following entry in your .bash_profile will create a shortcut to retrieve the NCBI and ITIS ID numbers for a species in the format that Agalma expects (written by Steve Haddock; copied from Agalma Issue #233 on bitbucket):

```
getid(){
    echo "Use query format Genus+species"
        echo "Looking up NCBI (-n) and ITIS (-d) IDs for $1..."
    NCBI=$(curl -s https://www.ncbi.nlm.nih.gov/taxonomy/?term=$1 | grep 'ncbi_uid=' | sed -E 's/^.*ncbi_uid=([1-9]+)&.*/\1/')
    echo -n "-n $NCBI ";
    echo -n "-d " ; curl -s "https://www.itis.gov/ITISWebService/services/ITISService/searchByScientificName?srchKey=Physalia+physalis" | sed -E 's/.*:tsn>([0-9]+)<.*/\1/'
 }
 ```

You can always update these catalogs with the insert function. You just have to re-enter the field you want to change or add; everything else will stay the same.

Before generating the catalog, you specify a path for the local Agalma database with a command like 

````
export AGALMA_DB=$PWD/agalma.sqlite
````

but after generating, you can/should backup your this agalma.sqlite file somewhere else unless you want to regenerate it each time. IT IS VERY IMPORTANT TO BACKUP FREQUENTLY (given the amount of times I accidentally overwrote my database, consider backing up after completing each pipeline). You can/should load this previously generated database in the same way, but I've found you may need to run the command and/or activate the agalma environment a couple of times to get it to work.

To check on your entire agalma catalog and see that it all loaded properly, run:

```
agalma catalog all
```

If upon doing this you get an error saying "sqlite3.DatabaseError: database disk image is malformed," then this catalog has been corrupted. Hopefully you have a backup and it isn't the backup that's corrupted. If you don't however, rest easy that this happened to me first and I've already figured out how to fix the problem. First, run the following code through sqlite3 to double check that it's corrupted:

```
sqlite3 agalma.sqlite "PRAGMA integrity_check"
```
If it still gives you an error that the database disk image is malinformed, try cleaning the database up with

```
sqlite3 agalma.sqlite "reindex nodes"
sqlite3 agalma.sqlite "reindex pristine"
```
If that still doesn't work (it didn't in my case), run the following to dump the contents of the database into a backup file, and then slurp back into a new database file.

```
sqlite3 .agalma.sqlite

sqlite> .mode insert
sqlite> .output dump_all.sql
sqlite> .dump
sqlite> .exit

mv agalma.sqlite agalma_corrupt.sqlite
sqlite3 agalma.sqlite

sqlite> .read dump_all.sql
sqlite> .exit
```
Then try loading the whole catalog again to see if it works.

#### Quality Control 

You can generate a quality control report for each run with FastQC using the script in the repo, fastqc.slurm. This does not work on your genome assemblies. 

#### Running the Transcriptome Pipeline

If you ever want to remind yourself of the steps in the pipeline (or any Agalma pipeline), type:

```
agalma transcriptome -h
```
These pipeline runs take longer than you'd think, so it's better to submit jobs through a Linux cluster like Farnam. Jobs finish reasonably quickly when you request 1 node, 16-20 cores, and 4600 or 6000 mem-per-cpu. Also, do yourself a favor and use the scavenge partition, because it's painful to wait hours for the job to start to have it fail immediately. In writing the slurm files, it is really important to include the line of code that allocates how many threads / how much memory Biolite should use. Sections of the pipeline (especially Stage 11 where you assemble with Trinity, and Stage 19) are very computationally demanding, and the program will want to use more memory/threads than you have requested on Farnam unless you've specifically prevented it from doing so.

To run the pipeline for a single transcriptome, your job should contain a script that looks something like this:

````
source activate agalma
export BIOLITE_RESOURCES=threads=16,memory=91G
cd ~/scratch60/agalma/data/data
export AGALMA_DB=$PWD/agalma.sqlite
cd ~/scratch60/agalma/scratch
agalma transcriptome -i SRR###### -o path/to/output/directory
````

If/when the pipeline fails, you can always restart it. Keep everything in the script above the same, but adjust the last two lines to say something like

```
cd ~/scratch60/agalma/scratch/transcriptome-##
agalma transcriptome -i SRR#####3 --restart --stage N
```

where N is the stage that it failed at and transcriptome-## is the directory that files for this run were previously outputting in to. It is important to change the name of the output file in the BASH header to prevent it from overriding the output file of the first attempt.

#### Reporting

To generate reports for the transcriptome runs, use the slurm script report.slurm (or a similar script). This will run very quickly. The generated roports will have diagnostics for all transcriptome stages of the Agalma pipeline.

### Helpful Agalma Commands

As you run the various pipelines, you will frequently find that you want a list of all your runs so that you can keep track and specify which runs you actually want to use in your phylogenetic analyses. To access this list, run the command:
```
agalma diagnostics list
```

You can not eliminate entries from the Agalma catlog, but you can delete or hide previous runs from the diagnostics database so that you don't use them in downstream analyses. Your options can be seen at 

```
agalma diagnostics -h
```

### Inferring the Phylogeny

#### The Agalma Phylogeny Pipeline
Once all the transcriptome analyses are completed and saved in the database (make sure to back up the database here if you haven't!), you can run the phylogeny pipeline. First, you call the homologize pipeline to perform an all-by-all comparison of the genes in the loaded transcriptomes. You should set a name for the analysis ID (-i name) so that the results of each analysis in the phylogeny pipeline can just be passed to the next one (this ID should be unique for each phylogenetic analysis). See the script homo_final.slurm to run. 

The next two pipelines I ran were the multalign and genetree pipelines, which use the assemblies to align and build gene trees. Since I was not planning to actively use specific gene trees, to reduce the computing time of the genetree pipeline, I chose to run just 10 bootstrap replicates for each gene tree inference. The next pipeline, treeinform,  identifies splice variants (similar sets of sequences within species that are likely from the same gene) and updates the assemblies to assign these slice variants to the same genes. I then ran the homologize, multalign, and genetree pipelines again, before running treeprune, which finds subtrees that have no more than one sequence per taxon, and treats them as if they were orthologs. The multalign pipeline was run one last time to align this smaller set of sequences, before they were concatenated with the supermatrix pipeline. 

The pipelines in this overarching phylogeny pipeline, and their corresponding scripts (as found in the repo), are listed as follows: 

homologize 		homo\_final.slurm

multalign 		multalign\_final1.slurm

genetree 		genetreefinal1.slurm

treeinform		treeinform\_final.slurm

homologize		homo\_final2.slurm

multalign 		multalign\_final2.slurm

genetree 		genetree\_finalquick2.slurm

treeprune		treeprune\_final.slurm

multalign 		multalign\_final3.slurm

supermatrix		supermatrix\_final.slurm

speciestree 	speciestree\_final\_outgroup.slurm


The final pipeline in this Agalma protocol is the speciestree pipeline, which uses RAxML to infer a preliminary species tree. With this pipeline, I ran RAxML with 100 bootstrap replicates to infer the tree seen in the repo file RAxML\_bipartitions.alignment.fa (this is the name format you should expect Agalma to put out for your tree). I ran RAxML twice: once without specifying an outgroup, and once specifying the tunicate outgroup because I was unsure how that would affect the inference of a tree with so few tips/internodes. This change appeared to have no effect on the results.


#### IQ-TREE

I also inputted the alignment.fa file produced from the speciestree pipeline into IQTree (Nguyen *et al.* 2014) to see if the program/substitution model used would affect the resulting phylogeny. My IQ-TREE analysis incorporated ModelFinder to determine the substitution model that best fit the alignment, as well as IQ-TREE's ultrafast bootstrapping algorithm (1000 bootstrap replicates total). According to BIC and AIC, the best-fit model to this alignment is a Le Gascuel variant (LG+F+R3). The script used to run IQ-TREE can be found in the repo at iqtree\_run.slurm. 


## Results

Both the RAxML and IQ-Tree analyses support the sister relationship of Petromyzontiformes and Myxiniformes, as related to gnathostomes and invertebrates (see figure below). These results expel the Craniata hypothesis which suggested that lampreys are the sister group to Gnathostomata, and reaffirm the sister relationship between all extant agnathans (Cyclostomata) and all gnathostomes.


![Phylogeny inferred using IQ-Tree's ultrafast bootstrapping algorithm (1000 bootstrap replicates), which is identical in topology and support values to the tree inferred using RAxML (100 bootstrap replicates).](/./results/vertebrate\_phylogeny\_prelim.png)

## Assessment

Simply put, I was not successful in achieving my initial goal, as I first aimed to incorporate significantly more data/species in the analysis. I felt I had to scrap the idea of doing the full analysis for the sake of saving computing time/resources. I do feel like I accomplished my ultimate goal though, which was to use this projecting as an excuse to learn how to assemble and edit full transcriptomes, and how to use them to build an alignment that I can then use to infer a phylogeny. 

In general, there is a lot I would have done differently in approaching this project. Since every aspect of this project (beyond using the Linux cluster and running IQ-TREE/RAxML) was new to me, getting through every step took me longer than it should have. Even the first step  of figuring out which accession numbers (e.g. the PRJ, SRX, or SRR numbers) I should download from the SRA database, and how to accomplish that, was more challenging for me than I expected it to be. I also had multiple difficulties with the Agalma pipeline (most signficantly, more than once I accidentally overwrote the agalma.sqlite database before I had backed it up). Now that I am actually familiar with the pipeline and have written all my scripts/notes on it, I am embarrassed by how much I struggled with it, as Agalma is fairly straight-forward. However, I think I could have evaded a lot of headache and ended up with a more satisfactory project, had I simply submitted more pull requests for help. 

I am not totally sure if this question is all that interesting to keep pursuing, given that my preliminary analysis is in agreement with the most recent molecular phylogenetic analyses incorporating lampreys and hagfishes (Miyashita *et al.* 2019, Delsuc *et al.* 2018). That said, the only published analysis using transcriptome data to infer this phylogeny included even fewer species/runs than I did (Delsuc *et al.* 2018), so a more complete analysis may still necessary before feeling confident in the legitimacy of molecular data inferring cyclostome monophyly. 

If I continue to work on this question though, I think it will be really important to use a program that allows for genome-guided assembly rather than Agalma. At first I thought this would possible with Agalma/Trinity based on what a classmate had mentioned to me, but I saw no sign of how to complete this in the documentation, so I think I was mistaken. I think it was a useful exercise to learn how to assemble transcriptomes de novo, as that is likely what I would have to do if/when I work with RNA-seq data in the future. However, given that there was an assembled *Eptatretus burgeri* genome available with great coverage, as well as a rudimentary lamprey genome, it would be silly not to use them in the assembly and tree inference processes in the future.

## References

Delsuc, F., Philippe, H., Tsagkogeorga, G., Simion, P., Tilak, M. K., Turon, X., ... & Douzery, E. J. (2018). A phylogenomic framework and timescale for comparative studies of tunicates. BMC biology, 16(1), 39.

Dunn CW, Howison M, Zapata F. (2013). Agalma: an automated phylogenomics workflow. BMC Bioinformatics 14(1): 330. doi:10.1186/1471-2105-14-330

Kuraku, S. (2008). Insights into cyclostome phylogenomics: pre-2R or post-2R. Zoological science, 25(10), 960-969.

Kuraku, S. (2010). Palaeophylogenomics of the vertebrate ancestor—impact of hidden paralogy on hagfish and lamprey gene phylogeny.

Heimberg, A. M., Cowper-Sal, R., Sémon, M., Donoghue, P. C., & Peterson, K. J. (2010). microRNAs reveal the interrelationships of hagfish, lampreys, and gnathostomes and the nature of the ancestral vertebrate. Proceedings of the National Academy of Sciences, 107(45), 19379-19383.

Løvtrup, S. (1977). The Phylogeny of Vertebrata. Wiley, London.

McCauley, D. W., Docker, M. F., Whyard, S., & Li, W. (2015). Lampreys as diverse model organisms in the genomics era. BioScience, 65(11), 1046-1056.

Miyashita, T., Coates, M. I., Farrar, R., Larson, P., Manning, P. L., Wogelius, R. A., ... & Currie, P. J. (2019). Hagfish from the Cretaceous Tethys Sea and a reconciliation of the morphological–molecular conflict in early vertebrate phylogeny. Proceedings of the National Academy of Sciences, 116(6), 2146-2151.

Near, T. J. (2009). Conflict and resolution between phylogenies inferred from molecular and phenotypic data sets for hagfish, lampreys, and gnathostomes. Journal of Experimental Zoology Part B: Molecular and Developmental Evolution, 312(7), 749-761.

Nguyen, L. T., Schmidt, H. A., von Haeseler, A., & Minh, B. Q. (2014). IQ-TREE: a fast and effective stochastic algorithm for estimating maximum-likelihood phylogenies. Molecular biology and evolution, 32(1), 268-274.

Ota, K. G., & Kuratani, S. (2007). Cyclostome embryology and early evolutionary history of vertebrates. Integrative and Comparative Biology, 47(3), 329-337.

Smith, J. J., Antonacci, F., Eichler, E. E., & Amemiya, C. T. (2009). Programmed loss of millions of base pairs from a vertebrate genome. Proceedings of the National Academy of Sciences, 106(27), 11212-11217.

Smith, J. J., Kuraku, S., Holt, C., Sauka-Spengler, T., Jiang, N., Campbell, M. S., ... & Morgan, J. R. (2013). Sequencing of the sea lamprey (Petromyzon marinus) genome provides insights into vertebrate evolution. Nature genetics, 45(4), 415.

Smith, J. J., Timoshevskaya, N., Ye, C., Holt, C., Keinath, M. C., Parker, H. J., ... & Kaessmann, H. (2018). The sea lamprey germline genome provides insights into programmed genome rearrangement and vertebrate evolution. Nature genetics, 50(2), 270.

Suzuki, T., Ota, T., Fujiyama, A., & Kasahara, M. (2004). Construction of a bacterial artificial chromosome library from the inshore hagfish, Eptatretus burgeri: a resource for the analysis of the agnathan genome. Genes & genetic systems, 79(4), 251-253.
