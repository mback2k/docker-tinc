FROM registry.uxnr.de/debian:experimental

MAINTAINER Marc Hoersken "info@marc-hoersken.de"

RUN apt-get update && \
    apt-get install -y \
        net-tools \
        supervisor && \
    apt-get install -y \
        -t experimental tinc && \
    apt-get clean

EXPOSE 655/tcp 655/udp

VOLUME /etc/tinc

ENV TINC_NETNAME=.

ADD docker-entrypoint.d/ /run/docker-entrypoint.d/

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD ["supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
