# install.ps1 - Install the Claude Code Development Agency into your Claude config directory (Windows)
param(
    [string]$ClaudeHome = $(if ($env:CLAUDE_CONFIG_DIR) { $env:CLAUDE_CONFIG_DIR } else { "$env:USERPROFILE\.claude" })
)

$RepoDir = $PSScriptRoot
$ErrorActionPreference = "Stop"

Write-Host "Installing Claude Code Development Agency into $ClaudeHome ..."

# Create target directories
New-Item -ItemType Directory -Force -Path "$ClaudeHome\skills" | Out-Null
New-Item -ItemType Directory -Force -Path "$ClaudeHome\agents" | Out-Null

# Copy skills
Copy-Item -Recurse -Force "$RepoDir\skills\*" "$ClaudeHome\skills\"

# Copy agent definitions
Copy-Item -Force "$RepoDir\agents\*.md" "$ClaudeHome\agents\"

# Merge CLAUDE.md rule block
$ClaudeTarget = "$ClaudeHome\CLAUDE.md"
$MarkerBegin  = "<!-- claude-development-agency:begin -->"

if ((Test-Path $ClaudeTarget) -and (Select-String -Path $ClaudeTarget -Pattern $MarkerBegin -SimpleMatch -Quiet)) {
    Write-Host "CLAUDE.md: agency block already present -- skipping merge."
} else {
    Add-Content -Path $ClaudeTarget -Value "" -Encoding UTF8
    Add-Content -Path $ClaudeTarget -Value (Get-Content "$RepoDir\CLAUDE.md" -Raw -Encoding UTF8) -Encoding UTF8
    Write-Host "CLAUDE.md: agency block appended."
}

Write-Host ""
Write-Host "Done! The following roles are now available:"
Write-Host "  coordinator  ->  development-agency skill (main chat)"
Write-Host "  developer    ->  agency-developer agent + agency-development skill"
Write-Host "  reviewer     ->  agency-reviewer agent + agency-review skill"
Write-Host "  tester       ->  agency-tester agent + agency-testing skill"
Write-Host "  ui/ux        ->  agency-ui-ux agent + agency-ui-ux skill"
Write-Host ""
Write-Host "Start a new Claude Code session to pick up the new skills and agents."
