#!/bin/sh

#swagger-stage
##

# 寻找同级目录 swagger/swagger.json 
#zero-json swagger format

#zero-json swagger ls # 复制 列表api 如 /api/crud/masterResource/masterResources

# 粘贴上一步复制的 api, 执行命令 生成 test.yml
#zero-json swagger yaml test --API /api/crud/masterResource/masterResources


#page-stage
## gen web
# zero-json manage init web
input=$1
output=$2
if [ ! $input ];then
  input='./crudless.yml'
fi
if [ ! $output ];then
  output='.'
fi

## just end if no input
if [ ! -f $input ];then
  exit
fi

## gen BUILD json
crudless -f $input --json

pageName=$(basename $(ls *.json))
pageName=${pageName%.json}

# gen page
zero-json manage crud $pageName -i ./$pageName.json -o $output/src/pages
mkdir $output/yml && cp $input $output/yml

## touch $pageName, for getting pageName
touch /var/tmp/$pageName.crudlesscli


# # mv setting.json into assets
# cd  $output
# mkdir -p ./assets/json/$pageName/config
# cp ./src/pages/$pageName/config/*-setting.json ./assets/json/$pageName/config
# # cp crudless.yml
# mkdir -p ./assets/yml
# cp $input ./assets/yml
