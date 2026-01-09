# Minimal Docker image for GNPS_MASST using Ubuntu base
FROM mambaorg/micromamba:debian12-slim
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>

# install GNPS_MASST
RUN micromamba create -y -n gnps_masst python=3.10 unzip wget && \
    #git clone https://github.com/mwang87/GNPS_MASST.git && \
    micromamba activate gnps_masst && \
    wget https://github.com/mwang87/GNPS_MASST/archive/refs/heads/master.zip && \
    unzip master.zip && \
    rm master.zip && \
    micromamba install -r GNPS_MASST-master/requirements.txt && \
    mv GNPS_MASST-master ~/GNPS_MASST && \
    echo 'micromamba activate gnps_masst' >> ~/.bashrc
WORKDIR /home/mambauser/GNPS_MASST
