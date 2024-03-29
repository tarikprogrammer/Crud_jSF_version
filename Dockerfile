# Étape de construction
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Étape de déploiement
FROM tomcat:9.0-jdk17-openjdk-slim
COPY --from=build /app/target/classes  ./ROOT
EXPOSE 8080







