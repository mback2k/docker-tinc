FROM mback2k/debian:experimental

MAINTAINER Marc Hoersken "info@marc-hoersken.de"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        net-tools && \
    apt-get install -y --no-install-recommends \
        -t experimental tinc && \
    apt-get clean

RUN adduser --disabled-password --disabled-login --system --uid 655 --home /etc/tinc tinc

EXPOSE 655/tcp 655/udp

VOLUME /etc/tinc

ENV TINC_USER=tinc
ENV TINC_NETNAME=.

ADD docker-entrypoint.d/ /run/docker-entrypoint.d/

CMD ["/usr/local/sbin/tincd"]
