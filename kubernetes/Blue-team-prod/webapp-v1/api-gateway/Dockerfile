FROM openjdk:8u131-jdk-alpine
COPY ./ /app
RUN apk update &&\
  apk add maven
RUN cd /app &&\
  mvn clean package

#############

FROM openjdk:8u131-jdk-alpine

MAINTAINER Richard Chesterwood "contact@virtualpairprogrammers.com"

EXPOSE 8080

WORKDIR /usr/local/bin/

COPY --from=0 /app/target/fleetman-0.0.1-SNAPSHOT.jar webapp.jar

CMD ["java", "-Xmx50m","-jar","webapp.jar"]
