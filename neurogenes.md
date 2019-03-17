1.  Readings
    ========

Neural gene presence/absence data sources
-----------------------------------------

**Moroz et al., 2014** \[@Moroz2014\] -Table 34S: -structure of figure
shows that it is from bilaterian perspective (closer to bilateria more
rectangles filled in)  
-remember there are also random absences in cnidaria; the mirror of
bilateria, but all the proteins are characterized from bilateria  
-no examples where ctenophores or sponges don't have something present
in fungi, capsaspora, monosiga  
-Suppl Table 12as - it's possible didn't use Amphimedon genome, but
Amphimedon was covered by the other papers and I crossreferenced them.

*Mentioned in text*:  
Not in ctenophores:  
neurogenin  
NeuroD  
Achaete-scute  
REST  
HOX  
Otx

-not that much overlap in genes looked at by Riesgo vs Moroz

**Ryan et al., 2013** \[@Ryan2013\]  
*netrin, slit, unc-5 (axon guidance) not in Mnemiopsis or Amphimedon*  
-used genomes, since based on Alie and Manuel 2010  
Supplementary Table S17: Presence and absence of post-synaptic genes -
pretty much Alie and Manuel 2010 Supplementary Table S19: Presence and
absence of Dopamine / Norepinephrine /Epinephrine Biosynthetic Pathway
components

-are seqs of the animals in S17 genomes? Unsure, but all animals in
table have genomes (and the Mle seqs are from the genome)  
-AMPA iGluR and NMDA iGluR included as iGluR

**Alie and Manuel, 2010** \[@Alie2010\]  
-used genomes  
-Ryan built on Fig. 1. Cross ref with current data to make sure have
everything.  
-Only use Monosiga, Trichoplax, Amphimedon, Nematostella, Hydra, Homo  
Capitella (3 absences), Drosophila (2 absences), Homo very similar with
few differences  
Unicellular animals mostly missing everything (except B-cat and PMCA).
Start with Monosiga which has more things. B-cat and PMCA are ancient -
interesting?  
AMPAR and NMDAR collapsed into iGluR in table; presence of one of these
trumped absence of the other  
PKC alpha-beta-gamma = PKC on table

**Srivastava et al, 2010** \[@Srivastava2010\]  
-has extensive tables of presence/absence neural genes (neurogenesis
S.8.9.1, presynaptic S.8.9.2, postsynaptic S8.9.3, neurosecretory S.
8.9.4 and see Fig. 2.8.9.1 for "synapse diagram"). BUT classifies by
Holozoa, Metazoa, Eumetazoa, Bilateria. Can figure out in sponges if
Metazoa (?) but too vague? Need specific genomes?

### Quick Links to neural genes papers

Riesgo et al., 2014  
<https://academic.oup.com/mbe/article/31/5/1102/993377>  
Neural genes Fig  
<https://academic.oup.com/view-large/figure/74385341/msu057f3p.jpeg>

Moroz et al., 2014  
<https://www.nature.com/articles/nature13400>  
Table 34S: neural genes  
<https://media.nature.com/original/nature-assets/nature/journal/v510/n7503/extref/nature13400-s1.pdf>

Ryan et al, 2013  
<http://science.sciencemag.org/content/342/6164/1242592>  
Suppl Mat:  
<http://science.sciencemag.org/content/sci/suppl/2013/12/11/342.6164.1242592.DC1/Ryan.SM.pdf>

Alie and Manuel, 2010  
<https://bmcevolbiol.biomedcentral.com/articles/10.1186/1471-2148-10-34>

Srivastava et al., 2010  
Suppl.S8.9 - neural genes
<https://media.nature.com/original/nature-assets/nature/journal/v466/n7307/extref/nature09201-s1.pdf>

Nichols et al., 2012  
<https://www.pnas.org/content/109/32/13046>  
Suppl  
<https://www.pnas.org/content/pnas/suppl/2012/07/25/1120685109.DCSupplemental/sapp.pdf>

Synteny papers
--------------

**ghost locus hypothesis**:  
Ramos et al., 2012 \[@Ramos2012\]  
<https://www.sciencedirect.com/science/article/pii/S0960982212009888>  
-first ghost locus paper - parahox, Amphimedon + Trichoplax

**Fortunato et al, 2014 \[@Fortunato2014\] - sycon Parahox**  
<https://www.nature.com/articles/nature13881>  
-second ghost locus paper?

