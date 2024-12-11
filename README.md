# keggmetascore


### package installation
```r
library(devtools)
install_github("cdesterke/keggmetascore")
```
### description
R-package to perform single-sample scores of metabolism based on 41 genesets from KEGG database.




### kegg-metabolism scoring of a human transcriptome matrix annotated with gene symbols and based on GSVA algorithm: function "metagenescore"
```r
library(keggmetascore)
data(gene_data)
data(symbol)
res<-metagenescore(gene_data,symbol,method="ssgsea")
```
![res](https://github.com/cdesterke/keggmetascore/blob/main/metagenescore.png)



### kegg-metabolism scoring of a human transcriptome matrix annotated with Ensembl IDENTIFIERS and based on GSVA algorithm: function "metaensemblscore"
```r
library(keggmetascore)
data(ensembl_data)
data(ensembl)
res<-metaensemblscore(ensembl_data,ensembl,method="zscore")
```
![res](https://github.com/cdesterke/keggmetascore/blob/main/ensemblscore.png)

### heatmap of metabolism score results: function "metaheat"
```r
library(keggmetascore)
data(gene_data)
data(symbol)
data(pheno)
res<-metagenescore(gene_data,symbol,method="ssgsea")
metaheat(res,pheno,scale="none",fontsize=10)
```
![res](https://github.com/cdesterke/keggmetascore/blob/main/metaheat.png)

### differential expressed genesets: function "metades"

```r
library(keggmetascore)
data(gene_data)
data(symbol)
data(pheno)
res<-metagenescore(gene_data,symbol,method="ssgsea")
metades_results<-metades(res,pheno$group,control="Non_Tumor")
metades_results
```
![res](https://github.com/cdesterke/keggmetascore/blob/main/metades.png)

