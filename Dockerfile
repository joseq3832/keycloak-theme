FROM maven:3-openjdk-11 as customEvent
WORKDIR /app
COPY events/onRegister /app
RUN mvn clean install

FROM openjdk:11-jre-slim

WORKDIR /final

COPY --from=customEvent /app/target/onRegister.jar .
