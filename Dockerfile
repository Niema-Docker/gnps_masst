# Minimal Docker image for GNPS_MASST using Ubuntu base
FROM ubuntu:22.04
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>

# install GNPS_MASST
ENV MAMBA_ROOT_PREFIX /opt/mamba
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get install -y build-essential git libarchive-dev vim wget && \
    wget "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh" && \
    bash Miniforge3-Linux-x86_64.sh -b -p "/opt/conda" && \
    rm Miniforge3-Linux-x86_64.sh && \
    echo "export PATH=$MAMBA_ROOT_PREFIX:$PATH" >> ~/.bashrc && \
    echo 'eval "$(micromamba shell hook --shell bash)"' >> ~/.bashrc && \
    export PATH=$MAMBA_ROOT_PREFIX:$PATH && \
    micromamba shell init --shell bash --root-prefix=$MAMBA_ROOT_PREFIX &&\
    micromamba create -n python3 python=3.10 -y && \
    git clone https://github.com/mwang87/GNPS_MASST.git && \
    /bin/bash -c 'micromamba activate python3 && micromamba install -r /GNPS_MASST/requirements.txt'
WORKDIR /GNPS_MASST
