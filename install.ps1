# install.ps1 - Install the Codex Development Agency into your Codex home (Windows)
param(
    [string]$CodexHome = "$env:USERPROFILE\.codex"
)

$RepoDir = $PSScriptRoot
$ErrorActionPreference = "Stop"

Write-Host "Installing Codex Development Agency into $CodexHome ..."

# Create target directories
New-Item -ItemType Directory -Force -Path "$CodexHome\skills" | Out-Null
New-Item -ItemType Directory -Force -Path "$CodexHome\agents" | Out-Null

# Copy skills
Copy-Item -Recurse -Force "$RepoDir\skills\*" "$CodexHome\skills\"

# Copy agent definitions
Copy-Item -Force "$RepoDir\agents\*.toml" "$CodexHome\agents\"

# Merge AGENTS.md rule block
$AgentsTarget = "$CodexHome\AGENTS.md"
$MarkerBegin  = "<!-- codex-development-agency:begin -->"

if ((Test-Path $AgentsTarget) -and (Select-String -Path $AgentsTarget -Pattern $MarkerBegin -Quiet)) {
    Write-Host "AGENTS.md: agency block already present -- skipping merge."
} else {
    Add-Content -Path $AgentsTarget -Value ""
    Add-Content -Path $AgentsTarget -Value (Get-Content "$RepoDir\AGENTS.md" -Raw)
    Write-Host "AGENTS.md: agency block appended."
}

Write-Host ""
Write-Host "Done! The following roles are now available:"
Write-Host "  coordinator  ->  development-agency skill (main chat)"
Write-Host "  developer    ->  agency-developer agent + agency-development skill"
Write-Host "  reviewer     ->  agency-reviewer agent + agency-review skill"
Write-Host "  tester       ->  agency-tester agent + agency-testing skill"
Write-Host "  ui/ux        ->  agency-ui-ux agent + agency-ui-ux skill"
Write-Host ""
Write-Host "Restart Codex to pick up the new skills and agents."
