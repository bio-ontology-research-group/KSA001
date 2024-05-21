cwlVersion: v1.1
class: CommandLineTool
requirements:
  InlineJavascriptRequirement: {}
  ShellCommandRequirement: {}
  DockerRequirement:
    dockerPull: "coolmaksat/bwa-mem2-samtools"
  ResourceRequirement:
    coresMin: 64
    ramMin: $(64 * 1024)
baseCommand: bwa-mem2
arguments: [mem, -t, $(runtime.cores), $(inputs.ref), $(inputs.reads1), $(inputs.reads2),
            {shellQuote: false, valueFrom: '|'},
            samtools, fixmate, -u, -m, -, -,
            {shellQuote: false, vaxlueFrom: '|'},
            samtools, sort, -u, -@8, -T, /tmp/readsPrefix,  -,
            {shellQuote: false, valueFrom: '|'},
            samtools, markdup, -@16, --reference, $(inputs.ref), -, $(inputs.output_cram)
            ]
inputs:
  ref:
    type: File
    secondaryFiles:
      - .bwt.2bit.64
      - .ann
      - .amb
      - .pac
      - ".0123"
  reads1: File
  reads2: File?
  output_cram:
    type: string?
    default: aligned_reads.cram

outputs:
  aligned_reads:
    type: File
    outputBinding:
      glob: $(inputs.output_cram)
