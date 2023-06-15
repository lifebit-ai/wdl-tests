task fail {
  command {
    trololo
  }
  runtime {
    docker: "quay.io/lifebitai/ubuntu:18.10"
  }
  output {
    File? opt_out = "non-existing-optional_output.txt" 
  }
}

workflow ReadFile {
  call fail
}
