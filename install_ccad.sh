#!/usr/bin/env bash

# username="$USER"
# user="$(id -u)"
home="${1:-$HOME}"

imageName="guillaume-florent/ccad:latest"
containerName="ccad"
displayVar="$DISPLAY"

echo "Building Docker container ${containerName}"

docker build --tag ${imageName} .

docker run  -it -d --name ${containerName}                  \
    -e DISPLAY=${displayVar}                                \
    --workdir="${home}"                                     \
    --volume="${home}:${home}"                              \
    -p 8888:8888                                            \
     -v=/tmp/.X11-unix:/tmp/.X11-unix ${imageName}          \
     /bin/bash


echo "Container ${containerName} was created."

echo "*********************************************************"
echo "Run the ./start_ccad.sh script to launch container      "
echo "*********************************************************"