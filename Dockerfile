FROM alpine:latest

LABEL maintainer="Swapnil Desai"

RUN \
    apk --update-cache add kafkacat

COPY ./docker-entrypoint.sh /

RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["sh", "/docker-entrypoint.sh"]

# CMD ["--help"]
