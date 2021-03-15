#!/bin/sh
# notes:
#  -- to share volume with node-gateway

out=$1
if [ $out ];then
  if [ -d $out ];then
      # script entrypoint.sh
      # 1# mv  ./src .yml to $output
      # 2# soft link to $output
      # 3# npm start
      
      cp -r /usr/share/web/src/pages $out/
      cp -r /usr/src/web/src/pages/* $out/pages

      rm -rf /usr/src/web/src/pages
      ln -s $out/pages /usr/src/web/src/pages
      
  fi
fi

# start
npm start
