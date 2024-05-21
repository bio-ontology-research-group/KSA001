cwlVersion: v1.1
class: CommandLineTool
requirements:
  InlineJavascriptRequirement: {}
  DockerRequirement:
    dockerPull: "brentp/slivar:v0.3.0"
baseCommand: slivar
arguments: [expr, 
# --js, $(inputs.slivar_function),
# --ped, $(inputs.slivar_ped),
 -g, $(inputs.slivar_gnomad),
  --vcf, $(inputs.slivar_input),
  --info, $(inputs.slivar_info), --pass-only]

inputs:
  #slivar_function:
  #  type: File
  slivar_gnomad:
    type: File
  slivar_input:
    type: File
  #slivar_ped:
  #  type: File
  slivar_info:
    type: string

outputs:
  slivar_output:
    type: stdout
    
stdout: slivar-output.vcf

