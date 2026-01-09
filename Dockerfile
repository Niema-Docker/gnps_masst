# Minimal Docker image for GNPS_MASST using Ubuntu base
FROM ubuntu:22.04
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>

# install GNPS_MASST
SHELL ["/bin/bash", "-c"]
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get install -y git wget && \
    wget -qO- "https://micro.mamba.pm/install.sh" | bash - && \
    source /root/.bashrc && \
    micromamba create -n gnps_masst python=3.10 -y && \
    git clone https://github.com/mwang87/GNPS_MASST.git && \
    micromamba activate gnps_masst && \
    micromamba install -r /GNPS_MASST/requirements.txt && \
    echo 'micromamba activate gnps_masst' >> /root/.bashrc
WORKDIR /GNPS_MASST