**Ferrier 2015 \[@Ferrier2015\] (review)**
<https://academic.oup.com/bfg/article/15/5/333/1741867>

***Reviews***:  
**Liu et al 2018 \[@Liu2018\]**  
<https://bmcbioinformatics.biomedcentral.com/articles/10.1186/s12859-018-2026-4>

Liu Results:  
-Pos control (default params): comparison of genome with itself: SynChro
(most synteny), DAGchainer/i-ADHoRe, MCScanX -Fragmentation: break 2
species genomes \[C. elegans, C. briggsae, S. rattis, S. stercoralis\]
(diff gene density) into diff fragment lengths. pos corr between error
rate and level of fragmentation except for Satsuma. For anchor-based
programs, fragmentation has biggest effect on MCScanX and lowest on
SynChro.  
-Find synteny between sister species: Satsuma worst (diff with
alignments/nt homology), Anchor-based programs found much higher synteny
- can't access Add. file 2 Table S1 that describes this.  
-Fragmented species and compared to its own genome: MCScanX worst. The
rest of anchor-based progs performed similarly.k SyncChro often better
or second best.Degree of error differed per species.  
-high gene density, less error (more anchors)  
-fragmented assemblies lead to erroneous GO terms.  
-reference-guided assembly methods rely on assumption of synteny =
synteny errors.

Bottom line:  
-most synteny programs designed with assumption working on complete high
quality genomes. -SynChro best for fragmented assemblies in general,
imo.  
-Satsuma does not have a positive correlation with error rate and level
of fragmentation, but performed poorly comparing two closely related
species due to failure of alignment - go with anchor-based.  
-need N50 of at least 200 kb and gene density 290 genes/Mb, or N50 1 Mb
and gene density 200 genes/Mb for error rate &lt; 5%. Higher N50 for
genomes with less gene density or many paralogues/expansion of gene
families.  
-annotation qualityt really doesn't matter just need high genome
assembly contiguity.  
-more paralogues less synteny finding?? may have misunderstood.

ANALYSIS
========

Running Synteny Programs
------------------------

According to Liu et al 2018 \[@Liu2018\] Synchro is the ideal program to
run on fragmented genomes BUT it runs on outdated file types that do not
seem to exist for my genomes.  
DAGchainer is the most popular synteny analysis program and performs
decently.  
Another very popular synteny program, MCScanx, performs poorly with
fragmented genomes \[@Liu2013\]

### Synchro

