cwlVersion: v1.1
class: CommandLineTool
requirements:
  InlineJavascriptRequirement: {}
  ShellCommandRequirement: {}
  DockerRequirement:
    dockerPull: "coolmaksat/kmc"
  ResourceRequirement:
    coresMin: 8
    ramMin: $(8 * 1024)
  InitialWorkDirRequirement:
    listing:
      - entryname: paths.txt
        entry: |-
          $(inputs.reads1.path)
          $(inputs.reads2.path)
          
baseCommand: kmc
arguments: [-k29, -m128, -okff, -t$(runtime.cores),
           "@paths.txt", $(inputs.output), /tmp]
inputs:
  reads1: File
  reads2: File?
  output:
    type: string?
    default: sample

outputs:
  kff:
    type: File
    outputBinding:
      glob: $(inputs.output).kff
