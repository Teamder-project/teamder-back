FROM maven:3-openjdk-11

COPY . .
RUN mvn -v
RUN mvn install -DskipTests

CMD ["java", "-jar", "./target/teamder-back-0.0.1-SNAPSHOT.jar"]