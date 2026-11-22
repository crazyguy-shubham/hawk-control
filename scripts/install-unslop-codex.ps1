# Install the project's verified copy of Unslop as a user-level Codex skill.
# Run from a local clone of hawk-control. No admin privileges or network needed.
[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$source = Join-Path $PSScriptRoot '..\.agents\skills\unslop'
$skillFile = Join-Path $source 'SKILL.md'
if (-not (Test-Path -LiteralPath $skillFile -PathType Leaf)) {
    throw "The repository's Unslop skill is missing. Clone or download the complete repository first."
}

$destinationParent = Join-Path $HOME '.agents\skills'
$destination = Join-Path $destinationParent 'unslop'
New-Item -ItemType Directory -Path $destinationParent -Force | Out-Null

if (Test-Path -LiteralPath $destination) {
    $backup = "$destination.backup-$(Get-Date -Format 'yyyyMMdd-HHmmss')"
    Move-Item -LiteralPath $destination -Destination $backup
    Write-Output "Previous Unslop copy backed up to $backup"
}

Copy-Item -LiteralPath $source -Destination $destination -Recurse -Force
if (-not (Test-Path -LiteralPath (Join-Path $destination 'SKILL.md') -PathType Leaf)) {
    throw 'Installation check failed: SKILL.md is missing from the target.'
}

Write-Output "Unslop installed in $destination"
Write-Output 'Restart Codex if the skill does not appear, then ask: $unslop audit this dashboard'
