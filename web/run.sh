#!/bin/sh
## start
docker-compose run --rm  --service-ports web npm start
# docker-compose run --rm  --service-ports --entrypoint sh web
