#!/bin/sh
# notes:
#  -- to share volume with node-gateway
out='/usr/src/web/src/pages'
if [ ! $(ls $out) ];then
  echo cp -r /usr/share/web/src/pages/* $out 
  cp -r /usr/share/web/src/pages/* $out
  find $out
fi

## fix $out/index.js
fix="$out/index.js"
pageName=$(basename $(ls /var/tmp/*.crudlesscli))
pageName=${pageName%.crudlesscli}
PageName=$(echo $pageName | sed -e "s/\b\(.\)/\u\1/g")

#replace
sed -i s/masterResource/$pageName/g $fix
sed -i s/MasterResource/$PageName/g $fix

# start
#npm start
$@
