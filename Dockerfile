FROM node:24-bookworm-slim@sha256:dc26ae92c9fb15cf6b1d63e20f0944b2efe0f115b20e00be48fb23fceb061c54 AS node

FROM rust:1.85-slim-bookworm@sha256:9f841bbe9e7d8e37ceb96ed907265a3a0df7f44e3737d0b100e7907a679acb36

COPY --from=node /usr/local /usr/local

RUN useradd --uid 10001 --create-home --shell /usr/sbin/nologin app
USER 10001
WORKDIR /work
