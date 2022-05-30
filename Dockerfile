FROM docker:latest
LABEL maintainer="PIN NOC <noc@pinbn.com>"
HEALTHCHECK --interval=15s --timeout=30s --retries=3 CMD curl --fail http://127.0.0.1/noop || exit 1
EXPOSE 80
WORKDIR /app/
COPY ./run.sh ./nginx.conf ./php-fpm.conf ./supervisord.conf /app/
COPY ./index.php /app/html/

# docker run --rm -it -p 1355:80 -v /var/run/docker.sock:/var/run/docker.sock dtc-dkr.corp.shufflingmadness.com:9443/docker-swarm-node-ls

RUN apk update && \
    apk add supervisor nginx php8-fpm dos2unix curl && \
    dos2unix /app/* && \
    apk del dos2unix && \
    rm -rf /var/cache/apk/*

CMD ["/bin/sh","/app/run.sh"]