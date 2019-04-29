# Final Project

## Introduction

This is a final project for the [Comparative Genomics](https://github.com/Yale-EEB723/syllabus) seminar in the spring of 2019. This project used RNA-seq data published on SRA to test the monophyly of Cyclostomata, the living jawless fishes.



## The goal

Molecular evidence supporting Cyclostoma has thus far been limited to a few mitochondrial genes. The goal of this preliminary study is to use transcriptome data to infer a tree that will test the phylogenetic relationships between hagfishes (Myxiniformes), lampreys (Petromyzontiformes), and jawed vertebrates (Gnathostomes).

## The data

Paired-end sequences are accessible on SRA for the following lamprey species: Petromyzon marinus (Petromyzontidae: Petromyzontinae), Lethenteron camtschaticum (Petromyzontidae: Lampetrinae), Mordacia mordax (Mordaciidae), and Geotria australis (Geotriidae).

The SRA has published transcriptome data for Lampetra planeri (Petromyzontidae: Lampetrinae) but although the library is listed as paired on the database, processing the downloaded data using fastq-dump resulted in only one sequence, which indicated to me that it was unpaired. This data was included in the study anyway, as it is the only representative of that genus. An assembled WGS for Petromyzon marinus (~6X coverage) was also included in this study. 

We also included in this study paired transcriptome data for two hagfish species: Eptatretus burgeri and Eptatretus cirrhatus. An assembled genome (210X) for Eptatretus burgeri was also available and incorporated. 

To represent Vertebrata, we included transcriptome data for the following two members of Chondrichthyes, the earliest-diverging extant gnathostomes: Carcharodon carcharias (great white shark) and Urobatis jamaicensis (yellow stingray). An assembled genome (~19X coverage) for the elephant shark, Callorhinchus milii, was also included.

The 70X genome of the tunicate Oikopleura vanhoeffeni was included in all phylogenetic analyses as an outgroup. 

Please refer to the Final_samplelist.xlsx file in the repo for further information on the data used in this study. 


### Things to consider:
1.) During early embryogenesis, the lamprey genome undergoes dramatic programmed genome rearrangements (Smith et al. 2018; Smith et al. 2009). Specifically, somatic cell lineages lose hundreds of millions of base pairs (and one ore more transcribed loci), resulting in somatic (blood) cells being 20% smaller than germline (sperm) cells (Smith et. al 2009). The lamprey genome is therefore highly dynamic. I'll have to think more about a.) at what stage in development were the samples from which the DNA was extracted b.) what type of cells were the DNA extracted from, and c.) does it even matter (i.e. since this effect wasn't found in germline cells, are there any potential phylogenetic/evolutionary consequences of this, in particular as they relate to methods for this study). As a result of all of this, I should just use the more recently published germline sea lamprey genome as a reference, and ignore the previous Sanger-based somatic assembly, which was relatively fragmentary anyway (Smith et al. 2013)

2.) The lamprey genome is known to have a high GC content, as well as to be highly repetitive and heterozygous.


## Background



Motivation for the project....

How it fits in with other work...

What the reader needs to know to understand the project


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

I automated this step with the fastq_dump.slurm file. The --split-3 option will output 1, 2, or 3 files. Since all your data here was paired, at least two files should have been outputted. If a third outputted file is produced, it consists of orphaned, unpaired reads after trimming. It's normal to just ignore it (unless you really need the extra reads). One accession in this study that was supposed to be paired resulted in only one fastq file after being processed through fastq-dump with the split option (the Lampetra planeri sequence). I'm not really sure what was going on there but the single-read sequence was included in the study regardless.

Just doing this alone still caused issues in Step 1 of trinity for some of the reads.  The headers of four of the pairs of fastq files were followed by an underscore and "forward" or "reverse" depending on the strand. I corrected this with a perl command similar to the following (see perl_header.slurm script)

