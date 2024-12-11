#' @title metagenescore

#' @param data transcriptome matrix
#' @param symbol kegg metabolism genesets by gene symbols
#' @param method GSVA method of enrichment: "gsva", "ssgsea", "zscore", "plage"
#' @usage data(gene_data)
#' @usage data(pheno)
#' @usage data(symbol)
#' @usage res<-metagenescore(gene_data,symbol,method="zscore")
#' @usage head(res[,1:6])
#' @examples data(gene_data)
#' @examples data(pheno)
#' @examples data(symbol)
#' @examples res<-metagenescore(gene_data,symbol,method="zscore")
#' @examples head(res[,1:6])


metagenescore<-function(gene_data,symbol,method="zscore"){
 if(!require(GSVA))
   {if (!require("BiocManager", quietly = TRUE))
   install.packages("BiocManager")
   BiocManager::install("GSVA")}
  library(GSVA)
  
  data<-as.matrix(gene_data)

  if(method=="zscore"){
  param<-zscoreParam(data,symbol)
  results<-gsva(param)
  results<-as.data.frame(results)
  return(results)
  }
  else if(method=="gsva"){
  param<-gsvaParam(data,symbol)
  results<-gsva(param)
  results<-as.data.frame(results)
  return(results)
  }

  else if(method=="ssgsea"){
  param<-ssgseaParam(data,symbol)
  results<-gsva(param)
  results<-as.data.frame(results)
  return(results)
  }

  else if(method=="plage"){
  param<-plageParam(data,symbol)
  results<-gsva(param)
  results<-as.data.frame(results)
  return(results)
  }

  else{
  print("Input method is wrong ! (gsva, ssgsea, plage or zscore)")
  }

}



