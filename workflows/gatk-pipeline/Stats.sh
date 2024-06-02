#!/bin/sh

# Set variables
SAMPLE="SampleName"

# Summarize alignment
samtools flagstat ${SAMPLE}.sort.bam

# Summarize variant stats
bcftools stats ${SAMPLE}.vcf.gz
