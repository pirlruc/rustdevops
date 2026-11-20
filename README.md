# rustdevops

Reusable GitHub Actions quality gates for Rust projects and Tauri bundles.

`rust-quality.yml` runs `cargo fmt`, clippy with warnings denied, `cargo llvm-cov` (line floor 95), `cargo audit`, and `cargo deny`. `tauri-build.yml` builds a Linux bundle. Signing is off unless the caller sets `signing: true` and provides `TAURI_SIGNING_PRIVATE_KEY`.

```yaml
jobs:
  rust-quality:
    permissions:
      contents: read
    uses: pirlruc/rustdevops/.github/workflows/rust-quality.yml@1.0.0
    with:
      devops_ref: 1.0.0
```

The CI image starts from digest-pinned Rust 1.85 slim and copies a digest-pinned Node 24. It runs as uid 10001. WebKit libraries for a Tauri bundle are installed on the GitHub runner, not in that image.

## Documentation

- [Handoff](docs/ai-agent-handoff.md)
