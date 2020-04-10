from ubuntu:latest

run apt-get update && \
apt-get install -y \
software-properties-common

run add-apt-repository ppa:deadsnakes/ppa && \
apt-get update && \
apt-get install -y \
python3.7 \
python3-pip

run pip3 install --upgrade pip

copy config/python /usr/local/bin/

workdir home/
