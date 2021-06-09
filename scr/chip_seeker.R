library(ggplot2)
library(dplyr)
library(tidyr)  
library(tibble) 


install.packages("BiocManager")
BiocManager::install("TxDb.Hsapiens.UCSC.hg19.knownGene", force = TRUE)
BiocManager::install("ChIPseeker")
BiocManager::install("clusterProfiler")
BiocManager::install("org.Hs.eg.db")
library(org.Hs.eg.db)
library(ChIPseeker)
library(TxDb.Hsapiens.UCSC.hg19.knownGene)
library(clusterProfiler)

###

NAME <- 'H3K9me3_SK-N-SH_intersect_DeepZ'
#NAME <- 'DeepZ'
#NAME <- 'H3K9me3_SK-N-SH.ENCFF051ZKJ.hg19.filtered'
#NAME <- 'H3K9me3_SK-N-SH.ENCFF231PXT.hg19.filtered'
BED_FN <- paste0('data/', NAME, '.bed')

###

txdb <- TxDb.Hsapiens.UCSC.hg19.knownGene

peakAnno <- annotatePeak(BED_FN, tssRegion=c(-3000, 3000), TxDb=txdb, annoDb="org.Hs.eg.db")

#pdf(paste0('Results/', 'chip_seeker.', NAME, '.plotAnnoPie.pdf'))
png(paste0('Results/', 'chip_seeker.', NAME, '.plotAnnoPie.png'))
plotAnnoPie(peakAnno)
dev.off()

# peak <- readPeakFile(BED_FN)
# pdf(paste0(OUT_DIR, 'chip_seeker.', NAME, '.covplot.pdf'))
# covplot(peak, weightCol="V5")
# dev.off()
# 