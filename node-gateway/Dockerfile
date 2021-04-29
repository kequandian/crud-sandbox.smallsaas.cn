FROM daocloud.io/library/node:12 as node
# ./src/assets/json/masterResource/config/masterResource-setting.json'

ENV NODE_ENV=production

WORKDIR /usr/src

## get source from github.com
RUN npm install --save "https://github.com/kequandian/node-gateway.git"
WORKDIR /usr/src/node_modules/gateway

RUN mkdir -p src/assets && touch ./src/assets/db.json
RUN npm install

#COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
#RUN npm install --production --silent && mv node_modules ../
#COPY . .

#final-stage
FROM daocloud.io/library/node:12.18-alpine
WORKDIR /usr/share
COPY --from=node /usr/src/node_modules/gateway .
WORKDIR /usr/share

CMD [ "npm", "start" ]
