FROM alpine:3.14

RUN apk add --no-cache tini

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/sbin/tini","--","/entrypoint.sh"]

CMD ["crond","-f","-l","2","-L","/dev/stdout"]
