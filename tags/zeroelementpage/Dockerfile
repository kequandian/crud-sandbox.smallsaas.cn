FROM daocloud.io/library/node:12 as web

WORKDIR /usr/src
RUN git -c http.sslVerify=false clone --depth 1 https://github.com.cnpmjs.org/kequandian/zero-element-admin --branch page --single-branch web

WORKDIR /usr/src/web

RUN npm config set registry https://registry.npm.taobao.org
# RUN --mount=type=cache,id=node_modules_cache,target=/usr/src/node_modules,rw npm install --production
RUN --mount=type=cache,id=node_modules_cache,target=/usr/src/node_modules,rw npm install

#final-stage
FROM daocloud.io/library/node:12.18-alpine
COPY --from=web /usr/src/web /usr/src/web
WORKDIR /usr/src/web

## why not git pull origin every restart
CMD [ "npm", "start" ]
