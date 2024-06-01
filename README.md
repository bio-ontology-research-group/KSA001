# A personal, reference quality, fully annotated genome from a Saudi individual (KSA001)


## Assembly releases

### v1.1.0 (Haploid genome)
* [ksa001.fa.gz](https://bio2vec.cbrc.kaust.edu.sa/data/ksa001/v1.1.0/ksa001.fa.gz)
* [ksa001.gene_annotation_overlap.gff3](https://bio2vec.cbrc.kaust.edu.sa/data/ksa001/v1.1.0/ksa001.gene_annotation_overlap.gff3)
* [ksa001_augustus.gtf](https://bio2vec.cbrc.kaust.edu.sa/data/ksa001/v1.1.0/ksa001_augustus.gtf)

### v1.1.0 (Diploid genome)

#### Maternal
* [ksa001.1v1.1.0.fa.gz](https://bio2vec.cbrc.kaust.edu.sa/data/ksa001/v1.1.0/ksa001.1v1.1.0fa.gz)
* [ksa001.1.gene_annotation_overlap.gff3](https://bio2vec.cbrc.kaust.edu.sa/data/ksa001/v1.1.0/ksa001.1.gene_annotation_overlap.gff3)

#### Paternal
* [ksa001.2v1.1.0.fa.gz](https://bio2vec.cbrc.kaust.edu.sa/data/ksa001/v1.1.0/ksa001.2v1.1.0fa.gz)
* [ksa001.2.gene_annotation_overlap.gff3](https://bio2vec.cbrc.kaust.edu.sa/data/ksa001/v1.1.0/ksa001.2.gene_annotation_overlap.gff3)


### v1.0.0 (Diploid genome)

#### Maternal
* [ksa001.1v1.0.0.fa.gz](https://bio2vec.cbrc.kaust.edu.sa/data/ksa001/v1.0.0/ksa001.1/ksa001.1v1.0.0.fa.gz): Maternal haploid assembly.
* [ksa001.1v1.0.0_chm13v2.0_GENCODEv35_CAT_Liftoff.vep.gff3.gz](https://bio2vec.cbrc.kaust.edu.sa/data/ksa001/v1.0.0/ksa001.1/ksa001.1v1.0.0_chm13v2.0_GENCODEv35_CAT_Liftoff.vep.gff.gz): CAT/Liftoff annotations.

#### Paternal
* [ksa001.2v1.0.0.fa.gz](https://bio2vec.cbrc.kaust.edu.sa/data/ksa001/v1.0.0/ksa001.2v1.0.0.fa.gz): Paternal haploid assembly.
* [ksa001.2v1.0.0_chm13v2.0_GENCODEv35_CAT_Liftoff.vep.gff3.gz](https://bio2vec.cbrc.kaust.edu.sa/data/ksa001/v1.0.0/ksa001.2/ksa001.2v1.0.0_chm13v2.0_GENCODEv35_CAT_Liftoff.vep.gff.gz): CAT/Liftoff annotations.

### v0.3.0

* [ksa001v0.3.0.fa.gz](https://bio2vec.cbrc.kaust.edu.sa/data/ksa001/v0.3.0/ksa001v0.3.0.fa.gz): Regions assembled with ONT reads are polished.
* [ksa001v0.3.0_chm13v2.0.paf.gz](https://bio2vec.cbrc.kaust.edu.sa/data/ksa001/v0.3.0/ksa001v0.3.0_chm13v2.0.paf.gz): Alignment to CHM13v2.0.
* [ksa001v0.3.0_chm13v2.0_GENCODEv35_CAT_Liftoff.vep.gff3_polished.gz](https://bio2vec.cbrc.kaust.edu.sa/data/ksa001/v0.3.0/ksa001v0.3.0_chm13v2.0_GENCODEv35_CAT_Liftoff.vep.gff3_polished.gz): CAT/Liftoff annotations.

### v0.2.1

* [ksa001v0.2.1.fa.gz](https://bio2vec.cbrc.kaust.edu.sa/data/ksa001/v0.2.1/ksa001v0.2.1.fa.gz): Gapless assembly
* [ksa001v0.2.1.cen_mask.bed](https://bio2vec.cbrc.kaust.edu.sa/data/ksa001/v0.2.1/ksa001v0.2.1.cen_mask.bed): Centromere satellite masking

### v0.1.0 (2022-10-09)
This is a first draft version of the genome

* [ksa001v0.1.0.fa.gz](https://bio2vec.cbrc.kaust.edu.sa/data/ksa001/v0.1.0/ksa001v0.1.0.fa.gz):
  excluding Y chromosome and unplaced contigs.
* [ksa001v0.1.0_wu.fa.gz](https://bio2vec.cbrc.kaust.edu.sa/data/ksa001/v0.1.0/ksa001v0.1.0_wu.fa.gz):
  with unplaced contigs.


## Comparison with CHM13 (latest version)

|Chromosome | CHM13 Length | KSA001.mat | QV | KSA001.pat | QV | KSA001 | QV |
| --------- | ------------ | ---------- | -- | ---------- | -- | ------ | -- |
|chr1 | 248,387,328 | 246,893,779 | 72.11 | 248,515,191 | 68.47 | 249,555,359 | 66.21 |
|chr2 | 242,696,752 | 242,046,071 | 67.70 | 242,632,705 | 75.55 | 243,650,403 | 67.65 |
|chr3 | 201,105,948 | 201,462,031 | 75.47 | 200,338,375 | 76.89 | 200,901,366 | 68.50 |
|chr4 | 193,574,945 | 191,676,519 | 76.36 | 191,977,661 | 75.60 | 193,119,457 | 66.64 |
|chr5 | 182,045,439 | 181,678,762 | 70.14 | 182,455,576 | 57.87 | 182,340,321 | 65.72 |
|chr6 | 172,126,628 | 171,636,591 | 76.17 | 171,747,260 | 73.14 | 172,212,606 | 68.22 |
|chr7 | 160,567,428 | 160,688,708 | 74.38 | 160,686,623 | 77.15 | 161,491,582 | 67.31 |
|chr8 | 146,259,331 | 145,082,495 | 70.77 | 145,751,733 | 78.42 | 146,283,325 | 67.09 |
|chr9 | 150,617,247 | 142,392,075 | 69.61 | 137,639,207 | 59.75 | 144,206,915 | 65.62 |
|chr10 | 134,758,134 | 137,124,436 | 79.03 | 136,124,862 | 75.75 | 137,487,260 | 67.46 |
|chr11 | 135,127,769 | 134,887,184 | 78.29 | 135,515,747 | 67.14 | 135,526,054 | 68.38 |
|chr12 | 133,324,548 | 133,634,782 | 72.96 | 133,706,131 | 61.11 | 137,511,954 | 67.61 |
|chr13 | 113,566,686 | 113,178,117 | 69.87 | 109,813,855 | 60.16 | 114,155,372 | 64.69 |
|chr14 | 101,161,492 | 98,200,010 | 71.78 | 104,568,253 | 74.97 | 104,854,739 | 67.68 |
|chr15 | 99,753,195 | 95,263,998 | 62.26 | 97,348,991 | 71.74 | 100,665,885 | 66.81 |
|chr16 | 96,330,374 | 91,348,093 | 77.51 | 84,634,195 | 74.24 | 91,858,333 | 66.42 |
|chr17 | 84,276,897 | 83,888,424 | 72.87 | 84,257,549 | 75.85 | 84,644,139 | 65.79 |
|chr18 | 80,542,538 | 80,057,793 | 69.54 | 79,675,856 | 55.60 | 80,394,818 | 65.05 |
|chr19 | 61,707,364 | 63,671,480 | 63.57 | 64,545,147 | 65.30 | 66,377,225 | 62.56 |
|chr20 | 66,210,255 | 66,487,749 | 76.68 | 66,499,802 | 79.99 | 66,944,161 | 68.45 |
|chr21 | 45,090,682 | 43,459,253 | 74.55 | 42,689,246 | 74.61 | 43,720,397 | 66.80 |
|chr22 | 51,324,926 | 42,716,621 | 65.48 | 49,396,945 | 66.50 | 49,931,329 | 63.42 |
|chrX | 154,259,566 | 154,358,968 | 68.38 | 153,509,181 | 64.77 | 154,680,412 | 65.49 |
|chrM | 16,569 | 16,567 | 39.96 | 0 | 0.00 | 16,567 | 39.96 |
|chrY | 62,460,029 | 0 | - | 0 | - | 0 | -|
|Total | 3,117,292,070 | 3,021,850,506 | 70.19 | 3,024,030,091 | 64.53 | 3,062,529,979 | 66.52 |
## Sequencing data
* Illumina: [SRR21927836](https://www.ncbi.nlm.nih.gov/sra/?term=SRR21927836) and [SRR21927835](https://www.ncbi.nlm.nih.gov/sra/?term=SRR21927835)
* ONT: [SRR21927834](https://www.ncbi.nlm.nih.gov/sra/?term=SRR21927834)
* PacBio: [SRR21927833](https://www.ncbi.nlm.nih.gov/sra/?term=SRR21927833)
