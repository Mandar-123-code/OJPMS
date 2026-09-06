FROM maven:3.9.16-eclipse-temurin-25 AS build

WORKDIR /app

COPY pom.xml .

RUN mvn dependency:go-offline -B

COPY src ./src

RUN mvn clean package -DskipTests

FROM eclipse-temurin:25-jre

WORKDIR /app

COPY --from=build /app/target/*.war app.war

EXPOSE 10000

ENTRYPOINT ["java", "-jar", "app.war"]