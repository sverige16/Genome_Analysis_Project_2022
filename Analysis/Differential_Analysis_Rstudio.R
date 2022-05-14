##### Functional Code: Differential Analysis ####
#downloading HT seq count data from Analysis folder
directory <- "/home/erikpa/Genome_Analysis_Project_2022/Analysis/HTseq_files/all_separated/"
sampleFiles <- grep("*",list.files(directory), value=TRUE)
condition <- as.factor(c("con", "con","con", "min", "min"))
sampleTable <- data.frame(sampleName = sampleFiles,
                          fileName = sampleFiles,
                          condition = condition)
library("DESeq2")
#Using DESeq function in preperation for DESeq use
ddsHTseq <- DESeqDataSetFromHTSeqCount(sampleTable = sampleTable, 
                                       directory = directory,
                                       design = ~ condition)

#Using DESeq
dds <- DESeq(ddsHTseq)
res <- results(dds, contrast=c('condition', 'con', 'min'))

#plotMA
plotMA(res)

#Genes sorted by increasing 
sorted_by_lowest <-res[order(res$log2FoldChange),]
head(sorted_by_lowest, n = 3)

#Genes sorted by decreasing
sorted_by_highest <- res[order(res$log2FoldChange, decreasing = TRUE), ]
head(sorted_by_highest, n = 3)
