# AI agent handoff — rustdevops

Reusable Rust quality and Tauri Linux bundle workflows. Callers pin a commit or tag and pass the same value as `devops_ref`.

## Pins

| Item | Value |
|------|-------|
| Published tag | 1.1.0 (`649b2e39ffaad24105b3012ad399dcc24922220c`) |
| guardrails | 1.17.0 (`9a17ebb269a5ab02899570dd3e40fb72e50ad762`) |
| github-scaffold | 1.14.0 (`da8942edf17a0d2736d297c90338fd78b7ec31fb`) |
| commondevops | docs, secrets, and scorecard `1c621c43` (v6.7.0). Infra-lint and pins `0e78652fa9f65b9d98033ac82bf9e5308ebb17a7` |
| Rust image | `rust:1.85-slim-bookworm@sha256:9f841bbe9e7d8e37ceb96ed907265a3a0df7f44e3737d0b100e7907a679acb36` |
| Node image | `node:24-bookworm-slim@sha256:dc26ae92c9fb15cf6b1d63e20f0944b2efe0f115b20e00be48fb23fceb061c54` |
| Toolchain action | `dtolnay/rust-toolchain@39008827e6b4319a349e9a42dfc90579dd25f1ca` |

## Commands

```bash
sh scripts/check-ci-local.sh
```

## Known pitfalls

`cargo install` of llvm-cov, audit, and deny is pinned by version and runs on the GitHub runner. There is no Rust pack yet, so the coverage input defaults to 95 lines. Windows, macOS, and updater signing stay inputs on `tauri-build`. The quality and Tauri workflows use rustc 1.89. cargo-audit is 0.23.0 and cargo-deny is 0.21.0. cargo-deny 0.18 cannot parse current advisory-db entries such as RUSTSEC-2026-0245. cargo-deny 0.22 needs rustc 1.95. 0.21.2 cannot parse current advisory-db entries such as RUSTSEC-2026-0245. `rusqlite` 0.41, which bundles the patched SQLite, needs 1.89.

`tauri-build` 1.0.1 installs `libxdo-dev`. Without it the Linux bundle fails with `cannot find -lxdo`.

`ci.yml` infra-lint must grant `packages: read`. The reusable workflow declares that permission (CI-028). A caller that grants only `contents: read` fails at startup with no jobs.

*Last updated: 2026-11-23 — 1.1.0. Guardrails 1.17.0. Scaffold 1.14.0. Docs, secrets, and scorecard pin commondevops v6.7.0. Infra-lint and pins stay on `0e78652f`.*

*Last updated: 2026-11-21 — cargo-deny 0.21.0 parses the current advisory database on rustc 1.89.*
