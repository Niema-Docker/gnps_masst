# Minimal Docker image for GNPS_MASST using Ubuntu base
FROM ubuntu:22.04
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>

# install GNPS_MASST
SHELL ["/bin/bash", "-c"]
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get install -y build-essential git libarchive-dev vim wget && \
    wget "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh" && \
    bash Miniforge3-Linux-x86_64.sh -b -c && \
    rm Miniforge3-Linux-x86_64.sh && \
    source /root/.bashrc && \
    micromamba create -n python3 python=3.10 -y && \
    git clone https://github.com/mwang87/GNPS_MASST.git && \
    /bin/bash -c 'micromamba activate python3 && micromamba install -r /GNPS_MASST/requirements.txt'
WORKDIR /GNPS_MASST
