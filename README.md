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
```
![res](https://github.com/cdesterke/keggmetascore/blob/main/metagenescore.png)
