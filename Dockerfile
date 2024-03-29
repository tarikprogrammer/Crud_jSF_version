# Étape de construction
FROM maven:3.8.5-openjdk-21 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Étape de déploiement
FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=build /app/target/classes/com/entreprise/crud_jsf /app
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]

