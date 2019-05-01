# Final Project

## Introduction

This is a final project for the [Comparative Genomics](https://github.com/Yale-EEB723/syllabus) seminar in the spring of 2019. This project will analyze publicly available RNA-seq data obtained from the SRA database in order to study the evolution of the Major Histocompatibility Complex, which represents a key component of the vertebrabe adaptive immune system, in a clade of cold-aadapted teleost fishes known as notothenioids.  

## Background
The Major Histocompatibility Complex represents a fundamental component of the adaptive immune response in jawed vertebrates, and thus has been very well studied (Kasahara 1999; Neefjies et al. 2011; Parham 2015; Roche and Furuta 2015). MHC class I and class II genes encode cell surface proteins that are capable of binding to both self and non-self peptides and displaying them on the cell surface for inspection by the appropriate T-cells. Specifically, MHC class I molecules are primarily responsible for binding cytosolic antigens acquired in the endoplasmic reticulum and presenting them to CD8+ T cells (Gueguen and Long 1996). In contrast, MHC class II molecules bind antigens that are derived mostly from exogenous material and present them to CD4+ T cells (Gueguen and Long 1996). If a non-self antigen - that is, a peptide derived from a pathogen - is presented to a T cell, the immune response is activated and the infected cell is destroyed. In order to effectively defend against an array of diverse and rapidly-evolving pathogens, host immune genes are also under pressure to rapidly diversify. MHC genes, for instance, exhibit remarkable polymorphism across vertebrate species, thus enabling MHC molecules to bind and present to T cells a vast array of different antigens.  
Comprising over 32,000 species, teleost fishes represent the most species-rich major vertebrate clade and are characterized by a number of interesting innovations in organization, functionality, and diversity of MHC genes. For instance, in all other vertebrate groups that have been studied, MHC I and II loci are found to be clustered in the same chromosomal region, while in teleosts, MHC class I and class II genes are characterized by an unlinked organization, with the two gene subfamilies present on different chromosomes in zebrafish (Danio rerio), stickleback (Gasterosteus aculeatus), the common guppy (Poecilia reticulata), and the cichlid Oreochromis niloticus (Sato et al. 2000, Stet et al. 2003). Furthermore, the number and diversity of functional copies of MHC I and MHC II genes can vary significantly both within and across species. A particularly dramatic modification of MHC gene functionality is observed in the Gadiformes lineage, which includes Atlantic cod. In this teleost clade, a complete loss of the MHC II pathway has been observed, and appears to be coupled with an increase in MHC I copy number and broader functionality of the MHC I pathway. It has been suggested that these significant modifications in features of the adaptive immune system long-thought to be highly conserved across vertebrates may be a result of strong selective pressures associated with specific biological or environmental factors. In the case of these cod-like fishes, it is been hypothesized that evolution of MHC genes has been strongly influenced by adaptation of this lineage to environments characterized by relatively low water temperatures. Indeed, it has been shown previously that low temperatures have been associated with weakening of the adaptive immune response coincident with strengthening of innate immunity. This begs the question: how generalizable is this pattern? Would we expect to see a similar dramatic modification of the adaptive immune response in other cold-adapted lineages? 

The Antarctic notothenioid fishes provide a unique opportunity to study evolution of the MHC system in the coldest ocean waters on our planet. The Antarctic notothenioids are a clade of about 100 morphologically and ecologically diverse species that dominate the species diversity, abundance, and biomass of the Antarctic continental shelf and slope ichthyofauna. Water temperatures in this part of the world can reach as low as -1.86oC, and in order to survive in such extreme conditions, the notothenioids fishes have evolved several key adaptations related to freeze-avoidance and cold-stable biochemical and physiological functions. Among these are evolution of the antifreeze glycoprotein, which inhibits growth of ice crystals in the fishes’ bodily fluids, cold-efficient microtubule assembly, and increased mitochondrial densities. Antarctic notothenioids also exhibit unique features in immune response relative to non-Antarctic species, suggesting that evolution in extreme cold may be accompanied by adaptive changes in immunity. For example, previous study of transcriptomic and genomic evolution in notothenioids revealed duplication and elevated transcription of genes involved in the innate immune response, which is in line with the previously mentioned suggestion that lower water temperatures are associated with strengthening of the innate immune response. Furthermore, Antarctic teleosts have been shown to exhbit unique features of immunoglobulin genes comparted with non-Antarctic species, such as presence of a long hinge peptide. Thus, the Antarctic notothenioids provide an interesting case study for examining evolution of immune-related genes in an extreme environment. 

## The goal

The primary objective of this project was to study the evolution of the MHC system in Antarctic notothenioids. Specifically, I wanted to know whether and in what way presence and diversity of MHC genes in notothenioid species may have been impacted by adaptation to the extremely low temperatures of the Southern Ocean. 

## The data

Investigating the presence and diversity of MHC genes required collection of transcriptomic for both Antarctic and non-Antarctic notothenioid species. Previously-sequenced and publicly-available raw, unassembled RNA-seq reads were downloaded from the NCBI Sequence Read Archive for 15 Antarctic notothenioid species and 1 non-Antarctic notothenioid (see Table 1 for species and accession info). 

A meaningful understanding of how MHC diversity in cold-adapted Antarctic notothenioids might differ from other temperate or tropical teleosts required collection of additional genomic and/or transcriptomic data. Assembled scaffolds for 10 other teleost species were downloaded from the dryad data repository (see Table 1 for species and accession info). 

Finally, this project required a high-quality notothenioid genome for mapping transcriptomic reads. For this, the Antarctic bullhead notothen (Notothenia coriiceps) genome was obtained from BioProject (Accession No. ). 

## Methods

# Data Processing

The raw RNA-seq reads were processed using the transcriptome assembly pipeline described in Yang & Smith 2014, and which can be accessed here. (link to repo). The first step involved using a suite of tools to:

1. Correct random sequence error and remove reads that can't be corrected (Rcorrector)
2. Remove adapters and low quality sequences (Trimmomatic)
3. Filter mtDNA reads (Bowtie2)
4. Identify and remove overrepresented reads (FastQC)

Next, the Notothenia coriiceps genome was used for genome-guided de novo transcriptome assembly in Trinity. In this assembly approach, the reference genome is first indexed, the transcriptome reads are mapped to the resulting indices and are sorted into bins based on their position in the genome. Within these bins, transcripts undergo local de novo assembly. 

Finally, for each of the assembled transcripts, candidate protein-coding regions are scored using Transdecoder. Identified candidates are then searched against publicly available proteomes for zebrafish (Danio rerio) and stickleback (Gasterosteus aculeatus) using BLAST+. Candidate ORFs with positive BLAST hits are retained for downstream analyses. 

# MHC Gene Identification

Following Malmstrom et al. 2016, presence of 27 immune-related genes (as well as of 3 "control" genes) was evaluated using query peptide sequences from 10 different model teleost species for blastp searches that applied an e-value threshold of 1e^-5 (see Supplementary Table 1 for list of immune related genes and associated accession numbers for queries - adapted from Supplementary Table 6 from Malmstrom et al. 2016). The identity of positive hits was further assessed by reciprocal BLAST against the UniProtKB protein sequence database. 

# Analyses of MHC Sequences

Finally, the evolution of MHC genes in notothenioids will be inferred using phylogenetic analysis for the top-scoring hits identified for each MHC gene for each notothenioid species. For each gene, a multiple sequence alignment of the top-scoring hits for each notothenioid species as well as selected homologous sequences from 10 other teleost species will be generated using MAFFT. Phylogenetic relationships of the sequences identified as MHC genes will be inferred using a maximum likelihood approach implemented in the program IQTree. 

## Results (so far)

# Transcriptome Assembly Quality

For each of the 16 notothenioid species included in this analysis, average overall alignment rate of the RNA-seq reads to the reference genome was ~44% and ranged from 20% to 60% (see Table 2 for Transcriptome Assembly stats). 

# MHC Gene Mining

Ongoing. 

## Assessment

The initial goal of this project was to characterize presence and diversity of MHC genes in the Antarctic notothenioids. As of 12am on May 1st, identification of MHC genes using blastp remains ongoing and will be completed by the end of the day on May 1st. I will likely not be able to infer phylogenies for each of these gene alignments before this project is to be graded. 

The biggest obstacles faced during this project were related to obtaining, processing, and assembling the transcriptome data necessary for analyses. Specifically, identifying which data was appropriate / of sufficient quality for this project was challenging. Furthermore, during the last part of the transcriptome processing (identification of ORFs) I ran into several problems running Transdecoder within the Yang & Smith 2014 pipeline which took time to troubleshoot. Finally, I struggled with creating the custom database I needed for using BLAST+ to identify MHC genes. 

Future work will add additional transcritpomic data from 11 notothenioid species (some of which are already included in this study) to this dataset. In addition to identifying and infering phylogenetic relationships of MHC genes, I will also estimate relative rates of evoltuion for sequences identified as highly divergent or as relatively conserved. The focus of this more developed study will be on comparing the presence and diversity of genes in Antarctic notothenioids to other non-Antarctic teleosts to get a sense of how adaptaion to extreme cold may have impacted evolution of immune response.

Additionally, future studies will focus on identifying and investigating evolution of other immune-related genes (such as TLRs, DICPs, and NITRs) and will also compare patterns of immune gene evolution between Antarctic notothenioids and secondarily non-Antarctic notothenioids that have diversified in temperate waters around southern South America, and thus are likely subject to selective pressured associated with an entirely different community of pathogens. 


## References

Chen, Zuozhou, C-H. Christina Cheng, Junfang Zhang, Lixue Cao, Lei Chen, Longhai Zhou, Yudong Jin et al. "Transcriptomic and genomic evolution under constant cold in Antarctic notothenioid fish." Proceedings of the National Academy of Sciences 105, no. 35 (2008): 12944-12949.

Kim, Bo-Mi, Angel Amores, Seunghyun Kang, Do-Hwan Ahn, Jin-Hyoung Kim, Il-Chan Kim, Jun Hyuck Lee et al. "Antarctic blackfin icefish genome reveals adaptations to extreme environments." Nature ecology & evolution 3, no. 3 (2019): 469.

Malmstrøm, Martin, Michael Matschiner, Ole K. Tørresen, Bastiaan Star, Lars G. Snipen, Thomas F. Hansen, Helle T. Baalsrud et al. "Evolution of the immune system influences speciation rates in teleost fishes." Nature Genetics 48, no. 10 (2016): 1204.
