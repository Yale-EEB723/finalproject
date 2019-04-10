# Final Project

## Instructions

This repository is a stub for your final project. Fork it as a template for your project, and develop your code in the forked repository. After you fork the repository, please enable the issue tracker in the repository settings so that others in the class (including the professor) can provide feedback. To submit the project, send a pull request to the original repository.

Expand on the readme questions below to provide an overview of the goals, background, and challenges for the final project. You can delete the questions as you write text that answers them, or leave the prompts in place. You can also delete this instruction section of you like.

Add all code to your project repository, including shell scripts, R analyses, python, etc.

Do not commit large data files to the repository. Provide paths to where they can be downloaded if they
are from public sources, or track them with [git-lfs](https://git-lfs.github.com).

## Introduction

This is a final project for the [Comparative Genomics](https://github.com/Yale-EEB723/syllabus) seminar in the spring of 2019. 
The aim of this project is to begin the annotation process of a genome for the marine fish in order to ultimately be able to map ddRAD loci onto the genome to identify loci under selection and determine their position in the genome relative to annotated gene regions. This will hopefully give us a functional genomic perspective on genetic differences between populations of this fish species in the Indo-Pacific.

## The goal

The specific problem I seek to explore was annotating a genome of the Bluefin Trevally (Caranx melampygus).

## The data

The data are unpublished and are the result of a collaboration between myself and Dr. John Kauwe and his PhD candidate, Brandon Hassett, at Brigham Young University.
The method used to sequence the genome was PacBio, using a Sequel machine. It generated 52.7 gigabases of sequence data across 10 SMRT cells.
The raw PacBio reads assembled using the "self-correction" procedure in Canu.
The estimated genome size was 782.4 Mb and the assembly size is 711 Mb.
The N50 value is 1.4 Mb, and the NG50 value is 1.18 Mb.
I have received the output of the Canu assembly in the form of a fastq file.

I do not have any transcriptome or proteome data for C. melampygus (yet) so I will be trying this assembly 'ab initio' just to get a hang of the program. 

## Background

The motivation behind this project is to use the bluefin genome as a reference upon which to map ddRAD data. 
I have ddRAD data for Bluefins across their Indo-Pacific range, and have been using de novo assembly methods to examine population structure.
I am particularly interested in identifying loci that are under selection and examining their function.
In the future, I am also interested in examining hybridization between bluefin trevallies and a close relative, the Giant Trevally. We are also sequencing a Giant Trevally genome.
I would like to learn the basic skills and understanding of genome annotation so that I can apply the same methods to the Giant Trevally.

Challenges as of 2/20/2019: 
I would like to explore heterozygosity in this dataset but am unsure how to start doing that.

Challenges as of 4/4/2019
It seems like transcriptome data are not available, so I will need to assemble the genome ab initio.

Updates:
4/09/2019: Began mapping ddRAD data to genome in demultiplex stage  using ipyrad

4/10/2019: Having issues installing MAKER and all of its dependencies onto my Farnam account. Emailed Ben Evans for help.

## Methods



## Results


## Assessment

Was it successful in achieving the initial goal?

What are the main obstacles encountered?

#1. Installing the software and all its dependencies

What would you have done differently?

What are future directions this could go in?

## References
Maker Tutorials:
MAKER GMOD: http://gmod.org/wiki/MAKER_Tutorial
Deren Card: https://gist.github.com/darencard/bb1001ac1532dd4225b030cf0cd61ce2
Ian Gilman: https://github.com/isgilman/finalproject/wiki/Step-by-step-genome-annotation-for-Portulaca-amilis


