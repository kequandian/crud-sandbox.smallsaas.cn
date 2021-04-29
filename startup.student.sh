#!/bin/sh
COMPOSE_DOCKER_CLI_BUILD=1 docker-compose -f docker-compose.student.yml up --build --remove-orphans --detach

