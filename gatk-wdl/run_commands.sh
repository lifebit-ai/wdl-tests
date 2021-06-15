wget https://github.com/broadinstitute/cromwell/releases/download/33.1/cromwell-33.1.jar # grabs a cromwell instance
wget https://github.com/broadinstitute/cromwell/releases/download/57/cromwell-57.jar

git clone https://github.com/gatk-workflows/seq-format-validation.git

java -version
#java version "16.0.1" 2021-04-20
#Java(TM) SE Runtime Environment (build 16.0.1+9-24)
#Java HotSpot(TM) 64-Bit Server VM (build 16.0.1+9-24, mixed mode, sharing

mkdir inputs
gsutil cp gs://gatk-test-data/wgs_bam/NA12878_24RG_hg38/NA12878_24RG_small.hg38.bam inputs/
gsutil cp gs://gatk-test-data/wgs_bam/NA12878_24RG_hg38/NA12878_24RG_med.hg38.bam inputs/

sed 's?gs:\/\/gatk-test-data\/wgs_bam\/NA12878_24RG_hg38?'`pwd`'?' seq-format-validation/validate-bam.inputs.json > inputs/input.json

##############################################
# Testing with smaller bams to improve runtime
##############################################

mkdir small_inputs
wget  https://lifebit-featured-datasets.s3-eu-west-1.amazonaws.com/IGV/crg-covid/BAM/PRJEB33797_WT.Coronavirus_229E.Spliced_Nanopreprocess_alignment_PRJEB33797_Viehweger_GR2019.minimap2.sorted.bam -P small_inputs/
wget https://lifebit-featured-datasets.s3-eu-west-1.amazonaws.com/IGV/crg-covid/BAM/8F6N9_Korea_VeroInfected.hg38_NanoPreprocess_alignment_Vero_Infected.minimap2.sorted.bam -P small_inputs/

echo "{
\"ValidateBamsWf.bam_array\":" > inputs.json
ls -d ${PWD}/small_inputs/* | jq -R -s -c 'split("\n")[:-1]' >> inputs.json
echo "}" >> inputs.json

java -jar cromwell-57.jar run ./seq-format-validation/validate-bam.wdl --inputs inputs.json
java -jar cromwell-33.1.jar run ./seq-format-validation/validate-bam.wdl --inputs inputs/input.json # producess cromwell-executions and cromwell-workflow-logs in current directory
