#!/bin/sh
## this script used to run outside api, the same path with docker-compose.student.yml
## usage: sh web/build.sh
## ###
if [ -f docker-compose.student.yml ];then
   docker-compose -f docker-compose.student.yml build --no-cache web
else
   docker-compose build --no-cache web
fi


