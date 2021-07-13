FROM ubuntu:latest

ARG GROUP_ID
ARG USER_ID

RUN apt-get update && \
    apt-get install -y \
    software-properties-common

RUN add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y \
    python3.8 \
    python3-pip 

RUN python3.8 -m pip install pip --upgrade

RUN python3.8 -m pip install virtualenv

RUN groupadd -g ${GROUP_ID} josh && \
    useradd josh \
    -l \
    -u ${USER_ID} \
    -m \
    -d /home/josh \
    -g josh \
    -s /bin/bash

WORKDIR /home/josh

COPY etc/setup.sh /home/josh/setup.sh

RUN mkdir /home/josh/._

VOLUME [ "/home/josh/._" ]

USER josh

ENTRYPOINT ["/home/josh/setup.sh"]