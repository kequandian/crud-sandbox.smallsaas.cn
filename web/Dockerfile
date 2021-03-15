FROM registry.docker.internal:5000/crudlessnetcore:latest as cli
ARG TABLE_NAME

WORKDIR /app
### ADD schema.sql, from schema.sql to crudless.yml
COPY ./cg-mysql-schema.sql /schema.sql
## #

RUN /usr/bin/dotnet crudless.netcore.dll /schema.sql ${TABLE_NAME} /var/tmp

#env-stage
FROM registry.docker.internal:5000/crudlesscli:latest as env
WORKDIR /web
COPY --from=cli /var/tmp/crudless.yml /web/crudless.yml

# zero-json manage init web
RUN crudless -f ./crudless.yml --json
RUN echo 'pageName=$(basename $(ls *.json))' > run.sh
RUN echo 'pageName=${pageName%.json}' >> run.sh
RUN echo 'zero-json manage crud $pageName -i ./$pageName.json -o ./src/pages' >> run.sh
RUN echo 'mkdir -p yml && cp /web/crudless.yml ./yml/$pageName.yml' >> /tmp/run.sh
RUN sh /tmp/run.sh
RUN rm /tmp/run.sh
RUN sh /usr/local/bin/entrypoint.sh

#final-stage, run
FROM registry.docker.internal:5000/zeroelementpage:latest
WORKDIR /usr/src/web
RUN rm -rf ./src/pages/masterResource
COPY --from=env /web/src ./src
COPY --from=env /web/assets ./assets
#COPY --from=env /web/src/pages/*/config/*-setting.json ./assets/json/
# CMD [ "npm", "start" ]

## entrypoint
COPY ./web/entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT [ "sh", "/usr/local/bin/entrypoint.sh" ]
