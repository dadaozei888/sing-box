FROM debian:13-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates curl \
    && curl -Lo /tmp/sb.tar.gz https://github.com/SagerNet/sing-box/releases/download/v1.14.2/sing-box-1.14.2-linux-amd64.tar.gz \
    && tar xzf /tmp/sb.tar.gz -C /usr/local/bin --strip-components=1 \
    && rm /tmp/sb.tar.gz \
    && apt-get purge -y curl \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

COPY config.json /etc/sing-box/config.json

EXPOSE 8080

CMD ["/usr/local/bin/sing-box", "run", "-c", "/etc/sing-box/config.json"]
