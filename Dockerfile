FROM alpine:3.9.3

RUN apk update && apk add --no-cache curl
COPY scale.sh scale.sh

RUN chmod +x scale.sh

ENTRYPOINT ["/bin/sh","scale.sh"]