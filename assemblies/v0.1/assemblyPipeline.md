# Etheostoma perlongum genome assebly
*v0.1*

Running genome assembly with data from two Nanopore flow cells

Excluding reads < 1 kb

## pipeline

combine fastq files

`cat ~/scratch60/Eper_genome/nanoporeData/Eper_*/*/*/fastq_pass/*.fastq > Eper_nanopore.fastq`

convert fastq to fasta (we don't actually need to do this)

`paste - - - - < Eper_nanopore.fastq | cut -f 1,2 | sed 's/^@/>/' | tr "\t" "\n" > Eper_nanopore.fasta`

remove reads < 1kb

`bioawk -c fastx 'length($seq) > 1000{print "@"$name"\n"$seq"\n+\n"$qual}' Eper_nanopore.fastq > Eper_nanopore_1kb.fastq`

run minimap2 to map each read against all other reads

`minimap2 -x ava-ont -t 20 Eper_nanopore_1kb.fastq Eper_nanopore_1kb.fastq > Eper_nanopore_1kb_ovlp.paf 2> minimap.log`

run miniasm to assmble the reads using the mapping from previous step

`miniasm -f Eper_nanopore_1kb.fastq Eper_nanopore_1kb_ovlp.paf > Eper_nanopore_1kb.gfa 2> miniasm.log`

convert gfa file from miniasm to fasta format

`awk '/^S/{print ">"$2"\n"$3}' Eper_nanopore_1kb.gfa | fold > Eper_nanopore_1kb.gfa.fasta`

run minimap2 again to map reads to the assembled contigs

` minimap2 -x ava-ont -t 10 Eper_nanopore_1kb.gfa.fasta Eper_nanopore_1kb.fastq > Eper_nanopore_1kb_ovlp_genome.paf 2> minimap_genome.log`

run racon to polish the assembly and create consensus sequences

`racon -t 10 Eper_nanopore_1kb.fastq Eper_nanopore_1kb_ovlp_genome.paf Eper_nanopore_1kb.gfa.fasta > Eper_nanopore_1kb.racon.fasta`
