FROM node:26-bookworm-slim@sha256:5df79989ed685e09f0a98019db4cebfb22fb9df1a53c0161664a011f7ff6b0f1 AS node

FROM rust:1.85-slim-bookworm@sha256:9f841bbe9e7d8e37ceb96ed907265a3a0df7f44e3737d0b100e7907a679acb36

COPY --from=node /usr/local /usr/local

RUN useradd --uid 10001 --create-home --shell /usr/sbin/nologin app
USER 10001
WORKDIR /work
