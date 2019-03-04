
# _Portulaca amilis_ genome project

I've found that patching together all of the genomics tools can mess with my standard conda environment. To separate my genome analysis tools from my general conda packages I created a new environment called `genome`. See [Supplementary materials] for a full conda environment description.

```bash
[isg4@farnam2 ~]$ conda create --name genome
[isg4@farnam2 ~]$ source activate genome
```
## 0. Quality control
### 0.1 QUAST
This is useful for comparing new assemblies to old assemblies and looking for improvements. For v0 of the genome we will run without a comparison.

### Software prerequisites
- QUAST
  - Install: `conda install -c bioconda quast`
  - Version:
- GRIDSS
  - Install: `conda install -c bioconda gridss`
  - Version: 2.1.0
- BUSCO
  - Install: `conda install -c bioconda busco`
  - Version: 3.0.2
  -

QUAST isn't recognizing matplotlib and saying that the license is expired for genemarker-es. Here are the current quast_lib locations

* ~/.linuxbrew/lib/python2.7/site-packages/quast-5.0.2-py2.7.egg/quast_libs
* ~/anaconda2/pkgs/quast-5.0.2-py27pl526ha92aebf_0/opt/quast-5.0.2/quast_libs
* ~/anaconda2/pkgs/quast-5.0.2-py27pl526ha92aebf_0/lib/python2.7/site-packages/quast_libs
* ~/anaconda2/opt/quast-5.0.2/quast_libs
* ~/anaconda2/lib/python2.7/site-packages/quast_libs

Note from developers:

