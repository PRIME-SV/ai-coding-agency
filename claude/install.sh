#!/usr/bin/env bash
# install.sh — Install the Claude Code Development Agency into your Claude config directory
set -e

CLAUDE_HOME="${CLAUDE_CONFIG_DIR:-$HOME/.claude}"
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing Claude Code Development Agency into $CLAUDE_HOME ..."

# Create target directories
mkdir -p "$CLAUDE_HOME/skills"
mkdir -p "$CLAUDE_HOME/agents"

# Copy skills
cp -r "$REPO_DIR/skills/"* "$CLAUDE_HOME/skills/"

# Copy agent definitions
cp "$REPO_DIR/agents/"*.md "$CLAUDE_HOME/agents/"

# Merge CLAUDE.md rule block
CLAUDE_TARGET="$CLAUDE_HOME/CLAUDE.md"
MARKER_BEGIN="<!-- claude-development-agency:begin -->"

if [ -f "$CLAUDE_TARGET" ] && grep -q "$MARKER_BEGIN" "$CLAUDE_TARGET"; then
  echo "CLAUDE.md: agency block already present — skipping merge."
else
  echo "" >> "$CLAUDE_TARGET"
  cat "$REPO_DIR/CLAUDE.md" >> "$CLAUDE_TARGET"
  echo "CLAUDE.md: agency block appended."
fi

echo ""
echo "Done! The following roles are now available:"
echo "  coordinator  →  development-agency skill (main chat)"
echo "  developer    →  agency-developer agent + agency-development skill"
echo "  reviewer     →  agency-reviewer agent + agency-review skill"
echo "  tester       →  agency-tester agent + agency-testing skill"
echo "  ui/ux        →  agency-ui-ux agent + agency-ui-ux skill"
echo ""
echo "Start a new Claude Code session to pick up the new skills and agents."
