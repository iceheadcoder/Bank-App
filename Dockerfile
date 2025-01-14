FROM maven:3-eclipse-temurin-17 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-alpine
COPY --from=build /target/*.jar bankapp.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","bankapp.jar"]