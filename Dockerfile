FROM --platform=$BUILDPLATFORM ghcr.io/socheatsok78-lab/snmp-exporter-generator:0.30.1 AS mibs

FROM scratch
COPY --from=mibs /opt/mibs /
