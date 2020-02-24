# circlize circos plot
# see: https://jokergoo.github.io/circlize_book/book/
#install.packages("circlize")
require(circlize)
library(stringr)
library(readr)

## Introduction ##
#generate some random data
set.seed(999)
n = 1000
df = data.frame(factors = sample(letters[1:8], n, replace = TRUE), x = rnorm(n), y = runif(n))

# Set track height and initialize plot. The circle used by circlize always has a radius of 1, 
# so a height of 0.1 means 10% of the circle radius.
circos.par("track.height" = 0.1)
# When we initialize the plot, the "factors" will correspond to the sectors and must be categorical
circos.initialize(factors = df$factors, x = df$x)
# Add track
circos.track(factors = df$factors, y = df$y,
             panel.fun = function(x, y) {
               circos.text(CELL_META$xcenter, CELL_META$cell.ylim[2] + uy(5, "mm"), 
                           CELL_META$sector.index)
               circos.axis(labels.cex = 0.6)
             })
col = rep(c("#FF0000", "#00FF00"), 4)
circos.trackPoints(df$factors, df$x, df$y, col = col, pch = 16, cex = 0.5)
circos.text(-1, 0.5, "foo", sector.index = "b", track.index = 1)

bgcol = rep(c("#EFEFEF", "#CCCCCC"), 4)
circos.trackHist(df$factors, df$x, bin.size = 0.2, bg.col = bgcol, col = NA)

circos.track(factors = df$factors, x = df$x, y = df$y,
             panel.fun = function(x, y) {
               ind = sample(length(x), 10)
               x2 = x[ind]
               y2 = y[ind]
               od = order(x2)
               circos.lines(x2[od], y2[od])
             })

# We can update regions (instead of having to plot everything again). This erases
# the current graphics of the in the region of interest and rewrites them
circos.update(sector.index = "d", track.index = 2, 
              bg.col = "#FF8080", bg.border = "red")
circos.points(x = -2:2, y = rep(0.5, 5), col = "white")
circos.text(CELL_META$xcenter, CELL_META$ycenter, "updated", col = "white")

# Add a heatmap-style track
circos.track(ylim = c(0, 1), panel.fun = function(x, y) {
  xlim = CELL_META$xlim
  ylim = CELL_META$ylim
  breaks = seq(xlim[1], xlim[2], by = 0.1)
  n_breaks = length(breaks)
  circos.rect(breaks[-n_breaks], rep(ylim[1], n_breaks - 1),
              breaks[-1], rep(ylim[2], n_breaks - 1),
              col = rand_color(n_breaks), border = NA)
})

# Add inside links
circos.link("a", 0, "b", 0, h = 0.4)
circos.link("c", c(-0.5, 0.5), "d", c(-0.5,0.5), col = "red",
            border = "blue", h = 0.2)
circos.link("e", 0, "g", c(-1,1), col = "green", border = "black", lwd = 2, lty = 2)
circos.link(sector.index1 = "c", point1 = c(-2,2), sector.index2 = "f", point2 = c(-3,3), col="purple")

# Clear everything for new plot
circos.clear()

## Applications in genomics ##
# Generate random BED file
set.seed(999)
bed = generateRandomBed()
head(bed)

# Initialize human data
circos.initializeWithIdeogram()
text(0, 0, "default", cex = 1)
circos.info()

# Custom chromosomes
cytoband.df = read.table(file = "./Portulaca_karyotype.txt", 
                         colClasses = c("character", "numeric", "numeric"), 
                         sep = "\t", header = TRUE)
circos.initializeWithIdeogram(cytoband = cytoband.df)

# Give scaffolds random colors
circos.track(ylim = c(0, 1), panel.fun = function(x, y) {
  chr = CELL_META$sector.index
  xlim = CELL_META$xlim
  ylim = CELL_META$ylim
  circos.rect(xlim[1], 0, xlim[2], 1, col = rand_color(1))
  circos.text(mean(xlim), mean(ylim), chr, cex = 0.7, col = "white",
              facing = "inside", niceFacing = TRUE)
}, track.height = 0.15, bg.border = NA)
circos.clear()

rgb2hex <- function(r,g,b) sprintf('#%s',paste(as.hexmode(c(r,g,b)),collapse = ''))

circos.clear()
portulaca_bed = portulaca_1MB_density
portulaca_bed$value = as.numeric(portulaca_bed$value)
circos.initializeWithIdeogram(cytoband = cytoband.df)
col_genes = colorRamp2(c(0, 100, 200), c(rgb2hex(247, 228, 28), rgb2hex(30, 127, 121), rgb2hex(52,0,72)))
col_repeats = colorRamp2(c(0, 1500, 3000), c(rgb2hex(247, 228, 28), rgb2hex(30, 127, 121), rgb2hex(52,0,72)))
circos.genomicHeatmap(portulaca_bed[1:4], col = col_genes, side = "inside", border = "white", 
                      connection_height = 1e-10, line_col = "white", line_lwd = 1e-10,)
circos.genomicHeatmap(portulaca_bed[c(1:3,5)], col = col_repeats, side = "inside", border = "white", 
                      connection_height = 1e-10, line_col = "white", line_lwd = 1e-10,)

circos.initializeWithIdeogram()
bed = generateRandomBed(nr = 100, nc = 4)
col_fun = colorRamp2(c(-1, 0, 1), c("green", "white", "red"))
circos.genomicHeatmap(bed, col = col_fun, side = "inside", border = "white", connection_height = 0.0)




