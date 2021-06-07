
#NAME <- 'H3K9me3_SK-N-SH.ENCFF231PXT.hg19'
NAME <- 'H3K9me3_SK-N-SH.ENCFF231PXT.hg38'
#NAME <- 'H3K9me3_SK-N-SH.ENCFF051ZKJ.hg19'
#NAME <- 'H3K9me3_SK-N-SH.ENCFF051ZKJ.hg38'
OUT_DIR <- 'Results/'

###

bed_df <- read.delim(paste0('data/', NAME, '.bed'), as.is = TRUE, header = FALSE)
colnames(bed_df) <- c('chrom', 'start', 'end', 'name', 'score')
bed_df$len <- bed_df$end - bed_df$start
head(bed_df)

bed_df <- bed_df %>%
  arrange(-len) %>%
  filter(len < 8000)

ggplot(bed_df) +
  aes(x = len) +
  geom_histogram() +
  ggtitle(NAME, subtitle = sprintf('Number of peaks = %s', nrow(bed_df))) +
  theme_bw()
ggsave(paste0('len_hist.', NAME, '.filtered.pdf'), path = OUT_DIR)

bed_df %>%
  select(-len) %>%
  write.table(file='data/H3K9me3_SK-N-SH.ENCFF231PXT.hg38.filtered.bed',
              col.names = FALSE, row.names = FALSE, sep = '\t', quote = FALSE)


