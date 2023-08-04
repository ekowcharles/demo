FROM gradle:8.2-jdk17-alpine AS FIRST_IMAGE

COPY . /app/demo

WORKDIR /app/demo

RUN gradle build

EXPOSE 9099

CMD ["java", "-jar", "/app/demo/build/libs/demo-0.0.1-SNAPSHOT.jar"]


FROM eclipse-temurin:8u382-b05-jre-focal

COPY --from=FIRST_IMAGE /app/demo/build/libs/demo-0.0.1-SNAPSHOT.jar /app/demo

EXPOSE 9099

CMD ["java", "-jar", "/app/demo/build/libs/demo-0.0.1-SNAPSHOT.jar"]