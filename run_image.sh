#!/bin/bash
xhost +localhost
docker run --rm -it --env DISPLAY=host.docker.internal:0 -v /tmp/.X11-unix:/tmp/.X11-unix -v $HOME:/home/amete/external ubuntu-focal-memory-viz:latest
