#!/bin/sh
#docker run --rm -it --entrypoint bash crud_sandbox_api_cg

root=()
if [ $(uname) == 'Darwin' ];then
  root=$(greadlink -f $0)
else
  root=$(readlink -f $0)
fi 
root=$(dirname $root)
cd $root

docker-compose -f ../docker-compose.apionly.yml up
