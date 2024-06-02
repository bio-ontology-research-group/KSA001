#!/bin/sh

# Set variables
REFERENCE="ksa001.fa"
READ1="Read1_R1.fastq.gz"
READ2="Read2_R2.fastq.gz"
SAMPLE="SampleName"

# Index reference genome
bwa index $REFERENCE

# Align reads to indexed reference
bwa mem -M -t 16 \
-R "@RG\tID:HJJY3DRXY.1\tSM:t2t\tLB:Illumina_wgs\tPL:ILLUMINA" \
$REFERENCE \
$READ1 \
$READ2 | \
samtools view -b -h -o ${SAMPLE}.bam -
