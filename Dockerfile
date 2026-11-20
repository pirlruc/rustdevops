FROM node:24-bookworm-slim@sha256:dc26ae92c9fb15cf6b1d63e20f0944b2efe0f115b20e00be48fb23fceb061c54 AS node

FROM rust:1.100-slim-bookworm@sha256:7c7d4eb4d05b7781187a327809466cfddf29753f6defdc3d19a0e291951b7a37

COPY --from=node /usr/local /usr/local

RUN useradd --uid 10001 --create-home --shell /usr/sbin/nologin app
USER 10001
WORKDIR /work
