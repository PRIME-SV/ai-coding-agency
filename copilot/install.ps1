# install.ps1 - Install the GitHub Copilot Development Agency into your Copilot config directory (Windows)
param(
    [string]$CopilotHome = $(if ($env:COPILOT_HOME) { $env:COPILOT_HOME } else { "$env:USERPROFILE\.copilot" })
)

$RepoDir = $PSScriptRoot
$ErrorActionPreference = "Stop"

Write-Host "Installing GitHub Copilot Development Agency into $CopilotHome ..."

# Create target directories
New-Item -ItemType Directory -Force -Path "$CopilotHome\skills" | Out-Null
New-Item -ItemType Directory -Force -Path "$CopilotHome\agents" | Out-Null

# Copy skills
Copy-Item -Recurse -Force "$RepoDir\skills\*" "$CopilotHome\skills\"

# Copy agent definitions
Copy-Item -Force "$RepoDir\agents\*.agent.md" "$CopilotHome\agents\"

# Merge copilot-instructions.md rule block
$InstructionsTarget = "$CopilotHome\copilot-instructions.md"
$MarkerBegin        = "<!-- copilot-development-agency:begin -->"

if ((Test-Path $InstructionsTarget) -and (Select-String -Path $InstructionsTarget -Pattern $MarkerBegin -SimpleMatch -Quiet)) {
    Write-Host "copilot-instructions.md: agency block already present -- skipping merge."
} else {
    Add-Content -Path $InstructionsTarget -Value "" -Encoding UTF8
    Add-Content -Path $InstructionsTarget -Value (Get-Content "$RepoDir\copilot-instructions.md" -Raw -Encoding UTF8) -Encoding UTF8
    Write-Host "copilot-instructions.md: agency block appended."
}

Write-Host ""
Write-Host "Done! The following roles are now available:"
Write-Host "  coordinator  ->  development-agency skill (main chat)"
Write-Host "  developer    ->  agency-developer agent + agency-development skill"
Write-Host "  reviewer     ->  agency-reviewer agent + agency-review skill"
Write-Host "  tester       ->  agency-tester agent + agency-testing skill"
Write-Host "  ui/ux        ->  agency-ui-ux agent + agency-ui-ux skill"
Write-Host ""
Write-Host "Start a new Copilot CLI session to pick up the new skills and agents."
