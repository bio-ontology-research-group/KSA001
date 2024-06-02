#!/bin/sh

# Set variables
SAMPLE="SampleName"

# Sort BAM file
picard -Xmx100g SortSam \
I=${SAMPLE}.bam \
O=${SAMPLE}.sort.bam \
VALIDATION_STRINGENCY=LENIENT \
SORT_ORDER=coordinate \
MAX_RECORDS_IN_RAM= 3000000 \
CREATE_INDEX=True
