ARG BUILD_FROM=ghcr.io/hassio-addons/base/amd64:11.0.0
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Setup base
# hadolint ignore=DL3003
RUN \
    apk add --no-cache \
        openresolv=3.12.0-r0 \
        openconnect

# Copy root filesystem
COPY rootfs /

# Build arguments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

# Labels
LABEL \
    io.hass.name="OpenConnect Client" \
    io.hass.description="Fast, modern, secure VPN tunnel (Client)" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="LadDev <https://github.com/LadDev>" \
    org.opencontainers.image.title="OpenConnect Client" \
    org.opencontainers.image.description="Fast, modern, secure VPN tunnel" \
    org.opencontainers.image.vendor="Home Assistant Community Add-ons" \
    org.opencontainers.image.authors="LadDev <https://github.com/LadDev>" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.url="https://addons.community" \
    org.opencontainers.image.source="https://github.com/LadDev/addon-openconnect-client" \
    org.opencontainers.image.documentation="https://github.com/LadDev/addon-openconnect-client/blob/main/openconnect_client/CHANGELOG.md" \
    org.opencontainers.image.created=${BUILD_DATE} \
    org.opencontainers.image.revision=${BUILD_REF} \
    org.opencontainers.image.version=${BUILD_VERSION}
