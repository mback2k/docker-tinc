FROM mback2k/alpine:latest

RUN addgroup -g 655 -S tinc
RUN adduser -u 655 -h /etc/tinc -s /bin/false -S -D -G tinc tinc

RUN apk --no-cache --update upgrade && apk --no-cache add coreutils net-tools
RUN apk --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ add tinc-pre

EXPOSE 655/tcp 655/udp

VOLUME /etc/tinc

ENV TINC_USER=tinc
ENV TINC_NETNAME=.

ADD docker-entrypoint.d/ /run/docker-entrypoint.d/

CMD ["/usr/local/sbin/tincd"]
