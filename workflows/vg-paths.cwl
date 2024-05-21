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
arguments: [paths, -x, $(inputs.graph.path), -L, -Q, $(inputs.ref_prefix)]
inputs:
  graph:
    type: File
  ref_prefix:
    type: string
    default: GRCh38

outputs:
  path_list:
    type: stdout

stdout: $(inputs.ref_prefix).path_list.txt