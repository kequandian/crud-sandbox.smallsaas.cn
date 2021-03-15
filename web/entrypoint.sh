#!/bin/sh
# notes:
#  -- to share volume with node-gateway
out='/usr/src/web/src/pages'
if [ ! $(ls $out) ];then
  echo cp -r /usr/share/web/src/pages/* $out 
  cp -r /usr/share/web/src/pages/* $out
  find $out
fi

# start
npm start
