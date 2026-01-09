# Minimal Docker image for GNPS_MASST using Ubuntu base
FROM ubuntu:22.04
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>

# install GNPS_MASST
ENV CONDA_DIR /opt/conda
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get install -y build-essential libarchive-dev wget vim && \
    wget "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh" && \
    bash Miniforge3-Linux-x86_64.sh -b -p "/opt/conda" && \
    rm Miniforge3-Linux-x86_64.sh && \
    echo "export PATH=$CONDA_DIR:$PATH" >> ~/.bashrc && \
    export PATH=$CONDA_DIR:$PATH && \
    conda create -n python3 python=3.10 -y && \
    git clone https://github.com/mwang87/GNPS_MASST.git && \
    mv GNPS_MASST /GNPS_MASST && \
    /bin/bash -c 'conda activate python3 && conda install -r /GNPS_MASST/requirements.txt'
WORKDIR /GNPS_MASST
