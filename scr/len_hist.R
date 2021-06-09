library(ggplot2)
library(dplyr)
library(tidyr)   
library(tibble)  

###

#NAME <- 'H3K9me3_SK-N-SH.ENCFF231PXT.hg19'
#NAME <- 'H3K9me3_SK-N-SH.ENCFF231PXT.hg38'
#NAME <- 'H3K9me3_SK-N-SH.ENCFF051ZKJ.hg19'
#NAME <- 'H3K9me3_SK-N-SH.ENCFF051ZKJ.hg38'
#NAME <- 'DeepZ'
NAME <- 'H3K9me3_SK-N-SH_intersect_DeepZ'
OUT_DIR <- 'Results/'

###

bed_df <- read.delim(paste0('data/', NAME, '.bed'), as.is = TRUE, header = FALSE)
#colnames(bed_df) <- c('chrom', 'start', 'end', 'name', 'score')
colnames(bed_df) <- c('chrom', 'start', 'end')
bed_df$len <- bed_df$end - bed_df$start
head(bed_df)

#hist(bed_df$len)

ggplot(bed_df) +
  aes(x = len) +
  geom_histogram() +
  ggtitle(NAME, subtitle = sprintf('Number of peaks = %s', nrow(bed_df))) +
  theme_bw()
ggsave(paste0('len_hist.', NAME, '.png'), path = OUT_DIR)
