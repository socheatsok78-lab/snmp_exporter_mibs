ARG SNMP_EXPORTER_VERSION=main

FROM --platform=$BUILDPLATFORM golang:bookworm AS snmp_exporter
RUN apt-get update \
    && apt-get install -y --no-install-recommends libsnmp-dev unzip
ARG SNMP_EXPORTER_VERSION
ADD --keep-git-dir https://github.com/prometheus/snmp_exporter.git#${SNMP_EXPORTER_VERSION} /src
WORKDIR /src

FROM snmp_exporter AS make_generator
WORKDIR /src/generator
ARG TARGETARCH
ENV GOOS=linux
ENV GOARCH=${TARGETARCH}
RUN go build -o generator-${GOOS}-${GOARCH}

FROM --platform=$BUILDPLATFORM generator AS make_mibs
RUN make clean mibs

FROM scratch AS mibs
COPY --from=make_mibs /src/generator/mibs /

FROM scratch AS generator
ARG TARGETARCH
ARG GOOS=linux
ARG GOARCH=${TARGETARCH}
COPY --from=make_generator /src/generator/generator-${GOOS}-${GOARCH} /generator-${GOOS}-${GOARCH}
