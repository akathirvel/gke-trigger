FROM openjdk:17-jdk
RUN mkdir /opt/app
COPY build/libs/*.jar /opt/app/app.jar
CMD ["java", "-jar", "/opt/app/app.jar"]
