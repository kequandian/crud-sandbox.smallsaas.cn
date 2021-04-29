#!/bin/sh
if [ -f docker-compose.student.yml ];then
   docker-compose -f docker-compose.student.yml run --rm api bash
else
   docker-compose run --rm api bash
fi
