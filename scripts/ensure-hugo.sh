#!/usr/bin/env bash
# Downloads a pinned Hugo Extended binary into .hugo/ if needed, then prints its path.
set -euo pipefail

HUGO_VERSION="0.154.5"
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BIN_DIR="${ROOT}/.hugo"
HUGO_BIN="${BIN_DIR}/hugo"

if [[ -x "${HUGO_BIN}" ]]; then
  installed="$("${HUGO_BIN}" version 2>/dev/null || true)"
  if [[ "${installed}" == *"${HUGO_VERSION}"* ]]; then
    printf '%s\n' "${HUGO_BIN}"
    exit 0
  fi
fi

os="$(uname -s | tr '[:upper:]' '[:lower:]')"
arch="$(uname -m)"
case "${arch}" in
  x86_64|amd64) arch="amd64" ;;
  arm64|aarch64) arch="arm64" ;;
  *)
    echo "Unsupported CPU architecture: ${arch}" >&2
    exit 1
    ;;
esac

download() {
  local url="$1"
  local out="$2"
  if command -v curl >/dev/null 2>&1; then
    curl -fsSL "${url}" -o "${out}"
  elif command -v wget >/dev/null 2>&1; then
    wget -qO "${out}" "${url}"
  else
    echo "Need curl or wget to download Hugo." >&2
    exit 1
  fi
}

mkdir -p "${BIN_DIR}"
tmpdir="$(mktemp -d)"
trap 'rm -rf "${tmpdir}"' EXIT

echo "Installing Hugo Extended ${HUGO_VERSION} into .hugo/ ..." >&2

case "${os}" in
  darwin)
    archive="hugo_extended_${HUGO_VERSION}_darwin-universal.pkg"
    url="https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${archive}"
    download "${url}" "${tmpdir}/${archive}"
    pkgutil --expand-full "${tmpdir}/${archive}" "${tmpdir}/pkg"
    mv "${tmpdir}/pkg/Payload/hugo" "${HUGO_BIN}"
    ;;
  linux)
    archive="hugo_extended_${HUGO_VERSION}_linux-${arch}.tar.gz"
    url="https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${archive}"
    download "${url}" "${tmpdir}/${archive}"
    tar -xzf "${tmpdir}/${archive}" -C "${tmpdir}" hugo
    mv "${tmpdir}/hugo" "${HUGO_BIN}"
    ;;
  *)
    echo "Unsupported OS: ${os}. Install Hugo Extended ${HUGO_VERSION} manually:" >&2
    echo "https://gohugo.io/installation/" >&2
    exit 1
    ;;
esac

chmod +x "${HUGO_BIN}"
printf '%s\n' "${HUGO_BIN}"
