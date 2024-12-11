#' @title metaensemblscore

#' @param data transcriptome matrix annotated with ensembl identifiers
#' @param ensembl metabolism modulation genesets by ensembl identifiers
#' @param method GSVA method of enrichment: "gsva", "ssgsea", "zscore", "plage"
#' @usage data(ensembl_data)
#' @usage data(pheno)
#' @usage data(ensembl)
#' @usage res<-metaensemblscore(ensembl_data,ensembl,method="zscore")
#' @usage head(res[,1:6])
#' @examples data(ensembl_data)
#' @examples data(pheno)
#' @examples data(ensembl)
#' @examples res<-metaensemblscore(ensembl_data,ensembl,method="zscore")
#' @examples head(res[,1:6])


metaensemblscore<-function(ensembl_data,ensembl,method="zscore"){
 if(!require(GSVA))
   {if (!require("BiocManager", quietly = TRUE))
   install.packages("BiocManager")
   BiocManager::install("GSVA")}
  library(GSVA)
  
  data<-as.matrix(ensembl_data)

  if(method=="zscore"){
  param<-zscoreParam(data,ensembl)
  results<-gsva(param)
  results<-as.data.frame(results)
  return(results)
  }
  else if(method=="gsva"){
  param<-gsvaParam(data,ensembl)
  results<-gsva(param)
  results<-as.data.frame(results)
  return(results)
  }

  else if(method=="ssgsea"){
  param<-ssgseaParam(data,ensembl)
  results<-gsva(param)
  results<-as.data.frame(results)
  return(results)
  }

  else if(method=="plage"){
  param<-plageParam(data,ensembl)
  results<-gsva(param)
  results<-as.data.frame(results)
  return(results)
  }

  else{
  print("Input method is wrong ! (gsva, ssgsea, plage or zscore)")
  }

}



