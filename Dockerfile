FROM openjdk:17-alpine
COPY build/libs/server-0.0.1-SNAPSHOT.jar var/jenkins/workspace/build/libs/app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]
