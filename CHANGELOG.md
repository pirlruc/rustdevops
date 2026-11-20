# Changelog

All notable changes to this project are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.0.0] - 2026-11-20

### Added

- `rust-quality.yml` runs fmt, clippy, llvm-cov, cargo-audit, and cargo-deny.
- `tauri-build.yml` builds a Linux bundle. Signing is off unless a key is set.
- Digest-pinned Rust 1.85 and Node 24 CI image running as uid 10001.
