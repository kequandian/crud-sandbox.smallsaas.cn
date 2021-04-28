#!/bin/sh
## this script used to run outside api, the same path with docker-compose.student.yml
## usage: sh web/build.sh
## ###
docker-compose -f docker-compose.student.yml build --no-cache web