$graph:

- class: Workflow
  doc: try asynchronus mode
  id: helloworld
  inputs:
    message:
      type: string
      default: "Hello world"
      inputBinding:
        position: 1
  outputs: []

  steps:
    step_1:
      in:
        message: message
      run: '#ctl'
  
- baseCommand: touch helloworld-output
  class: CommandLineTool
  id: ctl
  
  arguments:
  - --message
  - valueFrom: $( inputs.message )

  inputs:
    message:
      type: string
  requirements:
    ResourceRequirement: {}
    InlineJavascriptRequirement: {}
    DockerRequirement:
      dockerPull: busybox

cwlVersion: v1.2

$namespaces:
  s: https://schema.org/
s:softwareVersion: 0.3.0
schemas:
- http://schema.org/version/9.0/schemaorg-current-http.rdf
# cwlVersion: v1.2

# # what type of CWL process we have in this document
# class: CommandLineTool

# # this commandLineTool executes the linux "echo" command-line tool
# baseCommand: echo

# # the input for this process
# inputs:
#   message:
#     type: string
#     default: "Hello world"
#     # bind this message value as an argument to "echo"
#     inputBinding:
#       position: 1
# outputs: []

# # to run it: cwltool [OPTIONS] <cwl_document> [INPUTS_OBJECT]
