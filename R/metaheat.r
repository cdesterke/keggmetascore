#' @title metaheat

#' @param results results obtained from metagenescore function or sub-geneset
#' @param pheno phenotype file from tested samples
#' @param scale method of scaling "none" "row" "column"
#' @param fontsize size of the font on the graph
#' @usage data(gene_data)
#' @usage data(symbol)
#' @usage data(pheno)
#' @usage res<-metagenescore(gene_data,symbol,method="zscore")
#' @usage metaheat(res,pheno,scale="none",fontsize=10)
#' @examples data(gene_data)
#' @examples data(symbol)
#' @examples data(pheno)
#' @examples res<-metagenescore(gene_data,symbol,method="zscore")
#' @examples metaheat(res,pheno,scale="none",fontsize=10)



metaheat<-function(results,pheno,scale="none",fontsize=10){
  if(!require(pheatmap)){install.packages("pheatmap")}
  library(pheatmap)

  pheatmap(results,method="ward.D2",scale=scale, clustering_distance_cols = "euclidean",annotation=pheno,
           clustering_distance_rows = "euclidean",cluster_cols=FALSE,show_colnames=F, fontsize = fontsize,
           color = colorRampPalette(c("gold", "white", "orchid"))(50))
}



