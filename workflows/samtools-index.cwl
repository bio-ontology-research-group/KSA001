cwlVersion: v1.1
class: CommandLineTool
requirements:
  InlineJavascriptRequirement: {}
  ShellCommandRequirement: {}
  InitialWorkDirRequirement:
    listing: [ $(inputs.aligned_reads) ]

  DockerRequirement:
    dockerPull: "coolmaksat/minimap2-samtools"
  ResourceRequirement:
    coresMin: 2
    ramMin: $(4 * 1024)
baseCommand: samtools
arguments: [index, $(inputs.aligned_reads)]
inputs:
  aligned_reads: File

outputs:
  aligned_reads_indexed:
    type: File
    outputBinding:
      glob: $(inputs.aligned_reads.basename)
    secondaryFiles:
      - .crai