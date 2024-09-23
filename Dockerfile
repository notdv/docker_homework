FROM alpine:latest

RUN apk update && apk add netcat-openbsd

COPY ./client_script.sh ./client_script.sh
COPY ./server_script.sh ./server_script.sh

RUN chmod +x client_script.sh server_script.sh

EXPOSE 80
