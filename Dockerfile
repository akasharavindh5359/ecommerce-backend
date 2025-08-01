# Step 1: Use OpenJDK image
FROM openjdk:17-jdk-slim

# Step 2: Set working directory
WORKDIR /app

# Step 3: Copy jar file
COPY target/*.jar app.jar

# Step 4: Expose port
EXPOSE 8080

# Step 5: Run the jar
ENTRYPOINT ["java", "-jar", "app.jar"]
