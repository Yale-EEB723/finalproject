
# _Portulaca amilis_ genome project

## 1. Quality control
### a. QUAST
This is useful for comparing new assemblies to old assemblies and looking for improvements. For v0 of the genome we will run without a comparison.

QUAST's webserver doesn't take files larger than 100Mb and ours is 124Mb, so it was installed with `conda install -c bioconda quast` and run on the cluster.

QUAST isn't recognizing matplotlib and saying that the license is expired for genemarker-es. Here are the current quast_lib locations

* ~/.linuxbrew/lib/python2.7/site-packages/quast-5.0.2-py2.7.egg/quast_libs
* ~/anaconda2/pkgs/quast-5.0.2-py27pl526ha92aebf_0/opt/quast-5.0.2/quast_libs
* ~/anaconda2/pkgs/quast-5.0.2-py27pl526ha92aebf_0/lib/python2.7/site-packages/quast_libs
* ~/anaconda2/opt/quast-5.0.2/quast_libs
* ~/anaconda2/lib/python2.7/site-packages/quast_libs

Note from developers:

Note 2: the fail of gene prediction module is not a critical error, so it is reported as a "non-fatal error" in the log and does not cause a crash of the entire pipeline. I suppose that the local GeneMark license file provided in the Quast package may be out of date already and that caused the crash of the MetaGeneMark prediction tool. You can update either solely the license file (~/.gm_key -- you can obtain the new file at http://exon.gatech.edu/GeneMark/license_download.cgi after filling the license form; download the gzipped archive, unpack it and move to your ~/.gm_key file) or by updating Quast to the latest version (includes a new license file).

quast was run with: `/ysm-gpfs/home/isg4/anaconda2/bin/quast ../portulaca_26Nov2018_oK3Ko.fasta.gz -o . --split-scaffolds --eukaryote --k-mer-stats --circos --gene-finding` but the gene finding and circos plot didn't work because of the issues above.

### b. gVolante: Completeness Assessment of Genome/Transcriptome Sequences
This also has a webserver. [Here](https://gvolante.riken.jp/script/result.cgi?201812080128-U9FRY4TQPVFK2FAK) is the link to our analysis using BUSCO v2/v3 (JOB ID: 201812080128-U9FRY4TQPVFK2FAK).

### c. MUMmer
A system for rapidly aligning large DNA sequences to one another. Has a useful function called MUMerplot which allows visualization of our genome in relation to another to detect transocations and inversions. Minimap2 can produce similar plots.

Installed with `conda install -c bioconda mummer`

## 2. Repeat masking
### a. RepeatMasker
Installed with `conda install -c bioconda repeatmasker`

### b. RepeatModeler
* Required modules
Installed with `conda install -c bioconda repeatmodeler`

### c. RedMask

https://github.com/nextgenusfs/redmask


## 3. Transcriptome analysis
Annotation requires a transcriptome, which I snagged from 1kp (reference ID: [ERR2040261](https://www.ncbi.nlm.nih.gov/sra/ERR2040261)) with
```bash
$ fastq-dump.2.8.2 --defline-seq '@$sn[_$rn]/$ri' --split-files ERR2040261
```
The `--defline-seq` flag is needed to reformat the headers of the forward and reverse files so that downstream programs recognize them.

I will be following [Ya Yang's pipeline](https://bitbucket.org/yangya/phylogenomic_dataset_construction).

#### 3.0 Mapping reads to genome
Ben wrote a [`HISAT2`](https://ccb.jhu.edu/software/hisat2/manual.shtml#what-is-hisat2) command for mapping raw reads then piping the output to `samtools` for sorting and indexing. This will yield and overall alignment rate and a `.bam` file that we can spot check in a genome browser like `IGV`. Here is a sample command from Zack:

```bash
$ module load HISAT2 SAMtools
$ HISAT2_INDEXES=/gpfs/ysm/scratch60/be59/physalia/ref
$ hisat2 -p 8 --rg-id "CMN139" --rg "LB:CMN139" --rg "PU:ILLUMINA" --rg 'SM:CMN139_Gastrozooid_mature' --summary-file CMN139_alnstats.txt --new-summary -x physalia.contigs -U ../seq/CMN139_ACAGTG.R1.fastq | samtools view -bhuS - | samtools sort - -m 2G -o CMN139.bam
$ samtools index CMN139.bam
```

There are a bunch of flags here, I won't need all of them
* `-p 8` : **number of threads**
* `--rg-id "CMN139"` : Set the read group ID to "CMN139". This causes the SAM @RG header line to be printed, with "CMN139" as the value associated with the ID: tag. It also causes the RG:Z: extra field to be attached to each SAM output record, with value set to "CMN139".
* `--rg "LB:CMN139"` : Add "LB:CMN139" (usually of the form TAG:VAL, e.g. SM:Pool1) as a field on the @RG header line. Note: in order for the @RG line to appear, `--rg-id` must also be specified. This is because the ID tag is required by the SAM Spec. Specify `--rg` multiple times to set multiple fields. See the SAM Spec for details about what fields are legal
  * "LB" = library. See [SAMtools tags in manual](https://samtools.github.io/hts-specs/SAMv1.pdf) for help
* `--rg "PU:ILLUMINA"` : "PU" = Platform unit
* `--rg 'SM:CMN139_Gastrozooid_mature'` : "SM" = sample
* `--summary-file CMN139_alnstats.txt` : **human friendly alignment summary file**
* `--new-summary` : **machine friendly alignment summary**
* `-x physalia.contigs` : **reference genome**
* `-U ../seq/CMN139_ACAGTG.R1.fastq` : **file containing unpaired reads to be aligned**

There are also some other flags that might be useful:
* `--sra-acc` : SRA accession number
* `-S` : File to write SAM alignments to
* `-q` : reads are fastq files
* `--met-file` : Write hisat2 metrics to file

First, I created the HISAT2 index for my genome and set the `HISAT2_INDEXES` path variable:

```bash
$ hisat2-build ../portulaca_26Nov2018_oK3Ko.fasta P_amilis
$ HISAT2_INDEXES=/gpfs/ysm/scratch60/
```
I have paired-end reads for the transcriptome, so I have 2 files after `-U`

The final command is
```bash
#!/bin/bash
#SBATCH --job-name=hisat2samtools
#SBATCH -c 8
#SBATCH --mem=36G
#SBATCH -t 120:00:00
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=ian.gilman@yale.edu
#SBATCH -o hisat2samtools.%A-%a.out
#SBATCH -e hisat2samtools.%A-%a.err

HISAT2_INDEXES=/home/isg4/scratch60/P_amilis_genome/hisat2-index

hisat2 -p 8 --rg-id "ERR2040261" --rg "LB:ERR2040261" --rg "PU:ILLUMINA" --rg "SM:ERR2040261_leaf_mature" --summary-file /home/isg4/scratch60/P_amilis_genome/1kp_transcriptome/ERR2040261-alnstats.txt --new-summary -x /home/isg4/scratch60/P_amilis_genome/hisat2-index/P_amilis -U ERR2040261_R1_.fastq,ERR2040261_R2_.fastq | samtools view -bhuS - | samtools sort - -m 2G -o ERR2040261.bam
samtools index ERR2040261.bam
```


#### 3.1 *De novo* assembly with Trinity


## 4. Annotation
I've found that patching together all of the genomics tools can mess with my standard conda environment. To separate my genome analysis tools from my general conda packages I created a new environment called `genome`.

```bash
[isg4@farnam2 ~]$ conda create --name genome
```
I'll be following [Daren Card's MAKER annotation pipeline](https://gist.github.com/darencard/bb1001ac1532dd4225b030cf0cd61ce2). Here are the software prerequisites with the versions he used with my notes on installation:

* [RepeatModeler](http://www.repeatmasker.org/RepeatModeler/)
  * Install: `conda install -c bioconda repeatmodeler`
  * Version:
* [RepeatMasker](http://www.repeatmasker.org/RMDownload.html) with all dependencies
  * Install: `conda install -c bioconda repeatmasker`
  * Version:
* [RepBase](http://www.girinst.org/repbase/) (Card version: 20150807).
  * Install:
  * Version:
* MAKER MPI (Card version: 2.31.8)
  * Install:
  * Version:
* [Augustus](http://bioinf.uni-greifswald.de/augustus/) Card version: 3.2.3)
  * Install:
  * Version:
* [BUSCO](http://busco.ezlab.org/) (Card version: 2.0.1)
  * Install:
  * Version:
* [SNAP](http://korflab.ucdavis.edu/software.html) (Card version: 2006-07-28)
  * Install:
  * Version:
* [BEDtools](https://bedtools.readthedocs.io/en/latest/) (Card version: 2.17.0)
  * Install:
  * Version:

### Maker
After previous manual installation headaches, `conda install -c bioconda maker` did the trick.
