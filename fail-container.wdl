task fail {
  command {
    trololo
  }
  runtime {
    docker: "ubrutu:latest"
  }
  output {
    File? opt_out = "non-existing-optional_output.txt" 
  }
}

workflow ReadFile {
  call fail
}
