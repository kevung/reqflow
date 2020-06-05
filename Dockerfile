FROM centralci/alpine-sdk:latest

ENV REQFLOW_SERVER https://github.com/goeb/reqflow
ENV REQFLOW_VERSION 1.6.0

RUN apk update && apk add pkgconfig zlib libzip libzip-dev libxml2 libxml2-dev poppler poppler-dev pcre \

  && curl -SLO "${REQFLOW_SERVER}/archive/v${REQFLOW_VERSION}.tar.gz" \

  && tar -xzf "/v${REQFLOW_VERSION}.tar.gz" \

  && cd "/reqflow-${REQFLOW_VERSION}" \
    && ./configure \
    && make \
    && make install \

  && rm -rf /reqflow* /var/lib/apt/lists/*
ENTRYPOINT ["reqflow"]
