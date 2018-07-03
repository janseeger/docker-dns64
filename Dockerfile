FROM debian

ENV DNS64_PREFIX='2a00:1508:6001:efff::/96' \
    DNS64_IP6_LISTEN='any' \
    DNS64_LISTEN='any'

ADD docker-entry.sh /

RUN apt-get update && apt-get install -y bind9 && apt-get clean && chmod +x docker-entry.sh

ENTRYPOINT ["/docker-entry.sh"]

EXPOSE 53/udp 53/tcp

CMD ['named']
