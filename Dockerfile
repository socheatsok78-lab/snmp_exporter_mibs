ARG SNMP_EXPORTER_VERSION=main

FROM --platform=$BUILDPLATFORM golang:bookworm AS snmp_exporter
RUN apt-get update \
    && apt-get install -y --no-install-recommends libsnmp-dev unzip
ARG SNMP_EXPORTER_VERSION
ADD --keep-git-dir https://github.com/prometheus/snmp_exporter.git#${SNMP_EXPORTER_VERSION} /src
WORKDIR /src/generator
RUN make mibs

FROM scratch
COPY --from=snmp_exporter /src/generator/mibs /
