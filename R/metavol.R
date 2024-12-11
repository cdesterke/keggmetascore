#' @title metavol

#' @param res results obtained from metades function
#' @param label font size for geneset labels
#' @param font font size for titles
#' @param title title description
#' @usage data(gene_data)
#' @usage data(symbol)
#' @usage data(pheno)
#' @usage res<-metagenescore(gene_data,symbol,method="zscore")
#' @usage metades_results<-metades(res,pheno$group,control="Non_Tumor")
#' @usage metavol(metades_results,label=3.5,font=12,title="KEGG metabolism")
#' @examples data(gene_data)
#' @examples data(symbol)
#' @examples data(pheno)
#' @examples res<-metagenescore(gene_data,symbol,method="zscore")
#' @examples metades_results<-metades(res,pheno$group,control="Non_Tumor")
#' @examples metavol(metades_results,label=3.5,font=12,title="KEGG metabolism")




metavol<-function(res,label=3.5,font=14,title="KEGG metabolism"){
library(ggplot2)
library(ggrepel)
  if(!require(ggplot2)){install.packages("ggplot2")}
  library(ggplot2)

  if(!require(ggrepel)){install.packages("ggrepel")}
  library(ggrepel)

res$label<-row.names(res)
ggplot(res, aes(x = logFC, y = -log10(P.Value),size=-log10(P.Value)+abs(logFC)/2)) +
	geom_point(aes(color = P.Value < 0.05), alpha = 1) +
	scale_color_manual(values = c("gold", "tomato")) +
	geom_text_repel(aes(label = ifelse(P.Value < 0.05, label, "")), size = label, box.padding = 0.3, point.padding = 0.3, segment.color = 'grey50') +
 	theme_minimal(base_size=font) + labs(title = title, x = "Log Fold Change", y = "-Log10 P-Value") +
	geom_vline(xintercept = 0, linetype = "dashed", color = "steelblue",size=1) +
 	theme(legend.position = "none")

}

