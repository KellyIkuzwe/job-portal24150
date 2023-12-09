FROM maven:3.6.3-openjdk-17 AS build
COPY. .
RUN mvn clean package -DskipTests
FROM openjdk:17-ea-18-jdk-slim
COPY --from=build /target/Job-Portal-main=0.0.1=SNAPSHOT.jar Job-Portal-main.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","Job-Portal-main.jar"]
