[CmdletBinding()]
param(
    [string]$SkillRoot
)

$ErrorActionPreference = 'Stop'
if ([string]::IsNullOrWhiteSpace($SkillRoot)) {
    $SkillRoot = Join-Path $PSScriptRoot '..\.github\skills'
}
$SkillRoot = (Resolve-Path -LiteralPath $SkillRoot).Path
$skillFiles = Get-ChildItem -LiteralPath $SkillRoot -Filter 'SKILL.md' -File -Recurse
if ($skillFiles.Count -eq 0) { throw "No SKILL.md found under $SkillRoot" }

$failures = [System.Collections.Generic.List[string]]::new()
foreach ($file in $skillFiles) {
    $content = Get-Content -LiteralPath $file.FullName -Raw -Encoding UTF8
    if ($content -notmatch '^(---\r?\n)(?<frontmatter>[\s\S]*?)\r?\n---\r?\n') {
        $failures.Add("$($file.FullName): missing valid YAML frontmatter.")
        continue
    }

    $frontmatter = $Matches.frontmatter
    $nameMatch = [regex]::Match($frontmatter, '(?m)^name:\s*(?<value>.+?)\s*$')
    $descriptionMatch = [regex]::Match($frontmatter, '(?m)^description:\s*(?<value>.+?)\s*$')
    $directoryName = Split-Path -Leaf (Split-Path -Parent $file.FullName)

    if (-not $nameMatch.Success) { $failures.Add("$($file.FullName): frontmatter requires name.") }
    elseif ($nameMatch.Groups['value'].Value -notmatch '^[a-z0-9]+(?:-[a-z0-9]+)*$') { $failures.Add("$($file.FullName): name must use lowercase letters, digits, and hyphens only.") }
    elseif ($nameMatch.Groups['value'].Value -ne $directoryName) { $failures.Add("$($file.FullName): name must match its directory ($directoryName).") }

    if (-not $descriptionMatch.Success -or [string]::IsNullOrWhiteSpace($descriptionMatch.Groups['value'].Value)) {
        $failures.Add("$($file.FullName): frontmatter requires a non-empty description.")
    }
    if ($content -match '(?im)\bTODO\b') { $failures.Add("$($file.FullName): remove TODO placeholders before publishing.") }
}

if ($failures.Count -gt 0) {
    $failures | ForEach-Object { Write-Error $_ }
    exit 1
}

Write-Host "Validated $($skillFiles.Count) skill(s): OK"
lli
