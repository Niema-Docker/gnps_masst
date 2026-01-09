# Minimal Docker image for GNPS_MASST using MicroMamba Debian base
FROM mambaorg/micromamba:debian12-slim
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>

# install GNPS_MASST
RUN sudo apt-get update && \
    DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC sudo apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC sudo apt-get install -y build-essential libarchive-dev wget vim && \
    mamba create -n python3 python=3.10 -y && \
    git clone https://github.com/mwang87/GNPS_MASST.git && \
    sudo mv GNPS_MASST /GNPS_MASST && \
    /bin/bash -c 'mamba activate python3 && mamba install -r /GNPS_MASST/requirements.txt'
WORKDIR /GNPS_MASST
