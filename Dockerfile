FROM gradle:8.2-jdk17-alpine

COPY . /app/demo

WORKDIR /app/demo

EXPOSE 9099

CMD ["gradle", "bootrun"]