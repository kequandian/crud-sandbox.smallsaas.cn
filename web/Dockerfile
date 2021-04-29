FROM registry.docker.internal:5000/crudlessnetcore:latest as cli
ARG SCHEMA_SQL
ARG TABLE_NAME

WORKDIR /app

### ADD schema.sql, from schema.sql to crudless.yml
COPY ${SCHEMA_SQL} ${SCHEMA_SQL}
## #

RUN /usr/bin/dotnet crudless.netcore.dll ${SCHEMA_SQL} ${TABLE_NAME} /var/tmp


#env-stage
FROM registry.docker.internal:5000/crudlesscli:latest as env
WORKDIR /web
COPY --from=cli /var/tmp/crudless.yml /web/crudless.yml

# zero-json manage init web
RUN crudless -f ./crudless.yml --json
# RUN echo 'pageName=$(basename $(ls *.json))' > run.sh
# RUN echo 'pageName=${pageName%.json}' >> run.sh
# RUN echo 'zero-json manage crud $pageName -i ./$pageName.json -o ./src/pages' >> run.sh
# # RUN echo 'mkdir -p yml && cp /web/crudless.yml ./yml/$pageName.yml' >> /tmp/run.sh
# RUN sh /tmp/run.sh
# RUN rm /tmp/run.sh
RUN sh /usr/local/bin/entrypoint.sh


#final-stage, run
FROM registry.docker.internal:5000/zeroelementpage:latest as pages
ARG ENTRY_SCRIPT

WORKDIR /usr/share/web
# get all pages within /usr/src/web/src/pages
RUN cp -r /usr/src/web/src/pages ./src
COPY --from=env /web/src/pages ./src/pages
COPY --from=env /web/yml ./yml
## get pageName from /var/tmp/*.crudlesscli
COPY --from=env /var/tmp/*.crudlesscli /var/tmp

## clean original masterResource
# RUN if [ -d ./src/pages/masterResource ];then rm -rf ./src/pages/masterResource fi
#COPY --from=env /web/src/pages/*/config/*-setting.json ./assets/json/
#COPY ./web/entrypoint.sh /usr/local/bin/entrypoint.sh
WORKDIR /usr/src/web

COPY ${ENTRY_SCRIPT} /usr/local/bin/entrypoint.sh
ENTRYPOINT [ "sh", "/usr/local/bin/entrypoint.sh", "npm", "start" ]
# ENTRYPOINT [ "sh", "/usr/local/bin/entrypoint.sh" ]
