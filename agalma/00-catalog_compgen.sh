#!/bin/bash
#SBATCH --partition=day
#SBATCH --job-name=agalma_job
#SBATCH -c 1
#SBATCH --mem-per-cpu=6G
#SBATCH --time=0-02:00:00
#SBATCH --mail-type=ALL

export AGALMA_DB="./homologs.sqlite"

source activate agalma

set -e



agalma catalog insert -p ../processed_data/data_for_processing/nonbilaterian_processed/amphimedon_processed/Amphimedon_proteins.fasta -s 'Amphimedon queenslandica' -n '400682' -t 'mix of adult, juvenile, larval' -q 'Illumina HiSeq 2000' --note 'Sebe-Pedros et al. 2018 (10.1038/s41559-018-0575-6)' -b 'transcriptome' --sample_prep 'TRIzol|paired end' --id 'Amphimedon_a044ef3'
agalma catalog insert -p ../processed_data/data_for_processing/salpingoeca_processed/Salpingoeca.fasta -s 'Salpingoeca rosetta' -n '946362'  -t 'generic sample from Salpingoeca sp. ATCC 50818' -q 'Illumina Genome Analyzer II' --note 'Fairclough et al. 2013 (10.1186/gb-2013-14-2-r15)' -b 'transcriptome' --sample_prep 'Strand specific dUTP Illumina RNA-seq libraries' --id 'Salpingoeca_79a80c9'
agalma catalog insert -p ../processed_data/data_for_processing/capsaspora_processed/Capsaspora.fasta -s 'Capsaspora owczarzaki' -d '192875' -t 'mix of aggregative, filopodial, and cystic stages' -q 'Illumina HiSeq 2000' --note 'Sebe-Pedros et al. 2013 (10.7554/eLife.01287.001)' -b 'transcriptome' --sample_prep 'TRIzol' --id 'Capsaspora_03ba031'
agalma catalog insert -p ../processed_data/data_for_processing/creolimax_processed/Creolimax.fasta -s 'Creolimax fragrantissima' -n '470921' -t 'mix of amoeboid and multinucleate coenocytic cyst stages' -q 'Illumina HiSeq 2000' --note 'de Mendoza et al. (2015) (10.7554/eLife.08904.001)' -b 'transcriptome' --sample_prep 'Trizol|TruSeq Stranded mRNA Sample Prep kit' --id 'Creolimax_9fec24f'
agalma catalog insert -p ../processed_data/data_for_processing/nonbilaterian_processed/mnmeiopsis_processed/Mnemiopsis_proteins.fasta -s 'Mnemiopsis leidyi' -n '27923' -d '53917' -t 'mixed stage embryos' -q 'Illumina GA-II' --note 'Sebe-Pedros et al. 2018 (10.1038/s41559-018-0575-6). File provided by Sebe-Pedros et al. 2018 (10.1038/s41559-018-0575-6); identifiers match Ryan et al. 2013, 10.1126/science.1242592' -b 'transcriptome' --id 'Mnemiopsis_ad40ba8'
agalma catalog insert -p ../processed_data/data_for_processing/nonbilaterian_processed/nematostella_processed/Nematostella_proteins.fasta -s 'Nematostella vectensis' -n '45351' -d '52498' --note 'Sebe-Pedros et al. 2018 (10.1016/j.cell.2018.05.019). File provided by Sebe-Pedros et al. 2018, cannot find origin of sequences' -b 'transcriptome' --id 'Nematostella_3f17ce6'
agalma catalog insert -p ../processed_data/data_for_processing/nonbilaterian_processed/trichoplax_processed/Trichoplax_proteins.fasta -s 'Trichoplax adhaerens' -n '10228' -d '696105' --note 'Sebe-Pedros et al. 2018 (10.1038/s41559-018-0575-6). File provided by Sebe-Pedros et al. 2018 (10.1038/s41559-018-0575-6), cannot find origin of sequences' -b 'transcriptome' --id 'Trichoplax_b1e0576'
agalma catalog insert -p ../processed_data/data_for_processing/schmidtea_fincher_processed/Schmidtea.fasta -s 'Schmidtea mediterranea' -n '79327' -d '1042936' --note 'Fincher et al. 2018 (10.1126/science.aaq1736). Cannot find paper transcriptome originates from. Citations point to Liu et al. 2013 (10.1038/nature12414) but their transcriptome is of Dendrocoelum lacteum' -b 'transcriptome' --id 'Schmidtea_b64b58d'
