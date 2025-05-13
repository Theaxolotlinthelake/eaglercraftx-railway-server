FROM openjdk:17
WORKDIR /app
COPY . .
EXPOSE 25565
CMD ["java", "-Xmx1G", "-Xms1G", "-jar", "server.jar", "nogui"]
