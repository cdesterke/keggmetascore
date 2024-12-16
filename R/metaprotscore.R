#' @title metaprotscore

#' @param data transcriptome matrix
#' @param swissprot kegg metabolism genesets by swissprot id
#' @param method GSVA method of enrichment: "gsva", "ssgsea", "zscore", "plage"
#' @usage data(swissprot_data)
#' @usage data(pheno)
#' @usage data(swissprot)
#' @usage res<-metaprotscore(swissprot_data,swissprot,method="zscore")
#' @usage head(res[,1:6])
#' @examples data(swissprot_data)
#' @examples data(pheno)
#' @examples data(swissprot)
#' @examples res<-metaprotscore(swissprot_data,swissprot,method="zscore")
#' @examples head(res[,1:6])


metaprotscore<-function(swissprot_data,swissprot,method="zscore"){
 if(!require(GSVA))
   {if (!require("BiocManager", quietly = TRUE))
   install.packages("BiocManager")
   BiocManager::install("GSVA")}
  library(GSVA)
  
  data<-as.matrix(swissprot_data)

  if(method=="zscore"){
  param<-zscoreParam(data,swissprot)
  results<-gsva(param)
  results<-as.data.frame(results)
  return(results)
  }
  else if(method=="gsva"){
  param<-gsvaParam(data,swissprot)
  results<-gsva(param)
  results<-as.data.frame(results)
  return(results)
  }

  else if(method=="ssgsea"){
  param<-ssgseaParam(data,swissprot)
  results<-gsva(param)
  results<-as.data.frame(results)
  return(results)
  }

  else if(method=="plage"){
  param<-plageParam(data,swissprot)
  results<-gsva(param)
  results<-as.data.frame(results)
  return(results)
  }

  else{
  print("Input method is wrong ! (gsva, ssgsea, plage or zscore)")
  }

}



