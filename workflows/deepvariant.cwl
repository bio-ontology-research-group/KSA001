cwlVersion: v1.1
class: CommandLineTool
requirements:
  InlineJavascriptRequirement: {}
  ShellCommandRequirement: {}
  DockerRequirement:
    dockerPull: "google/deepvariant:1.6.0"
  ResourceRequirement:
    coresMin: 64
    ramMin: $(96 * 1024)
baseCommand: /opt/deepvariant/bin/run_deepvariant

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
  output_vcf:
    type: string
    default: variants.vcf
    inputBinding:
      prefix: --output_vcf
  output_gvcf:
    type: string
    default: variants.gvcf
    inputBinding:
      prefix: --output_gvcf
  num_shards:
    type: int
    default: 64
    inputBinding:
      prefix: --num_shards
  regions:
    type: File?
    inputBinding:
      prefix: --regions
  extra_args:
    type: string?
    inputBinding:
      prefix: --make_examples_extra_args

outputs:
  vcf:
    type: File
    outputBinding:
      glob: $(inputs.output_vcf)
  gvcf:
    type: File
    outputBinding:
      glob: $(inputs.output_gvcf)
