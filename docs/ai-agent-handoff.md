# AI agent handoff — rustdevops

Reusable Rust quality and Tauri Linux bundle workflows. Callers pin a commit or tag and pass the same value as `devops_ref`.

## Pins

| Item | Value |
|------|-------|
| guardrails | 1.15.0 (`2d4bb70e95449f6922781716857adeb22badf676`) |
| github-scaffold | 1.12.0 (`9c443ea978851768f451b1df2020dd86dfb1a967`) |
| commondevops | `0e78652fa9f65b9d98033ac82bf9e5308ebb17a7` |
| Rust image | `rust:1.85-slim-bookworm@sha256:9f841bbe9e7d8e37ceb96ed907265a3a0df7f44e3737d0b100e7907a679acb36` |
| Node image | `node:24-bookworm-slim@sha256:dc26ae92c9fb15cf6b1d63e20f0944b2efe0f115b20e00be48fb23fceb061c54` |
| Toolchain action | `dtolnay/rust-toolchain@39008827e6b4319a349e9a42dfc90579dd25f1ca` |

## Commands

```bash
sh scripts/check-ci-local.sh
```

## Known pitfalls

`cargo install` of llvm-cov, audit, and deny is pinned by version and runs on the GitHub runner. There is no Rust pack yet, so the coverage input defaults to 95 lines. Windows, macOS, and updater signing stay inputs on `tauri-build`. cargo-audit is 0.23.0. 0.21.2 cannot parse current advisory-db entries such as RUSTSEC-2026-0245 and fails before it reports findings.

`tauri-build` 1.0.1 installs `libxdo-dev`. Without it the Linux bundle fails with `cannot find -lxdo`.

`ci.yml` infra-lint must grant `packages: read`. The reusable workflow declares that permission (CI-028). A caller that grants only `contents: read` fails at startup with no jobs.

*Last updated: 2026-11-21 — cargo-audit 0.23.0 parses the current advisory database.*
