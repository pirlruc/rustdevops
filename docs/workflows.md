# Workflows

The Rust toolchain is 1.89.0 in `rust-quality.yml` and `tauri-build.yml`.

## ci.yml

| Job | Reusable |
| --- | --- |
| infra-lint | `common-infra-lint` |
| pins | `common-pins-verify` |
| docs | `common-doc-verify` with `run_hygiene: true` |
| scaffold | `common-scaffold-verify` |
| secrets-sast | `common-secrets-sast` |
| scorecard | `common-scorecard` (advisory) |

## rust-quality.yml

Clippy denies warnings. Coverage fails under 95% lines. `cargo audit` and `cargo deny` run after the tests.
