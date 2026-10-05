FROM eclipse-temurin:17-jre-alpine


RUN apk add --no-cache bash rsync


WORKDIR /server_template
COPY . .


WORKDIR /server


CMD rsync -va --ignore-existing /server_template/ /server/ && \
    if [ ! -f "server.jar" ] && [ -f "paper.jar" ]; then mv paper.jar server.jar; fi && \
    java -Xmx2G -jar server.jar nogui
