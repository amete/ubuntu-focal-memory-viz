# UBUNTU 
FROM ubuntu:focal
MAINTAINER Serhan Mete

# Don't ask anything
ARG DEBIAN_FRONTEND=noninteractive

# Install basics
RUN apt-get -y update && \
    apt-get -y install build-essential sudo \
    cmake git vim extra-cmake-modules x11-apps \
    qt5-default libqt5xmlpatterns5-dev \
    libkf5coreaddons-dev libkf5i18n-dev libkf5itemmodels-dev libkf5threadweaver-dev libkf5kio-dev libkf5iconthemes-dev libkf5archive-dev libkf5parts-dev \
    libboost-dev libboost-iostreams-dev libboost-program-options-dev libboost-system-dev libboost-filesystem-dev \
    libunwind-dev zlib1g-dev \
    libkchart-dev gettext

# Create User
RUN useradd -m amete && echo "amete:amete" | chpasswd && adduser amete sudo

# Download the tool, compile, and install
RUN cd /home/amete && git clone https://github.com/KDE/massif-visualizer.git && \
    cd massif-visualizer && mkdir build && cd build && \
    cmake ../ && make && make install 

RUN cd /home/amete && git clone https://github.com/KDE/heaptrack.git && \
    cd heaptrack && mkdir build && cd build && \
    cmake ../ && make && make install 

# Change User
USER amete

# Start a shell
CMD ["/bin/bash"]
