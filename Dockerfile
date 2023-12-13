FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /JobPortal
COPY . .
RUN mvn -f path/to/pom.xml

FROM openjdk:17.0.1-jdk-slim
WORKDIR /JobPortal
COPY --from=build /JobPortal/target/JobPortal-0.0.1-SNAPSHOT.jar JobPortal.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "JobPortal.jar"]
