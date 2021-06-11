
FROM ubuntu@sha256:cc4755a9f2f76ca73055da11f1bdc01d65ce79202a68b041c67c32770c71954b

LABEL description="Dockerfile with requirements for GATK test wdl pipeline" \
version="1.0.0" \
maintainer="eva@lifebit.ai"

USER root

RUN apt-get update -y \
  && apt-get install curl -y \
  && apt-get install bzip2 -y\
  && apt-get install wget -y \
  && apt-get install procps -y \
  && apt-get install git -y \
  && rm -rf /var/lib/apt/lists/*


#Install cromwell instance

RUN wget https://github.com/broadinstitute/cromwell/releases/download/33.1/cromwell-33.1.jar
RUN wget https://github.com/broadinstitute/cromwell/releases/download/47/cromwell-47.jar
# Install miniconda to /miniconda
RUN curl -LO http://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN bash Miniconda3-latest-Linux-x86_64.sh -p /miniconda -b
RUN rm Miniconda3-latest-Linux-x86_64.sh
ENV PATH=/miniconda/bin:${PATH}
RUN conda update -y conda

RUN git clone https://github.com/gatk-workflows/seq-format-validation.git
RUN git clone https://github.com/biowdl/gatk-variantcalling
RUN git clone https://github.com/biowdl/small-rna

COPY environment.yml /
RUN conda env create -f environment.yml && conda clean -a
#ENV PATH /opt/conda/envs/cromwell-env/bin:$PATH



WORKDIR /data/

CMD ["bash"]
