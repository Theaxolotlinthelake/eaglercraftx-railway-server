FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY . .
EXPOSE 25565
CMD ["java", "-Xmx1G", "-Xms1G", "-jar", "server.jar", "nogui"]
