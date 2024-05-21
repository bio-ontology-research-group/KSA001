cwlVersion: v1.1
class: CommandLineTool
requirements:
  InlineJavascriptRequirement: {}
  ShellCommandRequirement: {}

hints:
  DockerRequirement:
    dockerPull: "google/deepvariant:deeptrio-1.6.0"
  ResourceRequirement:
    coresMin: 64
    ramMin: $(64 * 1024)
baseCommand: /opt/deepvariant/bin/deeptrio/run_deeptrio

inputs:
  model_type:
    type: string
    inputBinding:
      prefix: --model_type
  ref:
    type: File
    secondaryFiles:
      - .fai
    inputBinding:
      prefix: --ref
  aligned_reads:
    type: File
    secondaryFiles:
      - .crai
    inputBinding:
      prefix: --reads
  parent1_aligned_reads:
    type: File
    secondaryFiles:
      - .crai
    inputBinding:
      prefix: --reads_parent1
  parent2_aligned_reads:
    type: File
    secondaryFiles:
      - .crai
    inputBinding:
      prefix: --reads_parent2
  sample_name:
    type: string
    inputBinding:
      prefix: --sample_name_child
  sample_name_parent1:
    type: string
    inputBinding:
      prefix: --sample_name_parent1
  sample_name_parent2:
    type: string
    inputBinding:
      prefix: --sample_name_parent2
  
  output_vcf:
    type: string
    default: variants.vcf
    inputBinding:
      prefix: --output_vcf
  parent1_output_vcf:
    type: string
    default: parent1_variants.vcf
    inputBinding:
      prefix: --output_vcf_parent1
  parent2_output_vcf:
    type: string
    default: parent2_variants.vcf
    inputBinding:
      prefix: --output_vcf_parent2
  
  output_gvcf:
    type: string
    default: variants.gvcf
    inputBinding:
      prefix: --output_gvcf
  parent1_output_gvcf:
    type: string
    default: parent1_variants.gvcf
    inputBinding:
      prefix: --output_gvcf_parent1
  parent2_output_gvcf:
    type: string
    default: parent2_variants.gvcf
    inputBinding:
      prefix: --output_gvcf_parent2

  num_shards:
    type: int
    default: $(runtime.cores)
    inputBinding:
      prefix: --num_shards
  regions:
    type: File?
    inputBinding:
      prefix: --regions

outputs:
  vcf:
    type: File
    outputBinding:
      glob: $(inputs.output_vcf)
  parent1_vcf:
    type: File
    outputBinding:
      glob: $(inputs.parent1_output_vcf)
  parent2_vcf:
    type: File
    outputBinding:
      glob: $(inputs.parent2_output_vcf)
  gvcf:
    type: File
    outputBinding:
      glob: $(inputs.output_gvcf)
  parent1_gvcf:
    type: File
    outputBinding:
      glob: $(inputs.parent1_output_gvcf)
  parent2_gvcf:
    type: File
    outputBinding:
      glob: $(inputs.parent2_output_gvcf)
