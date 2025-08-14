param(
  [string]$DocsRoot = "docs",
  [switch]$DryRun = $false
)

$ErrorActionPreference = "Stop"

# Resolve docs root
$docsPath = (Resolve-Path -LiteralPath $DocsRoot).Path

# Fenced code blocks (``` or ~~~)
$rxFence = '^\s*(```|~~~)'
# The exact bad line (case-insensitive, leading/trailing spaces allowed)
$rxBadLine = '^(?i)\s*IgnoreCase\s+Multiline\s+IgnoreCase\s+Multiline\s*$'

$files = Get-ChildItem -Path $docsPath -Recurse -Filter *.md -File
$filesChanged = 0
$totalLinesRemoved = 0

foreach ($f in $files) {
  $raw = Get-Content -Raw -LiteralPath $f.FullName -Encoding utf8

  # Detect line ending and final newline
  $useCRLF = $raw -match "`r`n"
  $hadFinalNewline = $raw -match "(?:\r?\n)$"
  $joiner = $useCRLF ? "`r`n" : "`n"

  # Split with Regex.Split to preserve trailing empty last line
  $lines = [System.Text.RegularExpressions.Regex]::Split($raw, "\r?\n")
  $out = New-Object System.Collections.Generic.List[string]
  $inFence = $false
  $removed = 0

  for ($i = 0; $i -lt $lines.Count; $i++) {
    $line = $lines[$i]

    if ($line -match $rxFence) { $inFence = -not $inFence }

    if (-not $inFence -and $line -match $rxBadLine) {
      $removed++
      continue
    }

    $out.Add($line)
  }

  if ($removed -gt 0) {
    $new = [string]::Join($joiner, $out)

    # Restore final newline if it existed in original
    if ($hadFinalNewline -and $new -notmatch "(?:\r?\n)$") {
      $new += $joiner
    }

    if (-not $DryRun) {
      Set-Content -LiteralPath $f.FullName -Value $new -Encoding utf8
      Write-Host "Cleaned $removed line(s) in: $($f.FullName)"
    } else {
      Write-Host "[DryRun] Would remove $removed line(s) in: $($f.FullName)"
    }

    $filesChanged++
    $totalLinesRemoved += $removed
  }
}

if ($filesChanged -gt 0) {
  if (-not $DryRun) {
    Write-Host "Updated $filesChanged file(s). Removed $totalLinesRemoved stray line(s)."
  } else {
    Write-Host "[DryRun] $filesChanged file(s) would be updated. $totalLinesRemoved stray line(s) would be removed."
  }
} else {
  Write-Host "No stray lines found."
}