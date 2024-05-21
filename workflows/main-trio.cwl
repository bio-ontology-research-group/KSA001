cwlVersion: v1.1
class: Workflow
requirements:
  ResourceRequirement:
    ramMin: $(8 * 1024)
    coresMin: 2
  MultipleInputFeatureRequirement: {}
  
inputs:
  ref:
    type: File
    secondaryFiles:
      - .fai
  reads1: File
  reads2: File?
  parent1_reads1: File
  parent1_reads2: File?
  parent2_reads1: File
  parent2_reads2: File?
  model_type: string
  regions: File?
  output_cram:
    type: string
    default: aligned_reads.cram
  output_vcf:
    type: string
    default: variants.vcf
  output_gvcf:
    type: string
    default: variants.gvcf
  parent1_output_cram:
    type: string
    default: parent1_aligned_reads.cram
  parent1_output_vcf:
    type: string
    default: parent1_variants.vcf
  parent1_output_gvcf:
    type: string
    default: parent1_variants.gvcf
  parent2_output_cram:
    type: string
    default: parent2_aligned_reads.cram
  parent2_output_vcf:
    type: string
    default: parent2_variants.vcf
  parent2_output_gvcf:
    type: string
    default: parent2_variants.gvcf
  
outputs:
  aligned_reads:
    type: File
    outputSource: samtools_index/aligned_reads_indexed
  aligned_reads_stats:
    type: File
    outputSource: samtools_stats/stats
  parent1_aligned_reads:
    type: File
    outputSource: parent1_samtools_index/aligned_reads_indexed
  parent1_aligned_reads_stats:
    type: File
    outputSource: parent1_samtools_stats/stats
  parent2_aligned_reads:
    type: File
    outputSource: parent2_samtools_index/aligned_reads_indexed
  parent2_aligned_reads_stats:
    type: File
    outputSource: parent2_samtools_stats/stats
  output_vcf:
    type: File
    outputSource: deepvariant/vcf
  output_gvcf:
    type: File
    outputSource: deepvariant/gvcf
  parent1_output_vcf:
    type: File
    outputSource: deepvariant/parent1_vcf
  parent1_output_gvcf:
    type: File
    outputSource: deepvariant/parent1_gvcf
  parent2_output_vcf:
    type: File
    outputSource: deepvariant/parent2_vcf
  parent2_output_gvcf:
    type: File
    outputSource: deepvariant/parent2_gvcf
    

steps:
  bwa-mem2:
    in:
      ref: ref
      reads1: reads1
      reads2: reads2
      output_cram: output_cram
    out: [aligned_reads]
    run: bwa-mem2.cwl
  bwa-mem2-parent1:
    in:
      ref: ref
      reads1: parent1_reads1
      reads2: parent1_reads2
      output_cram: output_cram
    out: [aligned_reads]
    run: bwa-mem2.cwl
  bwa-mem2-parent2:
    in:
      ref: ref
      reads1: parent2_reads1
      reads2: parent2_reads2
      output_cram: output_cram
    out: [aligned_reads]
    run: bwa-mem2.cwl
  samtools_index:
    in:
      aligned_reads: bwa-mem2/aligned_reads
    out:
      [aligned_reads_indexed]
    run: samtools-index.cwl
  parent1_samtools_index:
    in:
      aligned_reads: bwa-mem2-parent1/aligned_reads
    out:
      [aligned_reads_indexed]
    run: samtools-index.cwl
  parent2_samtools_index:
    in:
      aligned_reads: bwa-mem2-parent2/aligned_reads
    out:
      [aligned_reads_indexed]
    run: samtools-index.cwl
  samtools_stats:
    in:
      ref: ref
      aligned_reads: [samtools_index/aligned_reads_indexed]
    out: [stats]
    run: samtools-stats.cwl
  parent1_samtools_stats:
    in:
      ref: ref
      aligned_reads: [parent1_samtools_index/aligned_reads_indexed]
    out: [stats]
    run: samtools-stats.cwl
  parent2_samtools_stats:
    in:
      ref: ref
      aligned_reads: [parent2_samtools_index/aligned_reads_indexed]
    out: [stats]
    run: samtools-stats.cwl
  deepvariant:
    in:
      model_type: model_type
      ref: ref
      aligned_reads: [samtools_index/aligned_reads_indexed]
      parent1_aligned_reads: [parent1_samtools_index/aligned_reads_indexed]
      parent1_aligned_reads: [parent2_samtools_index/aligned_reads_indexed]
      regions: regions
      output_vcf: output_vcf
      output_gvcf: output_gvcf
      parent1_output_vcf: parent1_output_vcf
      parent1_output_gvcf: parent1_output_gvcf
      parent2_output_vcf: parent2_output_vcf
      parent2_output_gvcf: parent2_output_gvcf
    out: [vcf, gvcf, parent1_vcf, parent1_gvcf, parent2_vcf, parent2_gvcf]
    run: deeptrio.cwl
