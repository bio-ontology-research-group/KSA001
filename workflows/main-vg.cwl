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
  graph:
    type: File
  hapl:
    type: File
  reads1: File
  reads2: File
  model_type: string
  regions: File?
  output_cram: string?
  output_vcf: string?
  output_gvcf: string?
  dv_extra_args:
    type: string
    default: min_mapping_quality=1,keep_legacy_allele_counter_behavior=true,normalize_reads=true
  
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

steps:
  kmc:
    in:
      reads1: reads1
      reads2: reads2
    out: [kff]
    run: kmc.cwl
  vg-paths:
    in:
      graph: graph
    out: [path_list]
    run: vg-paths.cwl
  vg-giraffe:
    in:
      graph: graph
      hapl: hapl
      reads1: reads1
      reads2: reads2
      kff: kmc/kff
      ref_paths: vg-paths/path_list
    out: [aligned_reads]
    run: vg-giraffe.cwl
  samtools_sort:
    in:
      aligned_reads: vg-giraffe/aligned_reads
    out:
      [aligned_reads_sorted]
    run: samtools-sort.cwl
  samtools_index:
    in:
      aligned_reads: samtools_sort/aligned_reads_sorted
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
      extra_args: dv_extra_args
    out: [vcf, gvcf]
    run: deepvariant.cwl
