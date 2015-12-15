#!/usr/bin/env bash

CONTAINER_NAME="hjortron-rabbitmq-broker"
CONTAINER_HOST_NAME="hjortron-rabbitmq-host"

clear
docker stop ${CONTAINER_NAME}
docker rm ${CONTAINER_NAME}
docker images -q --filter "dangling=true" | xargs -n1 -r docker rmi
docker run -d -p 5672:5672 --hostname ${CONTAINER_HOST_NAME} --name ${CONTAINER_NAME} rabbitmq