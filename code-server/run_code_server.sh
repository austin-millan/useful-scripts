#!/bin/bash

CONTAINER_NAME='your-code-server'  # container/image name
CONTAINER_USER='coder'

docker build -t $CONTAINER_NAME .

docker run \
    -d \
    -p 8443:8443 \
    --privileged \
    --name $CONTAINER_NAME \
    -v /home/${USER}/.ssh:/home/$CONTAINER_USER/.ssh \
    -v "${PWD}:/home/$CONTAINER_USER/project" \
    $CONTAINER_NAME \
    --password "tRyToBrUtEf0rC3ThI$1!"
