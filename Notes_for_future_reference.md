# SRA Toolkit/Downloading Data Tips

##Transcriptomes

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

##Genomes
Search through the NCBI assembly tool to find assembled genomes (identifiable by their GCA numbers). On their right side, there should be an "Access the Data" header with the option to "Download the GenBank assembly". Click through there for all the assembly related files. The .fna.gz files should be zipped files in fasta format. Since we didn't have too many to download, the easiest/quickest way to get these assembly files on to Farnam is to just download the zipped file on to your computer, and transfer them over to Farnam. Unzip the files with

```
gunzip filename.fna.gz
```

##Registering Data in the BioLite Catalog
To keep track of things (different taxonomic names, etc) always look up the species codes at the [NCBI Taxonomy database](https://www.ncbi.nlm.nih.gov/taxonomy) and the [Integrated Taxonomic Information System database](https://www.itis.gov/). NCBI IDs are technically labelled with the format NCBI:txid### and ITIS IDs are labelled as TSN ####. Catalog these IDs with a command like this:

```
agalma catalog insert -i SRR# or GCA# -s Species_name -n NCBI_ID -d ITIS_ID
```

If you ever want to remind yourself of the steps in the pipeline, type:

```
agalma transcriptome -h
```