-Do synteny analysis of one genome vs itself as positive control: Aqu A
vs Aqu  
.gbff from Genbank = ".dat" for Synchro  
f.dat lat file from embl = ".embl" for Synchro  
Found .dat aka .embl \[here\]
(<https://www.ebi.ac.uk/ena/data/view/GCA_000090795.1>)  
Found .gbff aka genbank .dat \[here\]
(<ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/090/795/GCA_000090795.1_v1.0>)

genbank: it's possible .dat is outdated. .gbff has replaced .gbk and
Synchro. Yeah, even C. elegans gbff doesn't work. Archived \[genbank\]
(<ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_genbank>) and \[refseq
files\] (<ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/>)
scaffolds only, no annotation files - before annotation done?

**Big wall: Can't find the correct file types**

### DAGchainer (<http://dagchainer.sourceforge.net/>)

Very popular synteny analysis program.  
**make error:**  
`g++ -o dagchainer. dagchainer.cpp -Wno-deprecated   dagchainer.cpp:10:20: fatal error: stdio.h: No such file or directory    #include  <stdio.h>                       ^   compilation terminated.   make: *** [dagchainer.] Error 1`

Current gcc version 4.8.5 20150623 (Red Hat 4.8.5-16) (GCC) Initially
tried installing older GCC version (try GCC 4.2.3 February 1, 2008,
since program last updated 2008) but requires sudo. Don't have
permission.

Instead rename deprecated libraries to their new versions iostream.h
-&gt; iostream iomanip.h -&gt; iomanip fstream.h -&gt; fstream -
pre-standard, fstream exists but not comparable?

\[<jlm329@farnam2> DAGCHAINER\]$ make g++ -o dagchainer. dagchainer.cpp
-Wno-deprecated

Try example:

bash: ../accessory\_scripts/filter\_repetitive\_matches.pl:
/usr/local/bin/perl: bad interpreter: No such file or directory Script
not pointing to correct perl location. Change `#!/usr/local/bin/perl` to
`/usr/bin/perl` in filter\_repetitive\_matches.pl

Output files already given for examples. Running examples myself seemed
to match original output files EXCEPT
Tbrucei\_vs\_Lmajor.match\_file.filtered.aligncoords ... Problem?

Couldn't figure out how to produce this file:
Tbrucei\_vs\_Lmajor.match\_file.filtered.only\_with\_synteny or
Arabidopsis.Release5.matchList.filtered.aligncoords.2 and unsure whether
other files other than ...filtered or ..filtered.aligncoords were also
supposed to be output files.

To do:
------

**-Check to see whether genomes assembled via ref to related species
-&gt; leads to false synteny due to assumption of shared synteny**

### Synima

Synteny analysis viewer/figure maker. Works on DAGchainer output files.

**Installs on Farnam**: Problem with setting up env var, need to
`export PATH=$PATH:/home/jlm329/eeb723/jlm329/programs/R-3.5.2/bin:/home/jlm329/eeb723/jlm329/programs/blast-2.2.9-amd64-linux`
for now. Something with my .bashrc file. Sad.

*Programs*:  
- Bio/SeqIO.pm via BioPerl-1.7.5 <https://metacpan.org/pod/Bio>::SeqIO  
- Math/Round.pm via Math-Round-0.07
<https://metacpan.org/pod/Math>::Round  
- R-3.5.2 - install doesn't work unless:  
./configure  
make  
make install - Java error: Could not allocate metaspace: 1073741824
bytes - Rerun in interactive with 5G memory -&gt; works, but with
message:
`configure: WARNING: neither inconsolata.sty nor zi4.sty found: PDF vignettes and package manuals will not be rendered optimally`  
- legacy BLAST: blast-2.2.9-amd64-linux
<ftp://ftp.ncbi.nlm.nih.gov/blast/executables/legacy.NOTSUPPORTED/2.2.9/>

See exampls on \[Synima Readme\] (<https://github.com/rhysf/Synima>)  
1st example ran successfully  
Pipeline: 2nd command: problem with BLAST with second command:
\[blastall\] WARNING: \[000.000\] 7000010424373976: SetUpBlastSearch
failed. Must set env var
`export BLASTMAT=/home/jlm329/eeb723/jlm329/programs/blast-2.2.9-amd64-linux/data`

RAMOS et al. 2012 Approach:
===========================

There are very few papers that look into synteny of non-bilaterians. The
ones that have take a manual approach to synteny analysis, looking only
at one or two 'targets' at a time. The paper I am modelling my approach
off of is (Ramos et al.
2012)\[<https://doi.org/10.1016/j.cub.2012.08.023>\], the original
'ghost locus' paper that examined sponges and placozoans for synteny.

The paper starts with a list of neighbour genes known to be syntenic
with their gene of interest (GOI) in humans. They then classified all
genes in their genomes of interest as being orthologous to neighbour
genes, orthologous to non-neighbour genes, or species-specific. Then, to
identify significant clustering they used the exact binomial test to
test whether the observed number of neighbour gene orthologues
co-localizing to a scaffold is significantly higher than the expected
number. There are additional steps to deal with situations where
orthologues are more than just 1:1.

However for Amphimedon they also (or instead?) did a Monte Carlo
simulation, where they simulated the null distribution of neighbour
genes in the absence of synteny. I'm not completely sure why they also
did this MC, but perhaps because the Amphimedon scaffolds are
sub-chromosomal? The p-value for a test of clustering is calculated as
the proportion of simulations in which the number of scaffolds occupied
by neighbour genes is less than or equal to the actual number observed.
This was described in the Ramos supplement, and most of it seems to make
sense to me, but not everything. For instance they say that the results
are stored in an "amphisimulation" relational database, but what is
that?! Google only brings up that paper and 3 random websites.

There is a link to the scripts but the link is broken...

Ramos started with a list of neighbour genes; I would need to produce
this myself. Can use DAGchainer to define and identify neighbour genes
in eg. humans.

Scaffold N50s of genomes
------------------------

Liu et al. 2018 \[<Liu@2018>\] says that need N50 of at least 200 kb (w/
gene density 290genes/Mb) or 1Mb (gene densit 200 genes/Mb) for error
rate &lt; 5%.

Listed Scaffold N50s:  
-Mnemiopsis (from orig @Ryan2013): 187 kb  
-Pleurobachia (Suppl Table 5S from @Moroz2014): 20.607 kb  
-Amphimedon orig, \[Ensembl
(<https://metazoa.ensembl.org/Amphimedon_queenslandica/Info/Annotation/>):
120 kb &gt;&gt; likely improved, looking for Aqu2.1 (or is this only a
re-annotation not reassembly?)  
- Slightly confused with scaffold N50 stats in @Srivastava2010 suppl
Table S2.3.2  
(Oscarella carmela (Suppl from @Nichols2012): 5.897 kb!!) --&gt; not
using, no GFF3 file anyways.

Distribution of scaffold lengths
--------------------------------

Q: Just how badly are my genomes fragmented??  
A: quite badly.  
Use seqinr R package.

![](neurogenes_files/figure-markdown_strict/distr%20scaffold%20length-1.png)

    ## [1] "Median scaffold/contig length (bp): 35"

Parse GFF3 files:
=================

[How to read a GFF3
file:](https://github.com/The-Sequence-Ontology/Specifications/blob/master/gff3.md)

R parser:  
<https://www.rdocumentation.org/packages/ape/versions/5.2/topics/read.gff>

-'supercontigs' indicated in gff3 but all seem to be supercontig 1 and
actual seq chunks are called contigs. Probably because they needed to
enter some kind of value for supercontig. My analyses are at 'contig'
level.

![](neurogenes_files/figure-markdown_strict/count%20no%20genes%20per%20contig/scaffold-1.png)

    ## [1] "proportion contigs with gene count >= 3: 25.8749282845668"

    ## [1] "Median no. genes/contig: 2"

    ## [1] "Max no. genes/contig: 8"

Find homologous genes between genomes
=====================================

Cannot use previous agalma runs for single cell seq analysis because
those were custom fasta files from papers - ie have genes not in genome
annotation.

*Data massaging for agalma:* Downloaded all the pep files, preferably
from Ensembl.  
Rename .fa to .fasta (I think agalma had a problem with fa?)  
Agalma cuts off contig names after first space. But contig names from
Ensembl are very informative (eg gene, transcript name, location on
chromosome). Replace all spaces with \* (don't use symbols in headers :
\_- / ;).  
- regex: find: ; replace: \*

pep file MD5s on farnam:  
bc4fe9bd13468ce315a92b355770f51d
Amphimedon\_queenslandica.Aqu1.pep.all.fasta  
fa7f034a560b8d006f6bbedf9e6e47d4
Capitella\_teleta.Capitella\_teleta\_v1.0.pep.all.fasta  
0e97e42a12fe491675a7d5969dfaf36e Danio\_rerio.GRCz11.pep.all.fasta  
2efa5d8510a3f3ee85742568a8eaefa4
Drosophila\_melanogaster.BDGP6.pep.all.fasta  
630d31e402bbc853aa6df1cf47bd6ab6
Helobdella\_robusta.Helro1.pep.all.fasta  
d6b56e455745b1f9025cd8b96e8af2ac Homo\_sapiens.GRCh38.pep.all.fasta  
f68d59385701997e7fef4c6b74d20b2a hydra2.0\_genemodels.aa.fasta  
e6e5bd7f636b897780addb0295fc06ae Lottia\_gigantea.Lotgi1.pep.all.fasta  
53a6be259502ccd3350c5440cd65b1a5
Mnemiopsis\_leidyi.MneLei\_Aug2011.pep.all.fasta  
e281b4e654059be06810404e9372099d
Nematostella\_vectensis.ASM20922v1.pep.all.fasta  
3bf67e6dc2fec0849a973182825ae861
Strongylocentrotus\_purpuratus.Spur\_3.1.pep.all.fasta  
58d926ffcb37932fc3a0a6203264f96e
Taeniopygia\_guttata.taeGut3.2.4.pep.all.fasta  
cc34c2c0b4eccd6769ceb46d4eca1c9b
Trichoplax\_adhaerens.ASM15027v1.pep.all.fasta

Run agalma:  
Install agalma 2.0 onto farnam. Farnam currently has 1.0.1.  
Installed Miniconda on Farnam

modified 00-catalog.sh  
chose partition 'general' on farnam, job 30509923 &gt;&gt; error. Is
agalma even installed on farnam?!!

FIGURES TO MAKE...soonish hmm
=============================

Comparison across clades of:  
-median scaffold lengths  
-median no. genes/contig or proportion of contigs with gene count &gt;=
3

Data
====

Genomes
-------

### <s>Genbank:</s>

*Decided to go with Ensemblgenome version because Ensembl provides GFF3
files; Genbank only GFF.*

### Ensembl:

File types:  
-toplevel: includes chromosomes, regions not assembled into chromosomes,
N padded haplotype/patch regions.  
-nonchromosomal rm: masked  
sm: soft-masked  
-chose toplevel, not masked

Choanos: Monosiga
<https://protists.ensembl.org/Monosiga_brevicollis_mx1/Info/Index>
Salpingoeca <http://protists.ensembl.org/Salpingoeca_rosetta/Info/Index>

Non-bilaterians:  
Amphimedon  
[GFF3](ftp://ftp.ensemblgenomes.org/pub/metazoa/release-42/gff3/amphimedon_queenslandica)  
[genome:Aqu1](https://metazoa.ensembl.org/Amphimedon_queenslandica/Info/Index)  
[genome
prots](ftp://ftp.ensemblgenomes.org/pub/metazoa/release-42/fasta/amphimedon_queenslandica/pep/)  
-note: clicking "Aqu1" leads to an assembly with names that do not match
GFF3. Instead click "Download DNA sequence"

Mnemiopsis  
[GFF3](ftp://ftp.ensemblgenomes.org/pub/metazoa/release-42/gff3/mnemiopsis_leidyi)  
[MneLei\_Aug2011 genome
FASTA](http://metazoa.ensembl.org/Mnemiopsis_leidyi/Info/Index)  
[genome
prots](ftp://ftp.ensemblgenomes.org/pub/metazoa/release-42/fasta/mnemiopsis_leidyi/pep/)

Trichoplax adhaerens  
[GFF3](ftp://ftp.ensemblgenomes.org/pub/metazoa/release-42/gff3/trichoplax_adhaerens)  
[ASM15027v1 genome
FASTA](https://metazoa.ensembl.org/Trichoplax_adhaerens/Info/Index)  
[genome
prot:](ftp://ftp.ensemblgenomes.org/pub/metazoa/release-42/fasta/trichoplax_adhaerens/pep/)

Hydra vulgaris  
[GFF3:](https://research.nhgri.nih.gov/hydra/download/?dl=nt)  
**- gene models separated into separate gff3s for each scaffold
(thousands...) &gt;&gt; see how R parses a catted file.**  
[genome FASTA: Hydra
2.0](https://research.nhgri.nih.gov/hydra/download/?dl=asl)  
[genome prot](https://research.nhgri.nih.gov/hydra/download/?dl=aa)

Nemtostella  
[GFF3](ftp://ftp.ensemblgenomes.org/pub/metazoa/release-42/gff3/nematostella_vectensis)  
[genome
FASTA:](https://metazoa.ensembl.org/Nematostella_vectensis/Info/Index)  
\[genome prot:\]

Deuteros Strongylocentrotus purpuratus  
[GFF3](ftp://ftp.ensemblgenomes.org/pub/metazoa/release-42/gff3/strongylocentrotus_purpuratus)  
[genome FASTA: Spur
3.1](https://metazoa.ensembl.org/Strongylocentrotus_purpuratus/Info/Index)  
[genome
pep](ftp://ftp.ensemblgenomes.org/pub/metazoa/release-42/gff3/strongylocentrotus_purpuratus)  
-according to this
(<https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4489978/>) strongylo has
most mature draft genome of the echinoderms

Vertebrates Zebrafinch  
[GFF3](ftp://ftp.ensembl.org/pub/release-95/gff3/taeniopygia_guttata/)  
[genome
FAST:taeGUT3.2.4](https://useast.ensembl.org/Taeniopygia_guttata/Info/Index)  
[genome
pep](ftp://ftp.ensembl.org/pub/release-95/fasta/taeniopygia_guttata/pep/)

Homo sapiens
[GFF3](ftp://ftp.ensembl.org/pub/release-95/gff3/homo_sapiens/)  
[genome
FASTA:GRCh38.p12](https://useast.ensembl.org/Homo_sapiens/Info/Index)  
[genome
pep](ftp://ftp.ensembl.org/pub/release-95/fasta/homo_sapiens/pep/)

Danio rerio (non-euteleost fish)  
[GFF3](ftp://ftp.ensembl.org/pub/release-95/gff3/danio_rerio/)  
[genome FASTA:GRCz11
(GCA\_000002035.4)](http://useast.ensembl.org/Danio_rerio/Info/Index)  
[genome
pep](ftp://ftp.ensembl.org/pub/release-95/fasta/danio_rerio/pep/)

Ecdysozoa:  
-Gonzalo's take on current state of Ecdysozoan genomes:
<https://academic.oup.com/icb/article/57/3/455/4093795#96942899>
Helobdella
[GFF3](ftp://ftp.ensemblgenomes.org/pub/metazoa/release-42/gff3/helobdella_robusta)  
[genome
FASTA:Helro1](http://metazoa.ensembl.org/Helobdella_robusta/Info/Index)  
[genome
pep](ftp://ftp.ensemblgenomes.org/pub/metazoa/release-42/fasta/helobdella_robusta/pep/)

Drosophila
[GFF3](ftp://ftp.ensembl.org/pub/release-95/gff3/drosophila_melanogaster/)  
[genome FASTA:BDGP6
(GCA\_000001215.4)](https://useast.ensembl.org/Drosophila_melanogaster/Info/Index)  
[genome
pep](ftp://ftp.ensembl.org/pub/release-95/fasta/drosophila_melanogaster/pep/)

2 Spiralians:  
Lottia gigantea and Capitella telata? see
<https://www.nature.com/articles/nature11696> sounds like there is
comparatively good conservation with some deuterostomes

Lottia <http://metazoa.ensembl.org/Capitella_teleta/Info/Index>
[GFF3](ftp://ftp.ensemblgenomes.org/pub/metazoa/release-42/gff3/lottia_gigantea)  
[genome
FASTA:LotG1](https://metazoa.ensembl.org/Lottia_gigantea/Info/Index)  
[genome
pep](ftp://ftp.ensemblgenomes.org/pub/metazoa/release-42/fasta/lottia_gigantea/pep/)

Capitella  
[GFF3](ftp://ftp.ensemblgenomes.org/pub/metazoa/release-42/gff3/capitella_teleta)  
[genome
FASTA:Capitella\_teleta\_v1.0](http://metazoa.ensembl.org/Capitella_teleta/Info/Index)  
[genome
pep](ftp://ftp.ensemblgenomes.org/pub/metazoa/release-42/fasta/capitella_teleta/pep/)

Warren has a good list of data sources
[here](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5534336/)

For future analyses (might not get to this for this course)
-----------------------------------------------------------

### Neurogenes Table

*Table abbreviations*  
DBH - dopamine-B-hydroxylase  
DDC - DOPA decarboxylase  
TH - tyrosine hydroxylase  
TPH - tryptophan hydroxylase  
PAH - phenylalanine hydroxylase  
GAD - glutamate decarboxylase  
Qdpr - quinoid dihydropteridine reductase,  
Slc18A2 = Homo sapiens solute carrier family 18 member 2,  
Pnmt = phenylethanolamine N-methyltransferase

Missing domains  
Piccolo - Pleurobrachia - missing ZF (Moroz et al., 2014)  
Erbin - Pleurobrachia - missing PDZ (Moroz et al., 2014)

Species names written to the broadest level - eg. Monosiga brevicollis
in Riesgo et al but only Monosiga in Moroz, so put Monosiga only

Many entries have NA but if combine:  
Salpingoeca + Monosiga = Choanoflagellida  
Pleurobrachia + Mnemiopsis = Ctenophora  
Amphimedon + Oscarella = Porifera  
Nematostella + Hydra = Cnidaria  
Get only 4 entries that have an NA.  
(What about 0/1s (conflicting info?) &gt;&gt; decided to transform 0/1s
into NA

Loss\_Status: P1C0: present in Porifera, absent in Ctenphora - 6
instances  
C1P0: present in Ctenophora, absent in Porifera - 3 instances  
T0: absent in Trichoplax but present in Ctenophora or Porifera - 5
instances

Second Iteration:  
-There is only 2 instances where Capsaspora has a 1 while
choanoflagellates have 0: GABAR and DDC. Don't use column in second
iteration  
-'Fungi' is very vaguely defined - don't use column in second
iteration  
-Stopped at Delta catenin -Make new table where all 0/1s or
missing\_domains (i.e. not 0,1,NA) into NA

Via R Create a new table where species for Ctenophora, Porifera
combined:
<https://stackoverflow.com/questions/14563531/combine-column-to-remove-nas>

1.  Should we be expecting these genes in these animals?  
    Why should they use similar genes?  
    How misguided is this approach? What is the true question implied by
    this approach?

References
----------
