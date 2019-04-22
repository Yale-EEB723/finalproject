# Notes to Refer to in the Future if Running a Similar Project

## SRA Toolkit/Downloading Data Tips

### Transcriptomes

Ultimately, for the transcriptomes, what you want to download is an SRR number (not the SRP, SRX, etc).

After downloading the SRA Toolkit onto your Linux cluster, change the location of where you want the accessions sent upon downloading with the following command:
```
./vbd-config -i
```

A window will open that will allow you to change the Workspace Location (use the tab key to move the cursor). It's easiest to just move to the Goto option and type in the path to the directory.

To get SRA accessions for transcriptomes onto Farnam, type the following command for whatever SRR number you're trying to fetch:

```
.\prefetch SRR#######
```

In retrospect, you could've run fastq-dump to begin with, but I didn't know better and therefore didn't do that here. To convert files from .sra to .fq format, I ran fastq-dump through the SRA toolkit (-O indicates an output directory; the default offset to use for ASCII scores is already set to 33, which is required for Agalma):

```
~/bin/sratoolkit.2.9.6-centos_linux64/bin/fastq-dump --split-3 ~/scratch60/agalma/data/sra_transcriptomes/SRR######.sra -O ~/scratch60/agalma/data/transcriptomes/
```
The --split-3 option will output 1, 2, or 3 files. Since all your data here was paired, at least two files were outputted. If a third outputted file is produced, it consists of orphaned, unpaired reads after trimming. It's normal to just ignore it (unless you really need the extra reads).

### Genomes
Search through the NCBI assembly tool to find assembled genomes (identifiable by their GCA numbers). On their right side, there should be an "Access the Data" header with the option to "Download the GenBank assembly". Click through there for all the assembly related files. The .fna.gz files should be zipped files in fasta format. Since we didn't have too many to download, the easiest/quickest way to get these assembly files on to Farnam is to just download the zipped file on to your computer, and transfer them over to Farnam. Unzip the files with

```
gunzip filename.fna.gz
```

## Registering Data in the BioLite Catalog
To keep track of things (different taxonomic names, etc) always look up the species codes at the [NCBI Taxonomy database](https://www.ncbi.nlm.nih.gov/taxonomy) and the [Integrated Taxonomic Information System database](https://www.itis.gov/). NCBI IDs and ITIS IDs must just be labelled with the number. Catalog these IDs with a command like this (within your directory with the data, as the -p or path command lets agalma know which file you're referring to). You can catalog multiple SRR#s for the same species at the same time just specify both paths:

```
agalma catalog insert -i SRR# or GCA# -p SRR###.sra -s "Species_name" -n NCBI_ID -d ITIS_ID
```
To check on your entire agalma catalog, run:

```
agalma catalog all
```
You can always update these catalogs with the insert function. You just have to re-enter the field you want to change or add; everything else will stay the same.

## Random
Always remember to activate Biolite, as Agalma is built on top of it. Better to install Biolite into its own conda environment because otherwise you have to downgrade some software

```
conda create -n biolite biolite

source activate biolite
```

Also remember to source activate agalma itself before starting anything.

If you ever want to remind yourself of the steps in the pipeline, type:

```
agalma transcriptome -h
```
If you're running on an interactive node on Farnam, there's no need to specify the number of threads/memory you want to allocate to agalma. It's already default set to 20 threads and 200G of max memory.
