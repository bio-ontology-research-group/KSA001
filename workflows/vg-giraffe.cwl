cwlVersion: v1.1
class: CommandLineTool
requirements:
  InlineJavascriptRequirement: {}
  ShellCommandRequirement: {}
  DockerRequirement:
    dockerPull: "quay.io/biocontainers/vg:1.54.0--h9ee0642_0"
  ResourceRequirement:
    coresMin: 64
    ramMin: $(64 * 1024)
baseCommand: vg
arguments: [giraffe, --progress, -o, BAM, -P, -L, "3000", -t, $(runtime.cores)]

inputs:
  graph:
    type: File
    inputBinding:
      prefix: -Z
  ref_paths:
    type: File
    inputBinding:
      prefix: --ref-paths
  reads1:
    type: File
    inputBinding:
      prefix: -f
  reads2:
    type: File?
    inputBinding:
      prefix: -f
  kff:
    type: File
    inputBinding:
      prefix: --kff-name
  hapl:
    type: File
    inputBinding:
      prefix: --haplotype-name
  index_basename:
    type: string
    default: graph_index
    inputBinding:
      prefix: --index-basename
  output:
    type: string
    default: aligned_reads.bam
outputs:
  aligned_reads:
    type: stdout

stdout: $(inputs.output)