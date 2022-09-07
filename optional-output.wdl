version 1.0

task read_file {
  input {
    File file
  }
  command {
    cat ${file} > test_output_file.txt
  }
  output {
    Array[File] contents = glob("*.txt")
  }
  runtime {
    docker: "ubuntu:latest"
  }
}

task optional_output {
  command {
    echo "something" > optional_output.txt
  }
  output {
    File? optional_output = "optional_output.txt"
    File? non_existing_output = "non-existing-file.txt"
  }
  runtime {
    docker: "ubuntu:latest"
  }
}

workflow ReadFile {
  call optional_output
  call read_file
  output {
    Array[File] read_file_contents = read_file.contents
    File? optional_out_out = optional_output.optional_output
  }
}
