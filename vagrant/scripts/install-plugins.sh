#!/bin/bash -x
export DEBIAN_FRONTEND=noninteractive
export damb_version=v3


### vapoursynth-damb: audio support ###
if [ -d ~/installs/vapoursynth-damb ]; then
   echo "switching to existing directory."
   cd ~/installs/vapoursynth-damb
else
   echo "damb directory does not exist. Cloning repo."
   mkdir -p ~/installs/
   cd ~/installs/
   git clone https://github.com/dubhater/vapoursynth-damb
fi

sudo apt-get update \
   && sudo apt-get install -y libsndfile1 libsndfile1-dev

cd ~/installs/vapoursynth-damb \
   && git checkout $damb_version \
   && ./autogen.sh \
   && ./configure \
   && make clean \
   && make \
   && sudo make install
