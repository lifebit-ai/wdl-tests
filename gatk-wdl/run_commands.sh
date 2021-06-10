wget https://github.com/broadinstitute/cromwell/releases/download/33.1/cromwell-33.1.jar # grabs a cromwell instance

git clone https://github.com/gatk-workflows/seq-format-validation.git

java -version
#java version "16.0.1" 2021-04-20
#Java(TM) SE Runtime Environment (build 16.0.1+9-24)
#Java HotSpot(TM) 64-Bit Server VM (build 16.0.1+9-24, mixed mode, sharing

mkdir inputs
gsutil cp gs://gatk-test-data/wgs_bam/NA12878_24RG_hg38/NA12878_24RG_small.hg38.bam inputs/
gsutil cp gs://gatk-test-data/wgs_bam/NA12878_24RG_hg38/NA12878_24RG_med.hg38.bam inputs/

sed 's?gs:\/\/gatk-test-data\/wgs_bam\/NA12878_24RG_hg38?'`pwd`'?' seq-format-validation/validate-bam.inputs.json > inputs/input.json


java -jar cromwell-33.1.jar run ./seq-format-validation/validate-bam.wdl --inputs inputs/input.json # producess cromwell-executions and cromwell-workflow-logs in current directory