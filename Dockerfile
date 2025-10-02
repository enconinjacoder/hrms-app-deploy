FROM eclipse-temurin:17-jdk

# Set display port to avoid errors
ENV DISPLAY=:99

# Copy your app jar
ARG JAR_FILE=hrms-app-1.0-runner.jar
COPY ${JAR_FILE} app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-Xmx256m", "-XX:+UseG1GC", "-jar", "/app.jar"]