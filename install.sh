#!/usr/bin/env bash
# install.sh — Install the Codex Development Agency into your Codex home
set -e

CODEX_HOME="${CODEX_HOME:-$HOME/.codex}"
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing Codex Development Agency into $CODEX_HOME ..."

# Create target directories
mkdir -p "$CODEX_HOME/skills"
mkdir -p "$CODEX_HOME/agents"

# Copy skills
cp -r "$REPO_DIR/skills/"* "$CODEX_HOME/skills/"

# Copy agent definitions
cp "$REPO_DIR/agents/"*.toml "$CODEX_HOME/agents/"

# Merge AGENTS.md rule block
AGENTS_TARGET="$CODEX_HOME/AGENTS.md"
MARKER_BEGIN="<!-- codex-development-agency:begin -->"
MARKER_END="<!-- codex-development-agency:end -->"

if [ -f "$AGENTS_TARGET" ] && grep -q "$MARKER_BEGIN" "$AGENTS_TARGET"; then
  echo "AGENTS.md: agency block already present — skipping merge."
else
  echo "" >> "$AGENTS_TARGET"
  cat "$REPO_DIR/AGENTS.md" >> "$AGENTS_TARGET"
  echo "AGENTS.md: agency block appended."
fi

echo ""
echo "Done! The following roles are now available:"
echo "  coordinator  →  development-agency skill (main chat)"
echo "  developer    →  agency-developer agent + agency-development skill"
echo "  reviewer     →  agency-reviewer agent + agency-review skill"
echo "  tester       →  agency-tester agent + agency-testing skill"
echo "  ui/ux        →  agency-ui-ux agent + agency-ui-ux skill"
echo ""
echo "Restart Codex to pick up the new skills and agents."
