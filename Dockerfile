# Minimal Docker image for GNPS_MASST using Micromamba base
FROM mambaorg/micromamba:debian12-slim
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>

# install GNPS_MASST
RUN micromamba create -y -n python3 less pip python=3.10 unzip vim wget && \
    micromamba run -n python3 wget "https://github.com/mwang87/GNPS_MASST/archive/refs/heads/master.zip" && \
    unzip master.zip && rm master.zip && mv GNPS_MASST-master ~/GNPS_MASST && \
    micromamba run -n python3 pip install --no-cache-dir -r ~/GNPS_MASST/requirements.txt && \
    micromamba clean -y --all && \
    rm -rf /tmp/* ~/.cache
WORKDIR /home/mambauser/GNPS_MASST
ENV ENV_NAME=python3
