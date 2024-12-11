# keggmetascore


### package installation
```r
library(devtools)
install_github("cdesterke/keggmetascore")
```
### description
keggmetascore is a R-package performing single-sample scores of metabolism based on 41 genesets extracted from KEGG database. With python fonction 
metabolism geneset were extracted from human MSigDB database version.1.2024. From this metabolism extraction all gene symbol were converted in human Ensembl identifiers with the annotation: Ensembl_biomart122 on HG38. Based on GSVA R application the package allow single sample score computing on the 41 metabolism genesets starting from a transcriptome matrix annotated with gene symbols or ensembl identifiers. score could be visualized as heatmap. Differential genesets analysis between two sample groups could be perform and results could be visualized as volcanoplot.


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


### Volcanoplot: function "metavol"

```r
library(keggmetascore)
data(gene_data)
data(symbol)
data(pheno)
res<-metagenescore(gene_data,symbol,method="ssgsea")
metades_results<-metades(res,pheno$group,control="Non_Tumor")
metavol(metades_results,label=3.5,font=12,title="KEGG metabolism")
```
![res](https://github.com/cdesterke/keggmetascore/blob/main/volcano.png)


## REFERENCES

> H Ogata  1, S Goto, K Sato, W Fujibuchi, H Bono, M Kanehisa: KEGG: Kyoto Encyclopedia of Genes and Genomes, 
Nucleic Acids Res. 1999 Jan 1;27(1):29-34.doi: 10.1093/nar/27.1.29.

> Arthur Liberzon, Chet Birger, Helga Thorvaldsdóttir, Mahmoud Ghandi, Jill P Mesirov, Pablo Tamayo: The Molecular Signatures Database (MSigDB) hallmark gene set collection, Cell Syst. 2015 Dec 23;1(6):417-425. doi: 10.1016/j.cels.2015.12.004.

> Cunningham F, Allen JE, Allen J, Alvarez-Jarreta J, Amode MR, Armean IM, Austine-Orimoloye O, Azov AG, Barnes I, Bennett R, Berry A, Bhai J, Bignell A, Billis K, Boddu S, Brooks L, Charkhchi M, Cummins C, Da Rin Fioretto L, Davidson C, Dodiya K, Donaldson S, El Houdaigui B, El Naboulsi T, Fatima R, Giron CG, Genez T, Martinez JG, Guijarro-Clarke C, Gymer A, Hardy M, Hollis Z, Hourlier T, Hunt T, Juettemann T, Kaikala V, Kay M, Lavidas I, Le T, Lemos D, Marugán JC, Mohanan S, Mushtaq A, Naven M, Ogeh DN, Parker A, Parton A, Perry M, Piližota I, Prosovetskaia I, Sakthivel MP, Salam AIA, Schmitt BM, Schuilenburg H, Sheppard D, Pérez-Silva JG, Stark W, Steed E, Sutinen K, Sukumaran R, Sumathipala D, Suner MM, Szpak M, Thormann A, Tricomi FF, Urbina-Gómez D, Veidenberg A, Walsh TA, Walts B, Willhoft N, Winterbottom A, Wass E, Chakiachvili M, Flint B, Frankish A, Giorgetti S, Haggerty L, Hunt SE, IIsley GR, Loveland JE, Martin FJ, Moore B, Mudge JM, Muffato M, Perry E, Ruffier M, Tate J, Thybert D, Trevanion SJ, Dyer S, Harrison PW, Howe KL, Yates AD, Zerbino DR, Flicek P. Ensembl 2022. Nucleic Acids Res. 2022 Jan 7;50(D1):D988-D995. doi: 10.1093/nar/gkab1049. PMID: 34791404; PMCID: PMC8728283.

> Sonja Hänzelmann, Robert Castelo, Justin Guinney: GSVA: gene set variation analysis for microarray and RNA-seq data, 
BMC Bioinformatics. 2013 Jan 16:14:7.doi: 10.1186/1471-2105-14-7.

