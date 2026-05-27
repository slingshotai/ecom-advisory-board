#!/usr/bin/env bash
#
# eCom Advisory Board — installer
# Copies the skill into ~/.claude/skills/ so Claude Code can discover it.
#
# Re-running this script is safe — it overwrites the installed skill with
# the current version in this folder.

set -euo pipefail

SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INSTALL_DIR="${HOME}/.claude/skills/ecom-advisory-board"

if [[ ! -d "${HOME}/.claude" ]]; then
  echo "Error: ~/.claude/ does not exist. Is Claude Code installed?"
  exit 1
fi

mkdir -p "${INSTALL_DIR}/references"

cp "${SOURCE_DIR}/SKILL.md" "${INSTALL_DIR}/SKILL.md"
cp "${SOURCE_DIR}/references/"*.md "${INSTALL_DIR}/references/"

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
