#!
#Program is to take multiple .fast files and annotate them using a software package called Prokka aimed at annotating bacterial genomes
#Prokka references any personal annotations provided and then draws from databases such as SwissProt and UniProt to quicky annotate prokaryotic genomes

#Showing .fasta files that will be annotated
% ls *.fasta

#A loop that will take the .fasta files, creating a new directory based on the name (*.fasta) of the file and creating annotated files (such as .gbk) in that folder
for F in *.fasta; do
  N=$(basename $F .fasta) ;
  prokka --locustag $N --outdir $N --prefix $N  $F ;
done

#Show files that were used and folders created
% ls

#As of 04/05/2019, have done this for one strain of each: S. enterica Gallinarum, Enteritidis, Typhi, Typhimurium, and S. bongori
