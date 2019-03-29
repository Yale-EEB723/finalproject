#!/usr/bin/env python

#++++++++++++++++++++++++++++++ GFF line fixer +++++++++++++++++++++++++++++
#
# The .gff output by MAKER looks like
# ##gff-version 3
# Scaffold_27%3BHRSCAF%3D30    .    contig    1    3334    .    .    .    ID=Scaffold_27%3BHRSCAF%3D30;Name=Scaffold_27%3BHRSCAF%3D30
# ###
# Scaffold_27%3BHRSCAF%3D30    repeat_gff:repeatmasker    match    12    199    1173    -    .    ID=Scaffold_27%3BHRSCAF%3D30:hit:39:1.3.0.0;Name=342270;Target=342270 69 250 +
# 
# which has scaffold identifies that do not match the headers from fasta portion:
# 
# >Scaffold_402;HRSCAF=467
# CGTGGATGCACCACCTTTTAAATTATGATCAAGTAGCAAACTTCAATTGGGCATCGGCTA...
# >Scaffold_1436;HRSCAF=1659
# ATCACCATGAGTGTAAATGCCTTATGGGAAGATCACGATGAAGAGGTTCTAGAGATCAGC...
# 
# This script does a little regex little regex work to convert something like Scaffold_27%3BHRSCAF%3D30 
# to Scaffold_27;HRSCAF=30 and see if this solves downstream problems.
#
#                                                                  29 March 2018
#                                                                     Ian Gilman

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
import re
try: from optparse import OptionParser
except ImportError:
    print "\n\tError: OptionParser (optparse) is not installed/loaded"
    sys.exit()
try: from tqdm import tqdm
except ImportError:
    print "\n\tError: tqdm is not installed/loaded."
    print "\n\tTo install, try 'pip install tqdm' or 'conda install -c conda-forge tqdm'"
    sys.exit()
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
def gff_line_fixer(line):
    return re.sub(pattern=r"(Scaffold_[\d]+)%3BHRSCAF%3D([\d]+)", repl=r"\1;HRSCAF=\2", string=line)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
def main():

    print('\n~~~~~~ GFF line fixer ~~~~~~\n')

    parser = OptionParser(prog="gff_line_fixer", usage="%prog [options]", version="%prog 1.0")
    parser.add_option("-g", "--gff",
                      action="store",
                      dest="broken_gff",
                      help="path to broken gff file")
    parser.add_option("-o", "--output",
                      action="store",
                      dest="output",
                      help="path to new output file (default is to print to <input>.fixed.gff")

    (options, args) = parser.parse_args()

    if not all((options.broken_gff)):
        print "\n\tMust specify gff with --broken_gff.\n"

    if options.output:
         outfile = options.output
    else:
        k = options.broken_gff.rfind(".gff")
        outfile = options.broken_gff[:k]+".fixed.gff"

    with open(options.broken_gff, "r") as b:
        brokenlines = b.readlines()
        fixedlines = []
        for line in tqdm(iterable=brokenlines, desc="Fixing gff lines"):
            fixedlines.append(gff_line_fixer(line))
        with open(outfile, "w+") as o:
            o.writelines(fixedlines)

#+------------------------------------------------------------------------
if __name__ == "__main__":
    main()