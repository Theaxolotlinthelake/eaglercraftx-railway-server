FROM eclipse-temurin:8-jre-alpine


RUN apk add --no-cache bash rsync curl


WORKDIR /server_template
COPY . .
RUN curl -o server.jar https://papermc.io

WORKDIR /server


CMD rsync -va --ignore-existing /server_template/ /server/ && \
    java -Xmx2G -jar server.jar nogui
