# Étape de construction
FROM maven:3.8.5-openjdk-21 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Étape de déploiement
FROM tomcat:9.0-jdk21-openjdk-slim
WORKDIR /usr/local/tomcat/webapps
COPY --from=build /app/target/classes/com/entreprise/crud_jsf ./ROOT
EXPOSE 8080

