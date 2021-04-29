#!/bin/sh
## this script used to run outside api, the same path with docker-compose.student.yml
## usage: sh api/build.sh
## ###
if [ -f docker-compose.student.yml ];then
   COMPOSE_DOCKER_CLI_BUILD=1 docker-compose -f docker-compose.student.yml build --no-cache api
else
   COMPOSE_DOCKER_CLI_BUILD=1 docker-compose build --no-cache api
fi
