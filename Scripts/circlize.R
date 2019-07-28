# circlize circos plot
# see: https://jokergoo.github.io/circlize_book/book/
#install.packages("circlize")
library(circlize)
library(stringr)

#generate some random data

set.seed(999)
n = 1000
df = data.frame(factors = sample(letters[1:8], n, replace = TRUE),
                x = rnorm(n), y = runif(n))
circos.par("track.height" = 0.1)
circos.initialize(factors = df$factors, x = df$x)

circos.track(factors = df$factors, y = df$y,
             panel.fun = function(x, y) {
               circos.text(CELL_META$xcenter, CELL_META$cell.ylim[2] + uy(5, "mm"), 
                           CELL_META$sector.index)
               circos.axis(labels.cex = 0.6)
             })
col = rep(c("#FF0000", "#00FF00"), 4)
circos.trackPoints(df$factors, df$x, df$y, col = col, pch = 16, cex = 0.5)
circos.text(-1, 0.5, "text", sector.index = "a", track.index = 1)


## read in bed file

bed = read_tsv("roughScaffolding_bedFile.bed")
bed <- as.data.frame(bed)
bed

bed2 = read_tsv("PGA_scaffolds.bed")
bed <-as.data.frame(bed2)


repeats = read_tsv("PGA_trim.fasta.out.bed",col_names=FALSE)
repeats <- as.data.frame(repeats)
head(repeats)

#initialize basic plot
circos.genomicInitialize(bed)

#initialize custom
circos.initializeWithIdeogram(plotType = NULL)
circos.track(ylim = c(0, 1), panel.fun = function(x, y) {
  chr = CELL_META$sector.index
  xlim = CELL_META$xlim
  ylim = CELL_META$ylim
  circos.rect(xlim[1], 0, xlim[2], 1, col = rand_color(1))
  #circos.text(mean(xlim), mean(ylim), chr, cex = 0.7, col = "white",
  #            facing = "inside", niceFacing = TRUE)
}, track.height = 0.15, bg.border = NA)

#circos.genomicTrack(repeats)


# circos.genomicTrackPlotRegion(repeats, numeric.column = c(2, 3), 
#                               panel.fun = function(region, value, ...) {
#                                 circos.genomicPoints(region, value, ...)
#                               })

# 
# circos.genomicTrackPlotRegion(repeats, numeric.column=c(2,3),
#                               panel.fun = function(region, value, ...) {
#   if(repeats[,10] == regex("(TA)n")) {
#     print(head(region, n = 2))
#     print(head(value, n = 2))
#   }
# })


head( str_extract(repeats[,10], ".Motif:(AAGTTG)n.") )

# filter out only rows of TA repeats
TA_rep <- filter(repeats, str_detect(repeats[,10],"\\(TA\\)n"))


head(TA_rep)

# plot

circos.genomicTrackPlotRegion(TA_rep, panel.fun = function(region, value, ...) {
  circos.genomicLines(region, value, ...)
})

#subsetting to types of repeats
TATA_rep <- filter(repeats, str_detect(repeats[,10],"\\(TATA\\)n"))
TATA_rep <- as.data.frame(TATA_rep)
Arich_rep <- filter(repeats, str_detect(repeats[,10],"A\\-rich"))
Arich_rep <- as.data.frame(Arich_rep)

  
  
  ## points
circos.genomicInitialize(bed)
circos.genomicTrackPlotRegion(TATA_rep, panel.fun = function(region, value, ...) {
  circos.genomicPoints(region, value, ...)
})

# h type lines
circos.genomicTrack(TATA_rep, 
                    panel.fun = function(region, value, ...) {
                      circos.genomicLines(region, value, type = "h")
                    })
#area type lines
circos.genomicTrack(TATA_rep, 
                    panel.fun = function(region, value, ...) {
                      circos.genomicLines(region, value, area = TRUE)
                    })

# finalizing a plot for TATA and A-rich
circos.genomicInitialize(bed)

circos.genomicTrack(TATA_rep, 
                    panel.fun = function(region, value, ...) {
                      circos.genomicLines(region, value, area = TRUE)
                    })

circos.genomicTrack(Arich_rep, 
                    panel.fun = function(region, value, ...) {
                      circos.genomicLines(region, value, area = TRUE)
                    })

## using the full output table

RepeatMaskerOut <- read_table2("PGA_trim.fasta.out")
head(RepeatMaskerOut)

masker <- select(RepeatMaskerOut,querySeq,begin,end,matchingRepeat,repeatClass)
head(masker)
write_csv(masker,"RepeatMaskerOut.csv")

## then removed tigs and PGA_ 

maskerEdit <- read_csv("RepeatMaskerOut.csv")
head(maskerEdit)
maskerEdit <- as.data.frame(maskerEdit)

## now plotting classess of repeats

LTR_Gypsy <- as.data.frame( filter(maskerEdit,str_detect(repeatClass,"LTR/Gypsy")) )
head(LTR_Gypsy)
str(LTR_Gypsy)

LINE_L2 <- as.data.frame( filter(maskerEdit,str_detect(repeatClass,"LINE/L2")) )
head(LINE_L2)  
str(LINE_L2)

Low_complexity <- as.data.frame( filter(maskerEdit,str_detect(repeatClass,"Low_complexity")) )

#initialize the plot
circos.genomicInitialize(bed)

#plotting density of LTR/Gypsy repeats and LINE_L2
circos.genomicDensity(LTR_Gypsy, col = c("#FF000080"), track.height = 0.1)
circos.genomicDensity(LINE_L2, col = c("#0000FF80"), track.height = 0.1)
circos.genomicDensity(Low_complexity, col = c("#00FF00"), track.height = 0.1)


## or a way to plot points along a single horizontal line
# circos.genomicTrack(LTR_Gypsy, stack = TRUE, 
#                     panel.fun = function(region, value, ...) {
#                       circos.genomicPoints(region, value, pch = 16, cex = 0.5,...)
#                       i = getI(...)
#                       circos.lines(CELL_META$cell.xlim, c(i, i), lty = 2, col = "#00000040")
#                     })


####
# making pie chart

blank_theme <- theme_minimal()+
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.border = element_blank(),
    panel.grid=element_blank(),
    axis.ticks = element_blank(),
    plot.title=element_text(size=14, face="bold")
  )

pie <- ggplot(maskerEdit, aes(x=factor(1), fill=repeatClass))+
  geom_bar(width = 1) +
  coord_polar("y") +
  guides(fill=guide_legend(title="Repeat Class")) +
  blank_theme


pie 

ggsave(plot = pie,filename = "repeat classes.pdf", device = pdf, width = 12, height = 6)

repeatOverview <- tibble (
  Class = c( "1) Non-repetitive", "3) LINEs", "6) LTR", "4) DNA", "2) Unclassified", "5) Simple", "7) Low complexity"),
  Percent = c( 33.9, 23.99, 1.42, 10.71, 25.21, 4.64, 0.13)
  )
repeatOverview



pie2 <- ggplot(repeatOverview, aes(x="", y=Percent, fill=Class))+
  geom_bar(width = 1, stat = "identity") +
  coord_polar("y") +
  guides(fill=guide_legend(title="Repeat Class")) +
  blank_theme +
  theme(axis.text.x=element_blank()) +
  scale_fill_brewer(palette="YlGnBu")


pie2

ggsave(plot = pie2, filename = "repeat overview.pdf", device = pdf, width = 10, height  = 6)
  


