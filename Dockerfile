FROM ubuntu:latest

ARG GROUP_ID
ARG USER_ID

RUN apt-get update && \
apt-get install -y \
software-properties-common

RUN add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y \
    python3.7 \
    python3-pip

RUN pip3 install --upgrade pip

RUN groupadd -g ${GROUP_ID} josh && \
    useradd josh \
    -l \
    -u ${USER_ID} \
    -m \
    -d /home/josh \
    -g josh \
    -s /bin/bash

USER josh

WORKDIR /home/josh

VOLUME [ "/home/josh" ]