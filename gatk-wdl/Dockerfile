FROM continuumio/miniconda3@sha256:456e3196bf3ffb13fee7c9216db4b18b5e6f4d37090b31df3e0309926e98cfe2

LABEL description="Practice dockerfile - seq-validation-workflow uses broadinstitute latest docker image instead of this one" \
version="1.0.0" \
maintainer="eva@lifebit.ai"

RUN apt-get update -y \
  && apt-get install curl -y \
  && apt-get install bzip2 -y\
  && apt-get install wget -y \
  && rm -rf /var/lib/apt/lists/*


COPY environment.yml /
RUN conda env create -f environment.yml && conda clean -a
ENV PATH /opt/conda/envs/cromwell-env/bin:$PATH


WORKDIR /data/

CMD ["bash"]
