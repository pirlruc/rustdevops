# AI agent handoff — rustdevops

Reusable Rust quality and Tauri Linux bundle workflows. Callers pin a commit or tag and pass the same value as `devops_ref`.

## Pins

| Item | Value |
|------|-------|
| Published tag | 1.2.0 (`39b9f24a81ff8e4663a96eff65177c00f96bccad`) |
| guardrails | 1.17.1 (`8508e93691aa3c4f769ecc215ddc83ecf26e70b2`) |
| github-scaffold | 1.14.2 (`615dbbcbe906d62a29e4f4e4118cb94cb119f5a5`) |
| commondevops | v6.10.0 (`a2af891c6d05fe2790bc5ddf761252c95185ce5f`) |
| Rust image | `rust:1.85-slim-bookworm@sha256:9f841bbe9e7d8e37ceb96ed907265a3a0df7f44e3737d0b100e7907a679acb36` |
| Node image | `node:24-bookworm-slim@sha256:dc26ae92c9fb15cf6b1d63e20f0944b2efe0f115b20e00be48fb23fceb061c54` |
| Toolchain action | `dtolnay/rust-toolchain@39008827e6b4319a349e9a42dfc90579dd25f1ca` |

## Commands

```bash
sh scripts/check-ci-local.sh
```

## Known pitfalls

`cargo install` of llvm-cov, audit, and deny is pinned by version and runs on the GitHub runner. There is no Rust pack yet, so the coverage input defaults to 95 lines. Windows, macOS, and updater signing stay inputs on `tauri-build`. The quality and Tauri workflows use rustc 1.89. cargo-audit is 0.23.0 and cargo-deny is 0.21.0. cargo-deny 0.18 cannot parse current advisory-db entries such as RUSTSEC-2026-0245. cargo-deny 0.22 needs rustc 1.95. 0.21.2 cannot parse current advisory-db entries such as RUSTSEC-2026-0245. `rusqlite` 0.41, which bundles the patched SQLite, needs 1.89.

`tauri-build` 1.0.1 installs `libxdo-dev`. Without it the Linux bundle fails with `cannot find -lxdo`. The workflow is `workflow_call` only. This repo has no Tauri app, so a `workflow_dispatch` smoke would fail at `npm ci`. The upload-artifact pin in that file is v7 and shipped in 1.2.0.

Dependabot clones the private submodules with `DEPENDABOT_GITHUB_TOKEN` through the `github-private` registry (CI-056).

`ci.yml` infra-lint must grant `packages: read`. The reusable workflow declares that permission (CI-028). A caller that grants only `contents: read` fails at startup with no jobs.

*Last updated: 2026-11-24 — 1.2.0. Dependabot gitsubmodule uses `DEPENDABOT_GITHUB_TOKEN`. `tauri-build` stays `workflow_call` because this repo has no Tauri app.*

*Last updated: 2026-11-24 — 1.3.0. Self-CI calls ops-repo-ci from commondevops v6.10.0. Friday security schedule. Tauri npm cache. Guardrails 1.17.1. Scaffold 1.14.2.*

*Last updated: 2026-11-23 — 1.1.0. Guardrails 1.17.0. Scaffold 1.14.0. Docs, secrets, and scorecard pin commondevops v6.7.0. Infra-lint and pins stay on `0e78652f`.*

*Last updated: 2026-11-21 — cargo-deny 0.21.0 parses the current advisory database on rustc 1.89.*
