# Étape de construction





# Étape de construction
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Étape de déploiement
FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=build /app/target/ROOT.war ./app.war
EXPOSE 8080
CMD ["java", "-jar", "app.war"]



