#!/bin/sh
# notes:
#  -- to share volume with node-gateway
out='/usr/share/web/src/pages'  # save original pages
share='/usr/src/web/.node'
if [ ! -f $share ];then
  echo "cp -r $out/* ./src/pages"
  cp -r $out/* ./src/pages
  touch $share
  ls $share
fi

## fix $out/index.js
if [ ! -f *.crudlesscli ];then
  fix="./src/pages/index.js"
  pageName=$(basename $(ls /var/tmp/*.crudlesscli))  # get file name with extention .crudlesscli
  pageName=${pageName%.crudlesscli}   # get file name withotu extention .crudlesscli
  #PageName=$(echo $pageName | sed -e "s/\b\(.\)/\u\1/g")  #get file name without  extention .crudlesscli
  echo pageName=$pageName

  #replace
  echo "sed -i s/masterResource/$pageName/g $fix"
  sed -i s/masterResource/$pageName/g $fix
  sed -i s/MasterResource/$PageName/g $fix

  touch .crudlesscli
  ls .crudlesscli
fi

# start
#npm start
$@
