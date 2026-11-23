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

The toolchain is Rust 1.89.0, installed by `dtolnay/rust-toolchain` in `rust-quality.yml` and `tauri-build.yml`. WebKit libraries for a Tauri bundle are installed on the GitHub runner.

## Documentation

- [Workflows](docs/workflows.md)
