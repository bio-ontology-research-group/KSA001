cwlVersion: v1.1
class: CommandLineTool
baseCommand:
  - /usr/bin/perl
  - /opt/vep/src/ensembl-vep/vep 
requirements:
  InlineJavascriptRequirement: {}
  DockerRequirement:
    dockerPull: 'ensemblorg/ensembl-vep:latest'
  ResourceRequirement:
    coresMin: 64
    ramMin: $(64 * 1024)
inputs:
  vep_input:
    type: File
    inputBinding:
      position: 1
      prefix: '-input_file'
  vep_assembly:
    type: string
    inputBinding:
      position: 2
      prefix: '-assembly'
  vep_output_file:
    type: string
  #vep_fasta_file:
  #  type: File
  pavs_custom_file:
    type: File
    secondaryFiles:
      - .tbi
  pavs_custom_args:
    type: string
  go_custom_file:
    type: File
    secondaryFiles:
      - .tbi
  go_custom_args:
    type: string
  hpo_custom_file:
    type: File
    secondaryFiles:
      - .tbi
  hpo_custom_args:
    type: string
  ppi_custom_file:
    type: File
    secondaryFiles:
      - .tbi
  ppi_custom_args:
    type: string
  vep_dir:
    type: Directory


outputs:
  vep_console_out: stdout
  vep_output: 
    type: File
    outputBinding:
      glob: $(inputs.vep_output_file)

arguments:
  - valueFrom: $(inputs.pavs_custom_file.path),$(inputs.pavs_custom_args)
    prefix: --custom
  - valueFrom: $(inputs.go_custom_file.path),$(inputs.go_custom_args)
    prefix: --custom
  - valueFrom: $(inputs.hpo_custom_file.path),$(inputs.hpo_custom_args)
    prefix: --custom
  - valueFrom: $(inputs.ppi_custom_file.path),$(inputs.ppi_custom_args)
    prefix: --custom
  - valueFrom: $(inputs.vep_dir)
    prefix: --dir
  - '--offline'
  - valueFrom: 'b'
    prefix: --polyphen
  - valueFrom: 'b'
    prefix: --sift
  - valueFrom: '500'
    prefix: --buffer_size
  - valueFrom: 'homo_sapiens'
    prefix: --species
  #- valueFrom: '110'
  #  prefix: --cache_version
  - '--symbol'
  - '--transcript_version'
  - '--tsl' 
  - '--numbers'  
  - '--check_existing' 
  #- '--hgvs' 
  #- valueFrom: $(inputs.vep_fasta_file)
  #  prefix: --fasta
  - '--biotype'
  - '--cache' 
  - '--tab' 
  - '--no_stats' 
  - '--af' 
  - '--af_gnomad' 
  - '--canonical'
  - valueFrom: $(inputs.vep_output_file)
    prefix: --output_file   