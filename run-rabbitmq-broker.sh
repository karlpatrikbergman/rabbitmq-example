#!/usr/bin/env bash
# -p 8080:15672     maps rabbitmq web ui in docker container to localhost:8080
# -p 5672:5672      maps rabbitmq broker port in docker container to localhost:5672

CONTAINER_NAME="hjortron-rabbitmq-broker"
CONTAINER_HOST_NAME="hjortron-rabbitmq-host"

clear
docker stop ${CONTAINER_NAME}
docker rm ${CONTAINER_NAME}
docker images -q --filter "dangling=true" | xargs -n1 -r docker rmi
docker run -d --hostname ${CONTAINER_HOST_NAME} --name ${CONTAINER_NAME} -p 8080:15672 -p 5672:5672 rabbitmq:3-management