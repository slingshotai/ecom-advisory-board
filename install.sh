#!/usr/bin/env bash
#
# eCom Advisory Board — installer
# Copies the skill into ~/.claude/skills/ so Claude Code can discover it.
#
# Works two ways:
#   1. Locally (from a cloned repo):  bash install.sh
#   2. Remotely (over the network):   curl -fsSL <raw-url>/install.sh | bash
#
# Re-running this script is safe — it overwrites the installed skill with
# the latest version.

set -euo pipefail

INSTALL_DIR="${HOME}/.claude/skills/ecom-advisory-board"
REPO_RAW="https://raw.githubusercontent.com/slingshotai/ecom-advisory-board/main"
MEMBERS=(bezos buffett grove hormozi jobs matt walton)

if [[ ! -d "${HOME}/.claude" ]]; then
  echo "Error: ~/.claude/ does not exist. Is Claude Code installed?"
  exit 1
fi

mkdir -p "${INSTALL_DIR}/references"

# Detect mode: local (script sitting next to the files) vs remote (curl-piped)
SCRIPT_DIR=""
if [[ -n "${BASH_SOURCE[0]:-}" ]]; then
  SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" 2>/dev/null && pwd || echo "")"
fi

if [[ -n "${SCRIPT_DIR}" && -f "${SCRIPT_DIR}/SKILL.md" ]]; then
  echo "Installing from local source: ${SCRIPT_DIR}"
  cp "${SCRIPT_DIR}/SKILL.md" "${INSTALL_DIR}/SKILL.md"
  cp "${SCRIPT_DIR}/references/"*.md "${INSTALL_DIR}/references/"
else
  echo "Installing from ${REPO_RAW}"
  curl -fsSL "${REPO_RAW}/SKILL.md" -o "${INSTALL_DIR}/SKILL.md"
  for member in "${MEMBERS[@]}"; do
    curl -fsSL "${REPO_RAW}/references/${member}.md" -o "${INSTALL_DIR}/references/${member}.md"
  done
fi

echo ""
echo "eCom Advisory Board installed:"
echo "  ${INSTALL_DIR}"
echo ""
echo "Next: start a new Claude Code session and try one of these:"
echo "  - run this past the board: should I launch a subscription box?"
echo "  - advisory board: what's the smartest move for my brand next quarter?"
echo "  - DEEP DIVE Buffett — is this acquisition worth it?"
echo ""
echo "On first use Claude will ask a few quick questions about your business"
echo "and save the answers to ~/.claude/ecom-advisory-board/my-business.md."
