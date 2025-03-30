#remove all variables from environment
rm(list = ls())

library(FPKMcalc)

reads <- c(gene1 = 350, gene2 = 400, gene3 = 600)
genes <- c(gene1 = 2500, gene2 = 3300, gene3 = 1250)
total_reads <- 10000000


fpkm_calc(reads, genes, total_reads)


?fpkm_calc

