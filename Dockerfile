FROM debian:13-slim AS downloader
RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates curl \
    && curl -Lo /tmp/chisel.gz https://github.com/jpillora/chisel/releases/download/v1.10.1/chisel_1.10.1_linux_amd64.gz \
    && gunzip /tmp/chisel.gz \
    && chmod +x /tmp/chisel

FROM debian:13-slim
RUN apt-get update \
    && apt-get install -y --no-install-recommends nginx ca-certificates \
    && rm -rf /var/lib/apt/lists/*
COPY --from=downloader /tmp/chisel /usr/local/bin/chisel
COPY nginx.conf /etc/nginx/nginx.conf
COPY start.sh /start.sh
RUN chmod +x /start.sh \
    && mkdir -p /var/cache/nginx /var/log/nginx /run \
    && nginx -t -c /etc/nginx/nginx.conf
EXPOSE 8080
CMD ["/start.sh"]
