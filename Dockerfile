# Stage 1: Build the application
FROM maven:3.8.1-openjdk-11 AS builder

WORKDIR /Job-Portal-main

COPY pom.xml .
COPY src src

# Run Maven build with debugging and skipping tests
RUN mvn clean package -DskipTests -e -X

# Stage 2: Create the final image
FROM openjdk:11-jre-slim

WORKDIR /Job-Portal-main

COPY --from=builder /app/target/Job-Portal-main.jar Job-Portal-main.jar

EXPOSE 8080

CMD ["java", "-jar", "Job-Portal-main.jar"]

