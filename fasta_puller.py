#! /usr/bin/env python
import sys
import re

#def
identity = 0.0
Namefile = []
keep = False

#pull fasta sequences from transcriptome file:

#open the file with list of sequence names 
#put each name into the list Namefile
File = sys.argv[1]
File = open(File, 'rU')
for Line in File:
	Line = Line.strip('\n')
	Namefile.append(Line)
File.close()

#open the transcriptome file from which sequences are to be pulled from
#since names must match exactly, if you have >TR_blah_blah|cblah_gblah_iblah as name only must alter fastsa names to match 

File = sys.argv[2]
File = open(File, 'rU')
for Line in File:
	Line = Line.strip('\n')
	
	if Line[0]==">":				#for name lines
		keep = False
		for Name in Namefile:
			if Name == Line:
				print Name
				keep = True
				#Namefile.remove(Name)	#hash out if working with gene names only, but want to keep multiple isoforms
	if Line[0] != ">":				#for non-name, ATCG lines
		if keep == True:
			print Line

