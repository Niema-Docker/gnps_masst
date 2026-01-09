# Minimal Docker image for GNPS_MASST using Ubuntu base
FROM mambaorg/micromamba:debian12-slim
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>

# install GNPS_MASST
SHELL ["/bin/bash", "-c"]
RUN micromamba create -y -n gnps_masst pip python=3.10 unzip wget && \
    micromamba shell init --shell bash --root-prefix=~/.local/share/mamba && \
    micromamba activate gnps_masst && \
    wget "https://github.com/mwang87/GNPS_MASST/archive/refs/heads/master.zip" && \
    unzip master.zip && \
    rm master.zip && \
    mv GNPS_MASST-master ~/GNPS_MASST && \
    pip install -r ~/GNPS_MASST/requirements.txt && \
    echo 'micromamba activate gnps_masst' >> ~/.bashrc
WORKDIR /home/mambauser/GNPS_MASST
