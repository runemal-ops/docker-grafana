FROM alpine:3.9
LABEL maintainer="runemal.services@gmail.com"
WORKDIR /opt
RUN apk add wget gzip
RUN mkdir grafana
ENV GRAFANA_VERSION=grafana-latest
ENV OS_ARCH="x64"
ENV OS_CLIB="musl"
RUN wget https://dl.grafana.com/oss/release/${GRAFANA_VERSION}.linux-${OS_ARCH}-${OS_CLIB}.tar.gz && tar -zxvf ${GRAFANA_VERSION}.linux-${OS_ARCH}-${OS_CLIB}.tar.gz -C grafana --strip-components=1
ENTRYPOINT ["/opt/grafana/bin/grafana-server"]