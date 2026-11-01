#!/usr/bin/env bash
# install.sh — Install the GitHub Copilot Development Agency into your Copilot config directory
set -e

COPILOT_DIR="${COPILOT_HOME:-$HOME/.copilot}"
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing GitHub Copilot Development Agency into $COPILOT_DIR ..."

# Create target directories
mkdir -p "$COPILOT_DIR/skills"
mkdir -p "$COPILOT_DIR/agents"

# Copy skills
cp -r "$REPO_DIR/skills/"* "$COPILOT_DIR/skills/"

# Copy agent definitions
cp "$REPO_DIR/agents/"*.agent.md "$COPILOT_DIR/agents/"

# Merge copilot-instructions.md rule block
INSTRUCTIONS_TARGET="$COPILOT_DIR/copilot-instructions.md"
MARKER_BEGIN="<!-- copilot-development-agency:begin -->"

if [ -f "$INSTRUCTIONS_TARGET" ] && grep -q "$MARKER_BEGIN" "$INSTRUCTIONS_TARGET"; then
  echo "copilot-instructions.md: agency block already present — skipping merge."
else
  echo "" >> "$INSTRUCTIONS_TARGET"
  cat "$REPO_DIR/copilot-instructions.md" >> "$INSTRUCTIONS_TARGET"
  echo "copilot-instructions.md: agency block appended."
fi

echo ""
echo "Done! The following roles are now available:"
echo "  coordinator  →  development-agency skill (main chat)"
echo "  developer    →  agency-developer agent + agency-development skill"
echo "  reviewer     →  agency-reviewer agent + agency-review skill"
echo "  tester       →  agency-tester agent + agency-testing skill"
echo "  ui/ux        →  agency-ui-ux agent + agency-ui-ux skill"
echo ""
echo "Start a new Copilot CLI session to pick up the new skills and agents."
