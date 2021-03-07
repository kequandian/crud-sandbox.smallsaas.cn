#env-stage
FROM daocloud.io/library/node:12 as env
# ./src/assets/json/masterResource/config/masterResource-setting.json'

WORKDIR /usr/src

# ## get latest code from github.com
RUN npm install --save git://github.com/kequandian/zero-json.git#master
RUN npm install --save kequandian/hub.crudless.zerocode
# #install-stage
RUN npm config set registry https://registry.npm.taobao.org
#cli: zero-json
WORKDIR /usr/src/node_modules/zero-json
RUN npm install
RUN npm link
#cli: hub.crudless.zerocode
WORKDIR /usr/src/node_modules/crudless
RUN npm install
RUN npm link


#final-stage
# FROM daocloud.io/library/node:12.18-alpine
# COPY --from=env /usr/src/* /usr/src/
# COPY --from=env /usr/local/lib/node_modules /usr/local/lib/node_modules
# COPY --from=env /usr/local/bin/crudless /usr/local/bin/crudless
# COPY --from=env /usr/local/bin/zero-json /usr/local/bin/zero-json


# # gen BUILD json
#WORKDIR /usr/src/web/yml
#RUN crudless -f ./crudless.yml --json
# # gen page
#WORKDIR /usr/src/web
#RUN zero-json manage crud masterResource -i ./yml/build.json -o ./src/pages

# #表示将当前文件夹下所有yml文件生成到abc文件夹目录下，目录可自定义
# #RUN crudless --input ./yml --output ./src/pages 
COPY ./entrypoint.sh /usr/local/bin/entrypoint.sh
WORKDIR /web
ENTRYPOINT ["sh", "/usr/local/bin/entrypoint.sh"]
