#!/bin/sh
# Local parity for the workflow lint this repository runs on GitHub.
set -eu

ROOT="$(CDPATH= cd -- "$(dirname "$0")/.." && pwd)"
cd "${ROOT}"

echo "==> submodule pins"
sh scripts/check-submodule-pins.sh

if command -v actionlint >/dev/null 2>&1; then
	echo "==> actionlint"
	actionlint .github/workflows/*.yml
else
	echo "actionlint is not on PATH; GitHub infra-lint still runs it" >&2
fi

if command -v shellcheck >/dev/null 2>&1; then
	echo "==> shellcheck"
	shellcheck scripts/*.sh
fi

if command -v hadolint >/dev/null 2>&1; then
	echo "==> hadolint"
	hadolint Dockerfile
fi

echo "check-ci-local: ok"
