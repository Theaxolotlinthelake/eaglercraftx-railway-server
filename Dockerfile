FROM eclipse-temurin:8-jre-alpine


RUN apk add --no-cache bash rsync wget


WORKDIR /server_template
COPY . .


RUN wget -O server.jar https://github.com

WORKDIR /server

CMD rm -f /server/server.jar && \
    rsync -va --ignore-existing /server_template/ /server/ && \
    java -Xmx2G -jar server.jar nogui
