A standard set of annotation and assembly files released as part of Phytozome release.

- Organism = _Ananas comosus_ (Bromeliaceae)
- NCBI-Taxonomy-ID = 4615
- Assembly-version = v3
- Annotation-version = v3

All `FASTA` and `GFF3` files are compressed by gzip to reduce the file size for faster downloads. Note: the number 321 in all file names is a Phytozome internal identifier for the current release of this genome annotation and can be safely ignored.

### Notes on JGI locus/gene naming convention
Starting in 2013, JGI plant genome group began to use following naming pattern:

 1. `Prefix.NGn` for stable chromosome scale genome assembly, example: `Glyma.01G000100`;
 2. `Prefix.Zn` for chromosome scale genome assembly, example: `Eucgr.A00001`, `Pavir.Aa00001`;
 3. `Prefix.Nsn` for fragmented genome assembly, example: `Pahal.0001s0001`

where `N` is chromosome number in 1) or scaffold/contig number in 3), `Z` is a letter representing a chromosome number like A for 1, B for 2 and so on in 2), and `n` is locus/gene number on a chromosome or scaffold/contig. In both 1) and 2), a letter after last chromosome represents all scaffold/contig that are not mapped to a chromosome, for example, `Glyma.U045300` (soybean has 20 chromosomes, 21st alphabet is U). Polyploid genome chromosome number can have a letter representing subgenome and hence N and Z could have one more letter like `Pavir.Aa00001`. Digit width of `N` in 1) is variable ranging from 1 to 3, dot (period) is optional, and `Prefix` is made up from organism genus and species or chosen by community. Transcript name is locus name plus . plus digits (transcript number digit), for example, `Glyma.01G000100.1`. Initially transcript having digit 1 is longest but in subsequent gene annotation, transcript with digit 1 can be lost or not longest any more. The longest transcript should be looked up from `GFF3` file with attribute `longest=1`. Initially, locus/gene number is ordered and increased by 100 from chromosome left to right in 1), but this is very likely to change when genome assembly and/or gene annotation is updated. Please refer to external source for naming pattern for third party gene sets in Phytozome.

### Files in the `annotation` subdirectory
**1.** `Acomosus_321_v3.annotation_info.txt`: A summary of annotation details available in Phytozome. This is a tab-delimited file, as follows (note that columns are blank if no corresponding data is available):
   1. Phytozome internal transcript ID (potentially useful to connect to biomart datasets)
   2. Phytozome gene locus name
   3. Phytozome transcript name
   4. Phytozome protein name (often same as transcript name, but this can vary)
   5. PFAM
   6. Panther
   7. KOG
   8. KEGG ec
   9. KEGG Orthology
   10. Gene Ontology terms (NOTE: these are automated results from `interpro2go` in most genomes, _**not**_ empirically derived)
   11. best Athaliana TAIR10 hit name
   12. best Athaliana TAIR10 hit symbol
   13. best Athaliana TAIR10 hit defline
   14. best Osativa v7.0 hit name
   15. best Osativa v7.0 hit symbol
   16. best Osativa v7.0 hit defline

"Best hits" are defined as the top result returned from BLASTP alignment of this species proteome to the target (_A. thaliana_, _O. sativa_, or _C. reinhardtii_ listed above). This was run with blast+ 2.2.26 with parameters:
```bash
blastall -p blastp -F "mS" -b 1500 -v 1500 -e 0.001 -M BLOSUM45
```
and further filtered with an 1E-3 cutoff e-value.

**2.** `Acomosus_321_v3.cds.fa.gz` and `Acomosus_321_v3.cds_primaryTranscriptOnly.fa.gz`: Nucleotide FASTA format file of all gene coding sequences, with or without alternative splice variants

**3.** `Acomosus_321_v3.protein.fa.gz` and `Acomosus_321_v3.protein_primaryTranscriptOnly.fa.gz`: Amino acid FASTA format file of all gene coding sequences, with or without alternative splice variants

**4.** `Acomosus_321_v3.transcript.fa.gz` and `Acomosus_321_v3.transcript_primaryTranscriptOnly.fa.gz`: Nucleotide FASTA format file of spliced mRNA transcripts (UTR, exons), with or without alternative splice variants

**5.** `Acomosus_321_v3.gene.gff3.gz`: GFF3 format representation of all mRNA sequences (UTR, CDS). Genomic coordinates are relative to the reference
   sequence in column 1

**6.** `Acomosus_321_v3.gene_exons.gff3.gz`: GFF3 format representation of all mRNA sequences as above, but with exon subfeatures. Genomic coordinates are relative to the reference sequence in column 1


**7.** `Acomosus_321_v3.defline.txt`: Tab-delimited list of all defline for the Phytozome transcript in the first column or provisional defLine (pdef type in second column).

**8.** `Acomosus_321_v3.repeatmasked_assembly_v3.gff3.gz`: repeat GFF, mostly by RepeatMasker, some by MerMasking, still some derived from masked genome fasta

### Files in the `assembly` subdirectory
1) `Acomosus_321_v3.fa.gz`: Nucleotide FASTA format of the current genomic assembly

2) `Acomosus_321_v3.softmasked.fa.gz` and `comosus_321_v3.hardmasked.fa.gz`: Nucleotide FASTA format of the current genomic assembly, masked for repetitive sequence by RepeatMasker (softmasked sequence is in lower case; hardmasked replaces masked sequence with Ns).


### Files in the additional subdirectories
Files in `expression`, `diversity`, etc. are releases of data related to the current annotation, and are not always available for all organisms.
