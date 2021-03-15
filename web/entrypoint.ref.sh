#!/bin/sh

# notes:
#  -- to share volume with node-gateway


# ./assets/json/masterResource/config/masterResource-setting.json'


# COPY --from=env /web/src/pages ./src/pages
# COPY --from=env /web/yml ./src/assets/yml
out=$1
if [ $out ];then
  if [ -d $out ];then
    # settingName=$(basename $(ls ./src/pages/*/config/*-setting.json))
    # pageName=${settingName%-*}

    # if [ ! -d ./src/assets/json/ ];then
      # mkdir -p $out/src/assets/json
    # fi

    # cp ./src/pages/$pageName/config/*-setting.json  $out/src/assets/json/$pageName/config

    cp -r ./assets $out
  fi
fi


# start
npm start
