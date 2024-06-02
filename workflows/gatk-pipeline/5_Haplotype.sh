#!/bin/sh

# Set variables
REFERENCE="ksa001.fa"
SAMPLE="SampleName"

# Call haplotypes
gatk --java-options "-Xmx92g" HaplotypeCaller \
	-I ${SAMPLE}.sort.dup.bqsr.bam \
	-R REFERENCE \
	-ERC GVCF \
	-O ${SAMPLE}.g.vcf.gz

# Genotype
gatk --java-options "-Xmx92g" GenotypeGVCFs \
    -R REFERENCE \
    -V ${SAMPLE}.g.vcf.gz \
    -O ${SAMPLE}.vcf.gz
