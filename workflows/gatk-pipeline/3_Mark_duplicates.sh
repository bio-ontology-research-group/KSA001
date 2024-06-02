#!/bin/sh

# Set variables
SAMPLE="SampleName"

# Mark duplicates
picard -Xmx100g MarkDuplicates \
I=${SAMPLE}.sort.bam \
O=${SAMPLE}.sort.bam.sort.dup.bam \
METRICS_FILE=${SAMPLE}_marked_dup_metrics.txt
