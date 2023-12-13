# Stage 1: Build the application
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /JobPortal

# Copy the settings.xml file
COPY settings.xml /usr/share/maven/ref/settings.xml

COPY . .
RUN mvn clean package -DskipTests -e -X

# Stage 2: Create the final image
FROM openjdk:17.0.1-jdk-slim
WORKDIR /JobPortal

COPY --from=build /JobPortal/target/JobPortal-0.0.1-SNAPSHOT.jar JobPortal.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "JobPortal.jar"]
