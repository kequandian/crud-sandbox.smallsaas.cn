#env-stage
FROM crudlesscli as cli
# COPY ./entrypoint.sh /usr/local/bin/entrypoint.sh
# WORKDIR /web
# ENTRYPOINT ["sh", "/usr/local/bin/entrypoint.sh"]

COPY ./crudless.yml  /crudless.yml
RUN sh /usr/local/bin/entrypoint.sh /crudless.yml  /var

#final-stage
FROM zeroelementpage
COPY --from=cli /var/src/pages ./src/pages

CMD [ "npm", "start" ]
