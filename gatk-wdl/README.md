## WDL tests using GATK pipelines

Relates to DEL-433 (add Jira link).

Aim: Find an open source bioinformatics workflow (GATK) and run with example data locally, documenting dependencies and commands.

Open source pipelines that ran succesfully are:
- https://github.com/gatk-workflows/seq-format-validation/blob/master/validate-bam.wdl (performs BAM format validation for an array of .bam files)


Other pipelines attempted:
- https://github.com/biowdl/gatk-variantcalling
- https://github.com/biowdl/small-rna


---

Notes:
 - GATK workflows generally appear very sensitive to changes in Java and cromwell versions
 - Tried more multistep biowdl workflows but coming across a `qemu: uncaught target signal 11 (Segmentation fault)`. I have tinkered with the memory allocation parameters for the failing step (SingleSampleCalling) but no luck. `java -jar cromwell-47.jar run ./multisample-variantcalling.wdl -i two_sample_gvcf.json`
- Corrupt jar file when installing dependencies via conda from requirements-test.txt