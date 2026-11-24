# Changelog

All notable changes to this project are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.3.0] - 2026-11-24

### Added

- Self-CI calls `ops-repo-ci` from commondevops v6.10.0. A Friday schedule runs the same reusable with Scorecard.
- The Tauri build caches npm from the frontend lockfile.

### Fixed

- The upload-artifact comment names v7.0.2, the tag of the pinned commit.

## [1.2.0] - 2026-11-24

### Added

- `ci.yml` calls `rust-quality` on `fixtures/smoke`.

### Changed

- Self-CI pins commondevops v6.9.0.
- `gitsubmodule` is outside the multi-ecosystem Dependabot group (SC-DEP-004).
- The security policy names private vulnerability reporting.
- `dtolnay/rust-toolchain` carries a version comment.

## [1.1.0] - 2026-11-21

### Added

- `ci.yml` runs doc verification, scaffold verification, secret scanning, and Scorecard.
- Dependabot updates are one multi-ecosystem group.

### Removed

- The unused Dockerfile. Workflows install Rust 1.89.0 with `dtolnay/rust-toolchain`.

### Changed

- `docs/guardrails` is 1.17.0 and `.github/scaffold` is 1.14.0.
- `checkout_token` is passed to the caller checkout.

## [1.0.0] - 2026-11-20

### Added

- `rust-quality.yml` runs fmt, clippy, llvm-cov, cargo-audit, and cargo-deny.
- `tauri-build.yml` builds a Linux bundle. Signing is off unless a key is set.
- Digest-pinned Rust 1.85 and Node 24 CI image running as uid 10001.
