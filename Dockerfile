FROM debian:stable-slim

ENV DNS64_PREFIX='64:ff9b:1::/48' \
    DNS64_IP6_LISTEN='any' \
    DNS64_LISTEN='any'

ADD docker-entry.sh /

RUN apt-get update && apt-get install -y bind9 && apt-get clean && chmod +x docker-entry.sh

ENTRYPOINT ["/docker-entry.sh"]

EXPOSE 53/udp 53/tcp

CMD ['/usr/sbin/named']
