FROM zelejs/zerocodegenerator:latest as gencode
ARG SCHEMA_SQL
ARG SCHEMA_DESC 
ARG MODULE_NAME

#### gencode-stage
WORKDIR /usr/src
COPY ${SCHEMA_SQL} ${SCHEMA_SQL}
COPY ${SCHEMA_DESC} ${SCHEMA_DESC}
RUN bash /usr/local/bin/cli.sh ${MODULE_NAME} ${SCHEMA_SQL} ${SCHEMA_DESC}

## workaround for resource
#add schema.sql into resource for initialize
COPY ${SCHEMA_SQL} ./${MODULE_NAME}/src/main/resources/sql
## end 


#build-stage
FROM zelejs/allin-web:alpine-m2 AS M2

#build-stage
FROM daocloud.io/library/maven:3.6.0-jdk-11-slim AS build

# init .m2 from alpine-m2 image first
WORKDIR /root/.m2
COPY --from=M2 /root/.m2 /root/m2
RUN --mount=type=cache,id=m2_cache,target=/root/.m2,rw cp -r /root/m2/* /root/.m2

## mvn package
WORKDIR /usr/src

COPY --from=gencode /usr/src/*/pom.xml  ./pom.xml
RUN --mount=type=cache,id=m2_cache,target=/root/.m2,rw mvn dependency:go-offline -Dmaven.main.skip=true -Dmaven.test.skip=true
# #RUN --mount=type=bind,source=./.m2,target=/root/.m2,rw mvn -o install

# # To package the usr/src/*application
COPY --from=gencode /usr/src/*/src ./src
RUN --mount=type=cache,id=m2_cache,target=/root/.m2,rw mvn -DskipStandalone=false package -Dmaven.test.skip=true

## final
#CMD ["sh", "-c", "/bin/cp /usr/src/target/*-standalone.jar /var/tmp"]

FROM adoptopenjdk:11-jre-hotspot
WORKDIR /webapps
COPY --from=gencode /usr/src/docker /usr/src/docker
COPY --from=build /usr/src/pom.xml /usr/src/pom.xml
COPY --from=build /usr/src/src /usr/src/src
COPY --from=build /usr/src/target/*-standalone.jar /webapps/app.jar

COPY ./api/config/application-dev.yml /webapps/config/application-dev.yml
CMD ["java", "-jar", "/webapps/app.jar", "--spring.profiles.active=dev", "--server.port=8080"]
