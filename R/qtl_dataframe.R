#' Concatenate data tables on genotypes and phenotypes into a format compatible with R/qtl.
#' 
#' Match datatables for phenotypes and genotypes for a set of lines, and combine these into a 
#' single dataframe that r/qtl can read.
#' 
#' @param phenotypes A table of phenotype data.
#' @param genotypes A table of genotype data, including marker information in the first two rows.
#' @param phenotype_id_column The column in \code{phenotype} indicating line names.
#' @param genotype_id_column The column in \code{genotype} indicating line names to match up with
#' those for the phenotype table.
#' 
#' @return # a dataframe of the format for importing into R/qtl.
#' 
#' @export
qtl_dataframe <- function(phenotypes, genotypes, phenotype_id_column=1, genotype_id_column=1){
  if(any(rowSums(is.na(phenotypes[,-phenotype_id_column])) == ncol(phenotypes)-1)){
    warning("One or more rows in phenotype data is all NA. These will be removed.")
    phenotypes <- phenotypes[rowSums(is.na(phenotypes[,-phenotype_id_column])) < ncol(phenotypes)-1,]
  }
  
  if(any(is.na(phenotypes[phenotype_id_column]))){
    warning("One or more labels in phenotype data is NA. These will be removed. ")
    phenotypes <- phenotypes[!is.na(phenotypes[phenotype_id_column]),]
  }
  # add two blank rows of NAs at the top of the phenotype data 
  new_phenotypes                          <- as.data.frame(matrix(NA, nrow(phenotypes) + 2, ncol(phenotypes))) # blank matrix
  new_phenotypes[3:nrow(new_phenotypes),] <- phenotypes # insert data two rows down
  colnames(new_phenotypes)                <- colnames(phenotypes) # reassign column names
  
  # pull out the matching genotypes
  new_genotypes <- genotypes[match(phenotypes[,phenotype_id_column],
                                   genotypes[ ,genotype_id_column ]),] # genotype for each phenotype
  new_genotypes <- rbind(genotypes[1:2,], new_genotypes) # add back in the chromosome number and genetic map
  new_genotypes <- new_genotypes[,-1] # remove column with genotype IDs
  
  # add whitespace to the first two rows of the phenotype columns so that r/qtl can read it.
  qtl_matrix <- cbind(new_phenotypes, new_genotypes)
  qtl_matrix[1:2, 1:ncol(phenotypes)] <- ""
  
  return(qtl_matrix)
}