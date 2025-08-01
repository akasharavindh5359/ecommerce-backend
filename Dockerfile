# Step 1: Build the jar
FROM maven:3.9.6-eclipse-temurin-17 AS build

WORKDIR /app

# Copy Maven files first for dependency caching
COPY pom.xml .
COPY mvnw* ./ 
COPY .mvn .mvn

RUN mvn dependency:go-offline

# Copy source and build
COPY src ./src
RUN mvn clean package -DskipTests

# Step 2: Run the jar
FROM openjdk:17-jdk-slim

WORKDIR /app

# Copy the jar from build stage
COPY --from=build /app/target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
