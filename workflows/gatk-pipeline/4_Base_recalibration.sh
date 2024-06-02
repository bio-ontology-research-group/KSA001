#!/bin/sh

# Set variables
REFERENCE="ksa001.fa"
SAMPLE="SampleName"
dbSNP="dbSNP.vcf.gz"

# Create reaclibration model
gatk --java-options "-Xmx137g" BaseRecalibrator \
	-I ${SAMPLE}.sort.dup.bam \
	-R $REFERENCE \
	--known-sites $dbSNP \
	-O ${SAMPLE}_recal_data.table

# Run recalibration model
gatk --java-options "-Xmx100g" ApplyBQSR \
	-I ${SAMPLE}.sort.dup.bam \
	-R $REFERENCE \
	--bqsr-recal-file ${SAMPLE}_recal_data.table \
	-O ${SAMPLE}.sort.dup.bqsr.bam
