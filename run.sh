#!/bin/bash

export COOKIE=$(xauth list :0)
export DISPLAY=:0
docker build --build-arg COOKIE -t smash .
docker run -v "$(pwd)/iso:/slippi/iso" --net=host -e DISPLAY -e NO_AT_BRIDGE=1 -v /tmp/.X11-unix --rm -it smash python3 /slippi/example.py -e /slippi/squashfs-root/usr/bin/ --iso /slippi/iso/smash.iso -p 1 -o 2 -d