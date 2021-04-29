#!/bin/sh
# notes:
#  -- to share volume with node-gateway
out='/usr/share/web/src/pages'
if [ -d $out ];then
  ## means shared with node gateway
  echo “cp -r /usr/src/web/src/pages/* $out”
  cp -r /usr/src/web/src/pages/* $out

  mv /usr/src/web/src/pages /var/tmp
  ln -s $out /usr/src/web/src/pages
fi

## fix $out/index.js
fix="$out/index.js"
pageName=$(basename $(ls /var/tmp/*.crudlesscli))  # get file name with extention .crudlesscli
pageName=${pageName%.crudlesscli}   # get file name withotu extention .crudlesscli
#PageName=$(echo $pageName | sed -e "s/\b\(.\)/\u\1/g")  #get file name without  extention .crudlesscli
echo pageName=$pageName

#replace
echo "sed -i s/masterResource/$pageName/g $fix"
sed -i s/masterResource/$pageName/g $fix
sed -i s/MasterResource/$PageName/g $fix

# start
#npm start
$@
