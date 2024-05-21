cwlVersion: v1.1
class: CommandLineTool
requirements:
  InlineJavascriptRequirement: {}
  ShellCommandRequirement: {}
  DockerRequirement:
    dockerPull: "coolmaksat/minimap2-samtools"
  ResourceRequirement:
    coresMin: 64
    ramMin: $(64 * 1024)
baseCommand: minimap2
arguments: [-t, "64", -ax, sr, $(inputs.ref_index), $(inputs.reads1), $(inputs.reads2),
            {shellQuote: false, valueFrom: '|'},
            samtools, fixmate, -u, -m, -, -,
            {shellQuote: false, valueFrom: '|'},
            samtools, sort, -u, -@8, -T, /tmp/readsPrefix,  -,
            {shellQuote: false, valueFrom: '|'},
            samtools, markdup, -@16, --reference, $(inputs.ref), -, aligned_reads.cram
            ]
inputs:
  ref:
    type: File
    secondaryFiles:
      - .fai
  ref_index: File
  reads1: File
  reads2: File?

outputs:
  aligned_reads:
    type: File
    outputBinding:
      glob: aligned_reads.cram
