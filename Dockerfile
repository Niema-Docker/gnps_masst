# Minimal Docker image for GNPS_MASST using Ubuntu base
FROM mambaorg/micromamba:debian12-slim
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>

# install GNPS_MASST
RUN micromamba install -y unzip wget && \
    micromamba clean -y --all
ARG MAMBA_DOCKERFILE_ACTIVATE=1
RUN wget "https://github.com/mwang87/GNPS_MASST/archive/refs/heads/master.zip" && \
    unzip master.zip && rm master.zip && mv GNPS_MASST-master ~/GNPS_MASST \
    micromamba create -y -n gnps_masst pip python=3.10 && \
    micromamba run -n gnps_masst pip install --no-cache-dir -r ~/GNPS_MASST/requirements.txt
WORKDIR /home/mambauser/GNPS_MASST
ENV ENV_NAME=gnps_masst
