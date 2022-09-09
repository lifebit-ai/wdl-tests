task fail {
  command {
    trololo
  }
  runtime {
    docker: "ubuntu:latest"
  }
  output {
    File? opt_out = "non-existing-optional_output.txt" 
  }
}

workflow ReadFile {
  call fail
}
