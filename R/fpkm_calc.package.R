#remove all variables from environment
rm(list = ls())

# Restart R session (RStudio only)
.rs.restartR()

#load required libraries
install.packages("devtools")
library(devtools)
install.packages("shiny")
library(shiny)
install.packages("usethis")
library(usethis)
install.packages("roxygen2")
library(roxygen2)

#make the project a Git repo
use_git()


#' Calculate FPKM
#'
#' This function calculates the FPKM (Fragments Per Kilobase of transcript per Million mapped reads)
#' for each gene in RNA-seq data
#'
#' @param read_counts A numeric vector of read counts per gene
#' @param gene_lengths A numeric vector of gene lengths in base pairs
#' @param total_reads A numeric value representing the total number of mapped reads in the RNA-seq experiment
#'
#' @return A numeric vector of FPKM values, named by gene
#' @export
fpkm_calc <- function(read_counts, gene_lengths, total_reads) {
  if (length(read_counts) != length(gene_lengths)) {
    stop("read_counts and gene_lengths must be of the same length")
  }

  fpkm_values <- (read_counts * 1e9) / (gene_lengths * total_reads)
  names(fpkm_values) <- names(read_counts)
  return(fpkm_values)
}


#save the function in a .R file in the R/ subdirectory
use_r("fpkm_calc")
#ONLY the function definition is in this file
# -> difference between R package code writing and regular code



#call load_all() to make the function available for experimentation
devtools::load_all()



# test the function
read_counts <- c(gene1 = 100, gene2 = 200, gene3 = 150)
gene_lengths <- c(gene1 = 2000, gene2 = 1500, gene3 = 1200)
total_reads <- 10000000

fpkm_calc(read_counts, gene_lengths, total_reads)


#check that the function exists, but is not in global env
exists("FPKMcalc", where = globalenv(), inherits = FALSE)
#should return FALSE


#check the function -> in the console!!!!
devtools::check()

#preview help file
?fpkm_calc

#to configure valid license for the function:
use_mit_license()

#install the package
devtools::install()


# load the FPKMcalc package library
library(FPKMcalc)


