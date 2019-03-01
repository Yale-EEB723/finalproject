
# _Portulaca amilis_ genome project

I've found that patching together all of the genomics tools can mess with my standard conda environment. To separate my genome analysis tools from my general conda packages I created a new environment called `genome`.

```bash
[isg4@farnam2 ~]$ conda create --name genome
[isg4@farnam2 ~]$ source activate genome
```
## 0. Quality control
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

## 1. Transcriptome analysis
For functional annotation of the
Annotation requires a transcriptome, which I snagged from 1kp (reference ID: [ERR2040261](https://www.ncbi.nlm.nih.gov/sra/ERR2040261)) with
```bash
$ fastq-dump.2.8.2 --defline-seq '@$sn[_$rn]/$ri' --split-files ERR2040261
```
The `--defline-seq` flag is needed to reformat the headers of the forward and reverse files so that downstream programs recognize them.

I will be following [Ya Yang's pipeline](https://bitbucket.org/yanglab/phylogenomic_dataset_construction/), which can be accessed with `git`.
```bash
[isg4@c14n07 apps]$ git clone https://bitbucket.org/yanglab/phylogenomic_dataset_construction.git
```

### Software prerequisites
- [Rcorrector](https://github.com/mourisl/Rcorrector)
  - Install: `git clone https://github.com/mourisl/Rcorrector.git`
  - Version:
- [Trimmomatic](http://www.usadellab.org/cms/?page=trimmomatic)
  - Install: previously installed
  - Version: 0.038
- Bowtie2 Version
  - Install:
  - Version: 2.3.4.3
- FastQC Version
  - Install: `conda install -c bioconda fastqc`
  - Version:
- Trinity
  - Install: previously installed
  -Version:
  - Notes
    - From Ya Yang: "newer versions [than 2.5.1] may have a conflict with version of Salmon"
- [Transrate](http://hibberdlab.com/transrate/)
  - Install:
  - Version 1.0.3
  - Notes
    - From Ya Yang: "Problems have been reported with some libraries of Salmon 0.6.2, please check that Salmon works properly. If you have problems with Salmon 0.6.0 you can install - Transrate from here, this will work with Salmon 0.8.2, which needs to be in the path as salmon"
- Corset
- Salmon Version v.0.9.1 (This is used for Corset and have not been tested with newer versions). You need to name this version salmon-0.9.1.
- TransDecoder Version 5.3.0 (older or newer versions probably will affect when shortening the names of translated transcripts)
- BLAST
  - Install: `conda install -c bioconda blast`
- cd-hit
  - Install: `conda install -c bioconda cd-hit`
  - Version: 4.8.1
- MCL
  - Install: `conda install -c bioconda mcl`
  - Version: 14.137
- TreeShrink
  - Install: `conda install -c smirarab treeshrink`
  - Version: 1.3.1
- RAxML
  - Install:
  - Version 8.2.11
- Phyx
  - Install:
  - Version:
- mafft Version
  - Install:
  - Version: 7.307 (newer versions should work)
- Gblocks
  - Install:
  - Version: 0.91b
- FastTree
  - Install:
  - Version: 2.1.10 (newer versions should work)
- Pasta
  - Install:
  - Version v1.8.2 (newer versions should work)
- Prank
  - Install:
  - Version v.170427

#### 1.1 Mapping reads to genome
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


#### 1.2 *De novo* assembly with Trinity


## 2. Annotation
I'll be following [Daren Card's MAKER annotation pipeline](https://gist.github.com/darencard/bb1001ac1532dd4225b030cf0cd61ce2) and the [MAKER Tutorial for WGS Assembly and Annotation](http://weatherby.genetics.utah.edu/MAKER/wiki/index.php/MAKER_Tutorial_for_WGS_Assembly_and_Annotation_Winter_School_2018#About_MAKER). Here are the software prerequisites with the versions he used with my notes on installation.

### Software prerequisites
* [MAKER](http://www.yandell-lab.org/software/maker.html)
  * Install: `conda install -c bioconda maker`
  * Version: 2.31.10
  * Build: pl526_11
  * **Note**: `maker -h` behaves as expected but throws the following message "Possible precedence issue with control flow operator at `/gpfs/ysm/home/isg4/anaconda2/lib/site_perl/5.26.2/Bio/DB/IndexedBase.pm` line 845."
* [RepeatModeler](http://www.repeatmasker.org/RepeatModeler/) | [GitHub](https://github.com/rmhubley/RepeatModeler)
  * Cloned from GitHub
  * Version: 1.0.11
  * Prerequisites
    * [RepeatMasker](http://www.repeatmasker.org/RMDownload.html) | [GitHub](https://github.com/rmhubley/RepeatMasker)
      * Prerequisites
        * [RepBase](http://www.girinst.org/repbase/)
          * Download:`RepBaseRepeatMaskerEdition-20181026.tar.gz`
          * Version: `RepBaseRepeatMaskerEdition-20181026.tar.gz`
        * [Dfam](http://www.dfam.org) **Unfortunately the Dfam database only contains data from human, mouse, zebrafish, fruit fly, and nematode.**
          * Download: `Dfam.hmm.gz`
          * Version: 23-Sep-2015 05:23
        * [Tandem Repeats Finder](http://tandem.bu.edu/trf/trf.html)
          * Install: `conda install -c bioconda trf`
          * Version: 4.09
          * Build: Linux 64-bit
      * RepeatMasker was installed with a the following repeat libraries:
        * Dfam database version: Dfam_2.0
        * RepeatMasker Combined Database: Dfam_Consensus-20181026, RepBase-20181026
      * RepeatMasker default search engine: RMBlast
      * Bash alias was created so that `RepeatMasker` can be called with `repeatmasker`
    * RECON (available at [RepeatModeler](http://www.repeatmasker.org/RepeatModeler/))
      * Version: 1.08-4 (The Cosmic Cuttlefish)
    * RepeatScout (available at [RepeatModeler](http://www.repeatmasker.org/RepeatModeler/))
      * Version: 1.0.5
  * Bash alias was created so that `RepeatModeler` can be called with `repeatmodeler`
  * RepeatModeler default search engine: RMBlast
* [Augustus](http://bioinf.uni-greifswald.de/augustus/) Card version: 3.2.3)
  * Install: `conda install -c bioconda augustus`
  * Version: 3.3
  * Build: pl526hcfae127_4
* [BUSCO](http://busco.ezlab.org/) (Card version: 2.0.1)
  * Install: `conda install -c bioconda busco`
  * Version: 3.0.2        
  * Build: py27_8
* [SNAP](http://korflab.ucdavis.edu/software.html) (Card version: 2006-07-28)
  * Install: `conda install -c bioconda snap`
  * Version: 2013_11_29
  * Build: h470a237_1
* [BEDtools](https://bedtools.readthedocs.io/en/latest/) (Card version: 2.17.0)
  * Install: `conda install -c bioconda bedtools`
  * Version: 2013_11_29
  * Build: h470a237_1

## Methods

### Repeat library construction with RepeatModeler
The first step in _de novo_ genome annotation is building a species specific repeat library for masking purposes. This is done in the MAKER pipeline with RepeatModeler. RepeatModeler collects sequences based on a threshold copy number and then classifies them based on similarity to known transposable elements (TEs). Note that low copy TEs will not be included by RepeatModeler.

First a repeat database using the _P. amilis_ genome
```bash
[isg4@c14n07 RepeatModeler]$ BuildDatabase -name Portulaca_amilis -engine ncbi ../Data/portulaca_26Nov2018_oK3Ko.fasta

>>> Building database Portulaca_amilis:
>>>  Adding ../Data/portulaca_26Nov2018_oK3Ko.fasta to database
>>> Number of sequences (bp) added to database: 4053 ( 403885173 bp )
```

Next, as a batch job, run RepeatModeler using the `Portulaca_amilis` database.
```bash
#!/bin/bash
#SBATCH --job-name=repeat_modeler
#SBATCH --time=720:00:00
#SBATCH -c 20
#SBATCH -p general
#SBATCH --mem=36G
#SBATCH --output=repeatmodeler-%A-%a.out
#SBATCH --error=repeatmodeler-%A-%a.err
#SBATCH --ntasks-per-node=1

repeatmodeler -pa 36 -engine ncbi -database Portulaca_amilis
```
