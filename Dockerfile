# Этап 1: Сборка JAR с помощью Maven
FROM maven:3.9-eclipse-temurin-17 AS builder
WORKDIR /build
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Этап 2: Запуск приложения
FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=builder /build/target/*.jar Bank_REST.jar
ENTRYPOINT ["java","-jar","Bank_REST.jar"]