Note 2: the fail of gene prediction module is not a critical error, so it is reported as a "non-fatal error" in the log and does not cause a crash of the entire pipeline. I suppose that the local GeneMark license file provided in the Quast package may be out of date already and that caused the crash of the MetaGeneMark prediction tool. You can update either solely the license file (~/.gm_key -- you can obtain the new file at http://exon.gatech.edu/GeneMark/license_download.cgi after filling the license form; download the gzipped archive, unpack it and move to your ~/.gm_key file) or by updating Quast to the latest version (includes a new license file).

quast was run with: `/ysm-gpfs/home/isg4/anaconda2/bin/quast ../portulaca_26Nov2018_oK3Ko.fasta.gz -o . --split-scaffolds --eukaryote --k-mer-stats --circos --gene-finding` but the gene finding and circos plot didn't work because of the issues above.

### 0.2 gVolante: Completeness Assessment of Genome/Transcriptome Sequences
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

### 1.0 Software prerequisites
- [Rcorrector](https://github.com/mourisl/Rcorrector)
  - Install: `git clone https://github.com/mourisl/Rcorrector.git`
  - Version:
- [Trimmomatic](http://www.usadellab.org/cms/?page=trimmomatic)
  - Install: installed with `trinity` install, see below
  - Version: 0.038
- Bowtie2 Version
  - Install:`conda install -c bioconda bowtie2`
  - Version: 2.3.4.3
- FastQC Version
  - Install: `conda install -c bioconda fastqc`
  - Version: 0.11.8
- Trinity
  - Install: `conda install -c bioconda trinity`
  -Version:
  - Notes
    - From Ya Yang: "newer versions [than 2.5.1] may have a conflict with version of Salmon"
- [Transrate](http://hibberdlab.com/transrate/)
  - Install:
  - Version 1.0.3
  - Notes
    - From Ya Yang: "Problems have been reported with some libraries of Salmon 0.6.2, please check that Salmon works properly. If you have problems with Salmon 0.6.0 you can install - Transrate from here, this will work with Salmon 0.8.2, which needs to be in the path as salmon"
- Corset
  - Install: `conda install -c bioconda corset`
  - Version: 1.07
- Salmon
  - Install: Was installed as a dependency for another `conda` install, but can't remember which one.
  - Version: 0.12.0
  - Notes: From Ya Yang: "This is used for Corset and have not been tested with newer versions). You need to name this version salmon-0.9.1."
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
  - Install: `conda install -c bioconda raxml`
  - Version: 8.2.12
- **Phyx**
  - Install:
  - Version:
  - Notes: Currently `phyx` uses dependencies that are installed with `apt-get`. I need to figure out a work around for this on Red Hat systems, probably will have to manually install them.
- mafft Version
  - Install:`conda install -c bioconda mafft`
  - Version: 7.407
- Gblocks
  - Install: `conda install -c bioconda gblocks`
  - Version: 0.91b
- FastTree
  - Install: `conda install -c bioconda fasttree`
  - Version: 2.1.10
- Pasta
  - Install: `conda install -c genomedk pasta`
  - Version: 1.8.2
- Prank
  - Install: `conda install -c bioconda prank`
  - Version: 170427

### 1.1 Read processing
**The Yang pipeline specifies that read files needs to be in the format "taxonID_1.fq" and "taxonID_2.fq". I renamed my files `ERR2040261_1.fq` and `ERR2040261_2.fq`**.

```bash
#!/bin/bash
#SBATCH --job-name=filter_fq
#SBATCH -c 20
#SBATCH --mem=36G
#SBATCH -t 60:00:00
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=ian.gilman@yale.edu
#SBATCH -o filter_fq.%A-%a.out
#SBATCH -e filter_fq.%A-%a.err

source activate genome

python ~/project/apps/phylogenomic_dataset_construction/scripts/filter_fq.py ../Data/1kp_transcriptome/ERR2040261_1.fq ../Data/1kp_transcriptome/ERR2040261_2.fq Caryophyllales both 20 /home/isg4/scratch60/P_amilis_genome/Transcriptomics clean > filter_fq.log
```
The above command will
1. Random sequencing error correction with Rcorrector
2. Removes read pairs that cannot be corrected
3. Remove sequencing adapters and low quality sequences with Trimmomatic
4. Filter organelle reads (cpDNA, mtDNA or both) with Bowtie2. Files containing only organelle reads will be produced which can be use to assemble for example the plastomes with [Fast-Plast](https://github.com/mrmckain/Fast-Plast)
5. Runs FastQC to check read quality and detect over-represented reads
6. Remove Over-represented sequences

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
#SBATCH --time=144:00:00
#SBATCH -c 20
#SBATCH -p general
#SBATCH --mem=36Ga
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=ian.gilman@yale.edu
#SBATCH --output=repeatmodeler-%A-%a.out
#SBATCH --error=repeatmodeler-%A-%a.err
#SBATCH --ntasks-per-node=1

/home/isg4/project/apps/RepeatModeler/RepeatModeler -pa 36 -engine ncbi -database Portulaca_amilis

repeatmodeler -pa 36 -engine ncbi -database Portulaca_amilis
```
## Supplementary information

```bash
(/gpfs/ysm/project/isg4/conda_envs/genome) [isg4@c16n06 apps]$ conda list
# packages in environment at /gpfs/ysm/project/isg4/conda_envs/genome:
#
# Name                    Version                   Build  Channel
_r-mutex                  1.0.0               anacondar_1
augustus                  3.2.3               boost1.60_0    bioconda
bamtools                  2.5.1                he860b03_4    bioconda
blas                      1.0                         mkl
blast                     2.2.31              boost1.60_2    bioconda
boost                     1.60.0                   py36_0
boost-cpp                 1.63.0                        2    conda-forge
bowtie                    1.2.2            py36h2d50403_1    bioconda
bowtie2                   2.3.4.3          py36he860b03_1    bioconda
busco                     3.0.2                   py36_10    bioconda
bwidget                   1.9.11                        1
bzip2                     1.0.6             h14c3975_1002    conda-forge
ca-certificates           2018.11.29           ha4d7672_0    conda-forge
cairo                     1.14.12           h80bd089_1005    conda-forge
cd-hit                    4.8.1                hdbcaa40_0    bioconda
certifi                   2018.11.29            py36_1000    conda-forge
circos                    0.69.6                        4    bioconda
corset                    1.07                 he941832_0    bioconda
curl                      7.64.0               h646f8bb_2    conda-forge
cycler                    0.10.0                     py_1    conda-forge
dendropy                  4.1.0                    py36_0    bioconda
expat                     2.2.5             hf484d3e_1002    conda-forge
fastqc                    0.11.8                        1    bioconda
fasttree                  2.1.10               h470a237_2    bioconda
findutils                 4.6.0             h14c3975_1000    conda-forge
font-ttf-dejavu-sans-mono 2.37                 h6964260_0
fontconfig                2.13.1            h2176d3f_1000    conda-forge
freetype                  2.9.1             h94bbf69_1005    conda-forge
gblocks                   0.91b                         1    bioconda
gettext                   0.19.8.1          h9745a5d_1001    conda-forge
giflib                    5.1.4             h14c3975_1001    conda-forge
glib                      2.56.2            had28632_1001    conda-forge
glimmerhmm                3.0.4                h2d50403_2    bioconda
graphite2                 1.3.13            hf484d3e_1000    conda-forge
gridss                    2.1.0                         0    bioconda
gsl                       2.2.1                h0c605f7_3
harfbuzz                  1.9.0             he243708_1001    conda-forge
hmmer                     3.2.1                hf484d3e_1    bioconda
icu                       58.2              hf484d3e_1000    conda-forge
intel-openmp              2019.1                      144
java-jdk                  8.0.92                        1    bioconda
jellyfish                 2.2.10               h2d50403_0    bioconda
jemalloc                  5.1.0             hf484d3e_1000    conda-forge
joblib                    0.13.2                     py_0    conda-forge
jpeg                      9c                h14c3975_1001    conda-forge
kiwisolver                1.0.1           py36h6bb024c_1002    conda-forge
krb5                      1.16.3            h05b26f9_1001    conda-forge
libboost                  1.67.0               h46d08c1_4
libcurl                   7.64.0               h541490c_2    conda-forge
libdeflate                1.0                  h14c3975_1    bioconda
libedit                   3.1.20170329      hf8c457e_1001    conda-forge
libffi                    3.2.1             hf484d3e_1005    conda-forge
libgcc                    7.2.0                h69d50b8_2    conda-forge
libgcc-ng                 7.3.0                hdf63c60_0    conda-forge
libgd                     2.2.5             h0d07dcb_1005    conda-forge
libgfortran               3.0.0                         1    conda-forge
libgfortran-ng            7.2.0                hdf63c60_3    conda-forge
libiconv                  1.15              h14c3975_1004    conda-forge
libpng                    1.6.36            h84994c4_1000    conda-forge
libssh2                   1.8.0             h90d6eec_1004    conda-forge
libstdcxx-ng              7.3.0                hdf63c60_0    conda-forge
libtiff                   4.0.10            h648cc4a_1001    conda-forge
libuuid                   2.32.1            h14c3975_1000    conda-forge
libwebp                   1.0.2                h576950b_1    conda-forge
libxcb                    1.13              h14c3975_1002    conda-forge
libxml2                   2.9.8             h143f9aa_1005    conda-forge
mafft                     7.407                         0    bioconda
make                      4.2.1             h14c3975_2004    conda-forge
matplotlib                3.0.3                    py36_0    conda-forge
matplotlib-base           3.0.3            py36h167e16e_0    conda-forge
mcl                       14.137          pl526h470a237_4    bioconda
mkl                       2019.1                      144
mkl_fft                   1.0.10           py36h14c3975_1    conda-forge
mkl_random                1.0.2            py36h637b7d7_2    conda-forge
ncurses                   6.1               hf484d3e_1002    conda-forge
numpy                     1.16.2           py36h7e9f1db_0
numpy-base                1.16.2           py36hde5b4d6_0
openjdk                   11.0.1            h14c3975_1014    conda-forge
openssl                   1.1.1b               h14c3975_0    conda-forge
pango                     1.40.14           hf0c64fd_1003    conda-forge
pasta                     1.8.2                    py36_2    genomedk
pcre                      8.41              hf484d3e_1003    conda-forge
perl                      5.26.2            h14c3975_1002    conda-forge
perl-app-cpanminus        1.7044                  pl526_1    bioconda
perl-autoloader           5.74                    pl526_1    bioconda
perl-carp                 1.38                    pl526_1    bioconda
perl-clone                0.41            pl526h470a237_0    bioconda
perl-config-general       2.63                    pl526_0    bioconda
perl-dbi                  1.642                   pl526_0    bioconda
perl-digest-perl-md5      1.9                     pl526_1    bioconda
perl-dynaloader           1.25                    pl526_1    bioconda
perl-exporter             5.72                    pl526_1    bioconda
perl-exporter-tiny        1.002001                pl526_0    bioconda
perl-extutils-makemaker   7.34                    pl526_3    bioconda
perl-font-ttf             1.06                    pl526_0    bioconda
perl-gd                   2.70            pl526he941832_0    bioconda
perl-io-string            1.08                    pl526_3    bioconda
perl-list-moreutils       0.428                   pl526_1    bioconda
perl-list-moreutils-xs    0.428                   pl526_0    bioconda
perl-math-bezier          0.01                    pl526_1    bioconda
perl-math-round           0.07                    pl526_1    bioconda
perl-math-vecstat         0.08                    pl526_1    bioconda
perl-module-implementation 0.09                    pl526_2    bioconda
perl-module-runtime       0.016                   pl526_0    bioconda
perl-number-format        1.75                    pl526_3    bioconda
perl-params-validate      1.29            pl526h470a237_0    bioconda
perl-pathtools            3.73                 h470a237_2    bioconda
perl-readonly             2.05                    pl526_0    bioconda
perl-regexp-common        2017060201              pl526_0    bioconda
perl-scalar-list-utils    1.45            pl526h470a237_3    bioconda
perl-set-intspan          1.19                    pl526_1    bioconda
perl-statistics-basic     1.6611                  pl526_2    bioconda
perl-svg                  2.84                    pl526_0    bioconda
perl-test-more            1.001002                pl526_1    bioconda
perl-text-format          0.59                    pl526_1    bioconda
perl-time-hires           1.9758                  pl526_0    bioconda
perl-try-tiny             0.30                    pl526_0    bioconda
perl-xml-parser           2.44_01         pl526h3a4f0e9_1    conda-forge
perl-xsloader             0.24                    pl526_0    bioconda
perl-yaml                 1.27                    pl526_0    bioconda
pip                       19.0.3                   py36_0    conda-forge
pixman                    0.34.0            h14c3975_1003    conda-forge
pthread-stubs             0.4               h14c3975_1001    conda-forge
pymongo                   3.3.0                    py36_0
pyparsing                 2.3.1                      py_0    conda-forge
pyqt                      4.11.4                   py36_3    conda-forge
python                    3.6.7             h381d211_1004    conda-forge
python-dateutil           2.8.0                      py_0    conda-forge
qt                        4.8.7                         2
quast                     5.0.2           py36pl526ha92aebf_0    bioconda
r-assertthat              0.2.0           r351h6115d3f_1001    conda-forge
r-base                    3.5.1                h391c2eb_5    conda-forge
r-cli                     1.0.1           r351h6115d3f_1000    conda-forge
r-colorspace              1.4_0            r351h96ca727_0    conda-forge
r-crayon                  1.3.4           r351h6115d3f_1001    conda-forge
r-digest                  0.6.18          r351h96ca727_1000    conda-forge
r-fansi                   0.4.0           r351h96ca727_1000    conda-forge
r-ggplot2                 3.1.0           r351h6115d3f_1000    conda-forge
r-glue                    1.3.0           r351h14c3975_1002    conda-forge
r-gtable                  0.2.0           r351h6115d3f_1001    conda-forge
r-labeling                0.3             r351h6115d3f_1001    conda-forge
r-lattice                 0.20_38         r351h96ca727_1000    conda-forge
r-lazyeval                0.2.1           r351h96ca727_1002    conda-forge
r-magrittr                1.5             r351h6115d3f_1001    conda-forge
r-mass                    7.3_51.1        r351h96ca727_1000    conda-forge
r-matrix                  1.2_15          r351h96ca727_1000    conda-forge
r-mgcv                    1.8_26          r351h96ca727_1000    conda-forge
r-munsell                 0.5.0           r351h6115d3f_1001    conda-forge
r-nlme                    3.1_137         r351ha65eedd_1000    conda-forge
r-pillar                  1.3.1           r351h6115d3f_1000    conda-forge
r-pkgconfig               2.0.2           r351h6115d3f_1001    conda-forge
r-plyr                    1.8.4           r351h29659fb_1002    conda-forge
r-r6                      2.4.0            r351h6115d3f_0    conda-forge
r-rcolorbrewer            1.1_2           r351h6115d3f_1001    conda-forge
r-rcpp                    1.0.0           r351h29659fb_1000    conda-forge
r-reshape2                1.4.3           r351h29659fb_1003    conda-forge
r-rlang                   0.3.1            r351h96ca727_0    conda-forge
r-scales                  1.0.0           r351h29659fb_1001    conda-forge
r-stringi                 1.2.4           r351h29659fb_1001    conda-forge
r-stringr                 1.4.0            r351h6115d3f_0    conda-forge
r-tibble                  2.0.1            r351h96ca727_0    conda-forge
r-utf8                    1.1.4           r351h96ca727_1000    conda-forge
r-viridislite             0.3.0           r351h6115d3f_1001    conda-forge
r-withr                   2.1.2           r351h6115d3f_1000    conda-forge
raxml                     8.2.12               h470a237_0    bioconda
readline                  7.0               hf8c457e_1001    conda-forge
salmon                    0.12.0               h86b0361_1    bioconda
samtools                  1.9                  h91753b0_5    bioconda
setuptools                40.8.0                   py36_0    conda-forge
simplejson                3.16.1           py36h470a237_0    conda-forge
sip                       4.18                     py36_1    conda-forge
six                       1.12.0                py36_1000    conda-forge
sqlite                    3.26.0            h67949de_1000    conda-forge
tbb                       2019.4               h6bb024c_0    conda-forge
tk                        8.6.9             h84994c4_1000    conda-forge
tktable                   2.10                 h14c3975_0
tornado                   6.0.1            py36h14c3975_0    conda-forge
trimmomatic               0.38                          1    bioconda
trinity                   2.8.4           py36pl526h447964c_0    bioconda
wheel                     0.33.1                   py36_0    conda-forge
xorg-kbproto              1.0.7             h14c3975_1002    conda-forge
xorg-libice               1.0.9             h14c3975_1004    conda-forge
xorg-libsm                1.2.3             h4937e3b_1000    conda-forge
xorg-libx11               1.6.7             h14c3975_1000    conda-forge
xorg-libxau               1.0.9                h14c3975_0    conda-forge
xorg-libxdmcp             1.1.2             h14c3975_1007    conda-forge
xorg-libxext              1.3.3             h14c3975_1004    conda-forge
xorg-libxrender           0.9.10            h14c3975_1002    conda-forge
xorg-renderproto          0.11.1            h14c3975_1002    conda-forge
xorg-xextproto            7.3.0             h14c3975_1002    conda-forge
xorg-xproto               7.0.31            h14c3975_1007    conda-forge
xz                        5.2.4             h14c3975_1001    conda-forge
zlib                      1.2.11            h14c3975_1004    conda-forge
```



**Need to figure out where the following section belongs**
#### Mapping reads to genome
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
