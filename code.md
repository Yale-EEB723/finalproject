##The data  
All genomes and gff3 files were downloaded from Ensembl.  

For genome statistics, chromosomal-level sequences were used. For synteny analysis, I used top-level assemblies (including unplaced scaffolds) since there is still a potential for these to cluster with distantly related sequences.  

## Methods
Load libraries:    

```{r preliminaries}
library( tidyverse )
library(ggplot2)
library(seqinr)
library(ape)
library(Biostrings)
library(dplyr)

#clustering
library(cluster)
library(CrossClustering)
library(vegan)
library(Rtsne)
```

### Genome Statistics  




-dont' use top-level assemblies - too much noise.