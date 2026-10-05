FROM eclipse-temurin:8-jre-alpine


RUN apk add --no-cache bash rsync curl


WORKDIR /server_template


RUN curl -L -o server.jar "https://github.com"

WORKDIR /server


CMD rm -f /server/server.jar && \
    rsync -va --ignore-existing /server_template/ /server/ && \
    java -Xmx2G -jar server.jar nogui
