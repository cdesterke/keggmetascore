#' @title metades

#' @param group group column from phenotype file
#' @param control string defining control in pheno$group data
#' @usage data(gene_data)
#' @usage data(pheno)
#' @usage data(symbol)
#' @usage res<-metagenescore(gene_data,symbol,method="zscore")
#' @usage metades_results<-imdes(res,pheno$group,control="Non_Tumor")
#' @examples data(gene_data)
#' @examples data(pheno)
#' @examples data(symbol)
#' @examples res<-metagenescore(data,symbol,method="zscore")
#' @examples metades_results<-metades(res,pheno$group,control="Non_Tumor")
#' @examples head(metades_results)



metades<-function(res,group,control="Non_Tumor")
{
  if(!require(limma)){

    if (!requireNamespace("BiocManager", quietly = TRUE))
      install.packages("BiocManager")
    BiocManager::install("limma")}

  library(limma)

  # prepare design matrix
  levels <- relevel(as.factor(group),ref=control)
  design <- model.matrix(~levels)
  rownames(design) = colnames(res)

  # perform limma analysis
  tmp <- lmFit(res,design=design)
  fit <- eBayes(tmp)
  results = topTable(fit,number = nrow(res),coef=2)
  results
}
