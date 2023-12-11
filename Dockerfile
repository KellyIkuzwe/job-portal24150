FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests -e -X

FROM openjdk:17.0.1-jdk-slim
WORKDIR /app
COPY --from=build /app/target/Job-Portal-main-0.0.1-SNAPSHOT.jar Job-Portal-main.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "Job-Portal-main.jar"]
