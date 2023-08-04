FROM gradle:8.2-jdk17-alpine AS FIRST_IMAGE

COPY . /app/demo

WORKDIR /app/demo

RUN gradle build -x test

FROM gradle:8.2-jdk17-alpine

COPY --from=FIRST_IMAGE /app/demo/build/libs/demo-0.0.1-SNAPSHOT.jar /app/demo/demo.jar

CMD ["/opt/java/openjdk/bin/java", "-jar", "/app/demo/demo.jar"]