FROM openjdk:8u131-jdk-alpine
COPY ./ /app
RUN apk update &&\
  apk add maven
RUN cd /app &&\
  mvn clean package

FROM openjdk:8u131-jre

MAINTAINER Richard Chesterwood "richard@inceptiontraining.co.uk"

COPY --from=0 /app/target/positionsimulator-0.0.1-SNAPSHOT.jar webapp.jar

CMD ["java","-Xmx50m","-jar","webapp.jar"]
