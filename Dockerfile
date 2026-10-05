FROM eclipse-temurin:8-jre-alpine

# Install dependencies
RUN apk add --no-cache bash rsync curl

# Setup template layout
WORKDIR /server_template
COPY . .

# 1. Download Paper 1.8.8 server jar file
RUN curl -L -o server.jar "https://github.com"

# 2. Build the plugins folder structure and inject EaglercraftX WebSocket handler
RUN mkdir -p plugins && \
    curl -L -o plugins/EaglercraftXServer.jar "https://github.com"

WORKDIR /server

# Clear previous broken jar logs, sync files, and start up
CMD rm -f /server/server.jar && \
    rsync -va --ignore-existing /server_template/ /server/ && \
    java -Xmx2G -jar server.jar nogui
