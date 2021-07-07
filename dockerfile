FROM maven:3-openjdk-11 as builder
WORKDIR /app
COPY . .
RUN mvn install -DskipTests

#permet de prendre une image moins lourde à build
FROM openjdk:11-slim
WORKDIR /app
COPY --from=builder /app/target/teamder-back-0.0.1-SNAPSHOT.jar . 
CMD ["java", "-jar", "teamder-back-0.0.1-SNAPSHOT.jar"]