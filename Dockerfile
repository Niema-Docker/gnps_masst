# Minimal Docker image for GNPS_MASST using Micromamba base
FROM mambaorg/micromamba:debian12-slim
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>

# install Micromamba environment
RUN micromamba create -y -n python3 less pip python=3.10 unzip vim wget && \
    micromamba run -n python3 pip install --no-cache-dir -r ~/GNPS_MASST/requirements.txt && \
    micromamba clean -y --all && \
    rm -rf /tmp/* ~/.cache

# install GNPS_MASST
ARG MAMBA_DOCKERFILE_ACTIVATE=1
RUN wget "https://github.com/mwang87/GNPS_MASST/archive/refs/heads/master.zip" && \
    unzip master.zip && rm master.zip && mv GNPS_MASST-master ~/GNPS_MASST
WORKDIR /home/mambauser/GNPS_MASST
ENV ENV_NAME=python3
