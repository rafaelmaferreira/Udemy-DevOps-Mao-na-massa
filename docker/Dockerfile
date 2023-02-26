FROM openjdk:8-jdk-alpine
RUN addgroup -S notes && adduser -D notes -G notes
USER notes:notes
ARG JAR_FILE=*.jar
COPY ${JAR_FILE} easy-note.jar
COPY application.properties application.properties
ENTRYPOINT ["JAVA", "-jar", "easy-note.jar"]