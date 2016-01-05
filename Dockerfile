FROM debian:jessie

RUN apt-get update && \
    apt-get install -y curl cron haproxy --no-install-recommends && rm -rf /var/lib/apt/lists/* 

RUN mkdir /etc/haproxy-marathon-bridge/

COPY haproxy-marathon-bridge /haproxy-marathon-bridge 
COPY haproxy.cfg /etc/haproxy/haproxy.cfg
COPY start.sh /start

CMD ["/start"]

#CMD ["haproxy", "-f", "/etc/haproxy/haproxy.cfg", "-db"]

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]



