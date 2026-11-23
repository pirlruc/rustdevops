#!/bin/sh
# Workflow and secret scans inside ci-lint. POSIX sh. CI-008.
set -eu

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "${ROOT}"

IMAGE="${RUSTDEVOPS_CI_IMAGE:-ghcr.io/pirlruc/ci-lint@sha256:207ab77b5ced7d067cb03f7ad6a135a30cf60dfc4a0ed417f61589a7f3d48fc0}"

if ! command -v docker >/dev/null 2>&1; then
	echo "docker is required" >&2
	exit 1
fi

run() {
	echo "==> $1"
	docker run --rm -v "${ROOT}:/src" -w /src "${IMAGE}" "$@"
}

if [ -f .github/config/zizmor.yml ]; then
	run zizmor --min-severity=low -c .github/config/zizmor.yml .github/workflows
else
	run zizmor --min-severity=low .github/workflows
fi
if [ -f .gitleaks.toml ]; then
	run gitleaks detect --no-git --source . --redact --config .gitleaks.toml
else
	run gitleaks detect --no-git --source . --redact
fi
echo "Docker CI scans finished."
