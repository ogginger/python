#!/bin/bash
mkdir -p $1
cd $1
python3 -m virtualenv py
cp -r $1/* /home/josh/._