```

cat file_1.fastq | perl -lane 's/_forward//; print;' > file_1.adj.fastq

cat file_2.fastq | perl -lane 's/_reverse//; print;' > file_2.adj.fastq
````
and then used the .adj.fastq files as input to Trinity.


#### Genomes

I searched through the NCBI assembly tool to find assembled genomes (identifiable by their GCA numbers). On their right side, there should be an "Access the Data" header with the option to "Download the GenBank assembly". Click through there for all the assembly related files. The .fna.gz files should be zipped files in fasta format. Since I didn't have too many to download, the easiest/quickest way to get these assembly files on to Farnam is to just download the zipped file on to your computer, and transfer them over to Farnam. The files were unzipped with

```
gunzip filename.fna.gz
```

Since .fna files are in FASTA format, all I had to do to make them readable by Agalma was to rename the files (with the mv BASH command) to have a .fastq ending.


### The Agalma Pipeline

I used the Agalma pipelines (Dunn et al. 2013) to identify homologous sequences across the multiple species and to create nucleotide alignments for each set of homologus sequence.

The Agalma repo can be found here: (https://bitbucket.org/caseywdunn/agalma/src/master/).

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

but after generating, you can/should backup your this agalma.sqlite file somewhere else unless you want to regenerate it each time. You can load this previously generated database in the same way (but I've found you may need to run the command and activate the agalma environment a couple of times to get it to work).

To check on your entire agalma catalog and see that it all loaded properly, run:

```
agalma catalog all
```

If upon doing this you get an error saying "sqlite3.DatabaseError: database disk image is malformed," then this catalog has been corrupted. Hopefully you have a backup and it isn't the backup that's corrupted. If you don't however, run the following code through sqlite3 to double check that it's corrupted:

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

You can generate a quality control report for each run with FastQC using the script in the repo, fastqc.slurm. This does not work on your genome assemblies, of course. 

#### Running the Transcriptome Pipeline

If you ever want to remind yourself of the steps in the pipeline, type:

```
agalma transcriptome -h
```
These pipeline runs take longer than you'd think, so it's better to submit jobs through Farnam. So far it seems that requesting 1 node, 16 cpu, and 4600 or 6000 mem-per-cpu is successful. Also, do yourself a favor and use the scavenge partition, because it's painful to wait hours for the job to start to have it fail immediately. It's really important not to leave out the line of code that allocates how many threads / how much memory Biolite should use. Sections of the pipeline (especially Stage 11 where you assemble with Trinity, and Stage 19) are very computationally demanding, and the program will want to use more memory/threads than you have requested on Farnam unless you've specifically prevented it from doing so.

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

where N is the stage that it failed at and transcriptome-## is the directory that files for this run were previously outputting in to. It's also important to change the name of the output file in the BASH header to prevent it from overriding the output file of the first attempt.

#### Reporting

To generate reports for the transcriptome runs, use the slurm script report.slurm (or a similar script). This will run very quickly. The generated roports will have diagnostics for all transcriptome stages of the Agalma pipeline.


### Inferring the Phylogeny


### Helpful Agalma Commands

To get a list of all your runs (so that you can keep track and specify which ones you actually want to use in your phylogeny analyses), use the command:
```
agalma diagnostics list
```

You can't eliminate entries from the Agalma catlog, but you can delete or hide previous runs from the diagnostics database so that you don't use them in downstream analyses. Your options can be seen at 

```
agalma diagnostics -h
```

## Results


## Assessment

Was it successful in achieving the initial goal?

What are the main obstacles encountered?

What would you have done differently?

What are future directions this could go in?

## References

Bardack, D. (1991). First fossil hagfish (Myxinoidea): a record from the Pennsylvanian of Illinois. Science, 254(5032), 701-703.

Delsuc, F., Philippe, H., Tsagkogeorga, G., Simion, P., Tilak, M. K., Turon, X., ... & Douzery, E. J. (2018). A phylogenomic framework and timescale for comparative studies of tunicates. BMC biology, 16(1), 39.

Dunn CW, Howison M, Zapata F. (2013). Agalma: an automated phylogenomics workflow. BMC Bioinformatics 14(1): 330. doi:10.1186/1471-2105-14-330

Kuraku, S. (2008). Insights into cyclostome phylogenomics: pre-2R or post-2R. Zoological science, 25(10), 960-969.

Kuraku, S. (2010). Palaeophylogenomics of the vertebrate ancestor—impact of hidden paralogy on hagfish and lamprey gene phylogeny.

McCauley, D. W., Docker, M. F., Whyard, S., & Li, W. (2015). Lampreys as diverse model organisms in the genomics era. BioScience, 65(11), 1046-1056.

Mele, C. (2017, July 14). Chain-Reaction Crash With Minor Injuries, Except for the Slime Eels. The New York Times. https://www.nytimes.com/2017/07/14/us/slime-eels-oregon.html

Miyashita, T., Coates, M. I., Farrar, R., Larson, P., Manning, P. L., Wogelius, R. A., ... & Currie, P. J. (2019). Hagfish from the Cretaceous Tethys Sea and a reconciliation of the morphological–molecular conflict in early vertebrate phylogeny. Proceedings of the National Academy of Sciences, 116(6), 2146-2151.

Smith, J. J., Antonacci, F., Eichler, E. E., & Amemiya, C. T. (2009). Programmed loss of millions of base pairs from a vertebrate genome. Proceedings of the National Academy of Sciences, 106(27), 11212-11217.

Smith, J. J., Kuraku, S., Holt, C., Sauka-Spengler, T., Jiang, N., Campbell, M. S., ... & Morgan, J. R. (2013). Sequencing of the sea lamprey (Petromyzon marinus) genome provides insights into vertebrate evolution. Nature genetics, 45(4), 415.

Smith, J. J., Timoshevskaya, N., Ye, C., Holt, C., Keinath, M. C., Parker, H. J., ... & Kaessmann, H. (2018). The sea lamprey germline genome provides insights into programmed genome rearrangement and vertebrate evolution. Nature genetics, 50(2), 270.

Suzuki, T., Ota, T., Fujiyama, A., & Kasahara, M. (2004). Construction of a bacterial artificial chromosome library from the inshore hagfish, Eptatretus burgeri: a resource for the analysis of the agnathan genome. Genes & genetic systems, 79(4), 251-253.
