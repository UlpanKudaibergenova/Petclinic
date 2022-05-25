FROM maven:3.6.0-jdk-11-slim AS builder
COPY . /app
WORKDIR /app
RUN mvn package


FROM openjdk:11-jre
WORKDIR /opt/app
COPY --from=builder /app ./
CMD ["java","-jar", "target/*.jar"]
