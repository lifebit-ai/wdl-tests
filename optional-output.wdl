version 1.0

task read_file {
  File file

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
    File? = "optional_output.txt"
    File? = "non-existing-file.txt"
  }
}

workflow ReadFile {
  call optional_output
  call read_file
  output {
    read_file.contents
  }
}
