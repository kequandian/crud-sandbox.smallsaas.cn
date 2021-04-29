#!/bin/sh
## start
# docker-compose run --rm busybox curl http://web:8000
# docker-compose run --rm busybox curl http://api:8080/api/crud/masterResource/masterResources
# docker-compose run --rm busybox curl http://nodegateway:8080/api/json/gen/list/masterResource

## nginx
# docker-compose run --rm busybox curl http://nginx:80/api/crud/masterResource/masterResources
# docker-compose run --rm busybox curl http://nginx:80/api/json/gen/list/masterResource

## localhost
docker-compose run --rm busybox curl http://localhost:8080/api/crud/masterResource/masterResources

