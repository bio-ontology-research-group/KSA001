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
  model_type: string
  regions: File?
  output_cram: string?
  output_vcf: string?
  output_gvcf: string?
  
outputs:
  aligned_reads:
    type: File
    outputSource: samtools_index/aligned_reads_indexed
  aligned_reads_stats:
    type: File
    outputSource: samtools_stats/stats
  output_vcf:
    type: File
    outputSource: deepvariant/vcf
  output_gvcf:
    type: File
    outputSource: deepvariant/gvcf
  slivar:
    type: File
    outputSource: slivar/vcf
    

steps:
  bwa-mem2:
    in:
      ref: ref
      reads1: reads1
      reads2: reads2
      output_cram: output_cram
    out: [aligned_reads]
    run: bwa-mem2.cwl
  samtools_index:
    in:
      aligned_reads: bwa-mem2/aligned_reads
    out:
      [aligned_reads_indexed]
    run: samtools-index.cwl
  samtools_stats:
    in:
      ref: ref
      aligned_reads: [samtools_index/aligned_reads_indexed]
    out: [stats]
    run: samtools-stats.cwl
  deepvariant:
    in:
      model_type: model_type
      ref: ref
      aligned_reads: [samtools_index/aligned_reads_indexed]
      regions: regions
      output_vcf: output_vcf
      output_gvcf: output_gvcf
    out: [vcf, gvcf]
    run: deepvariant.cwl
  slivar:
    in:
      vcf: [deepvariant/vcf]
    out:
      [vcf]
    run: slivar.cwl
