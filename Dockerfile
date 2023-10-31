FROM openjdk:17-alpine
COPY build/libs/*.jar /var/jenkins_home/workspace/test/
ENTRYPOINT ["java", "-jar", "/app.jar"]
