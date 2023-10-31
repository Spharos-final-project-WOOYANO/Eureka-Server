FROM openjdk:17-alpine
COPY --from=builder build/libs/*.jar app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]
