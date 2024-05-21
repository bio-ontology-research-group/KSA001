cwlVersion: v1.1
class: CommandLineTool
requirements:
  InlineJavascriptRequirement: {}
  ShellCommandRequirement: {}
  DockerRequirement:
    dockerPull: "coolmaksat/bwa-mem2-samtools"
  ResourceRequirement:
    coresMin: 2
    ramMin: $(4 * 1024)
baseCommand: samtools
arguments: [stats, $(inputs.aligned_reads)]
stdout: $(inputs.aligned_reads.nameroot).stats

inputs:
  ref:
    type: File
    secondaryFiles:
      - .fai
    inputBinding:
      prefix: --reference
  aligned_reads: File

outputs:
  stats:
    type: File
    outputBinding:
      glob: $(inputs.aligned_reads.nameroot).stats