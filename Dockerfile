FROM debian:13-slim AS downloader
RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates curl \
    && curl -Lo /tmp/sb.tar.gz https://github.com/SagerNet/sing-box/releases/download/v1.14.2/sing-box-1.14.2-linux-amd64.tar.gz \
    && tar xzf /tmp/sb.tar.gz -C /tmp --strip-components=1 \
    && rm /tmp/sb.tar.gz

FROM scratch
COPY --from=downloader /tmp/sing-box /usr/local/bin/sing-box
COPY config.json /etc/sing-box/config.json
CMD ["/usr/local/bin/sing-box", "run", "-c", "/etc/sing-box/config.json"]
