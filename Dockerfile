FROM eclipse-temurin:17-jdk

# Set display port to avoid errors
ENV DISPLAY=:99

# Copy your app jar
ARG JAR_FILE=hrms-app-1.0-runner.jar
COPY ${JAR_FILE} app.jar

EXPOSE 2126
ENTRYPOINT ["java", "-Xmx256m", "-XX:+UseG1GC", "-Dquarkus.http.port=2126", "-jar", "/app.jar"]
