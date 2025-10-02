## Quarkus JAVA Run
# FROM eclipse-temurin:17-jdk

# # Set display port to avoid errors
# ENV DISPLAY=:99

# # Copy your app jar
# ARG JAR_FILE=hrms-app-1.0-runner.jar
# COPY ${JAR_FILE} app.jar

# EXPOSE 8080
# ENTRYPOINT ["java", "-Xmx256m", "-XX:+UseG1GC", "-jar", "/app.jar"]

## Quarkus Native Run
# Use a minimal base image (no JDK needed)
FROM registry.access.redhat.com/ubi8/ubi-minimal:8.7

WORKDIR /app

# Copy the zipped binary into the image
COPY hrms-runner.zip /app/

# Install unzip (ubi-minimal doesn't include it by default)
RUN microdnf install -y unzip && microdnf clean all

# Unzip the runner
RUN unzip hrms-runner.zip && mv hrms-app-1.0-runner application && rm hrms-runner.zip

# Ensure it's executable
RUN chmod +x /app/application

# Railway provides PORT env variable
ENV PORT=8080
EXPOSE 8080

# Run the native executable
CMD ["./application"]
