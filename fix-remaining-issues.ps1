# CONFIG
# Only adjust inside list items and their continuations (recommended)
$OnlyInLists = $true

$docsRoot = (Resolve-Path -LiteralPath "docs").Path
$changed = $false
$filesChanged = 0

# Regex helpers
# Fenced code blocks (``` or ~~~)
$rxFence = '^\s*(```|~~~)'
# List starts: "- ", "* ", "+ ", or "1. "
$rxListStart = '^\s*(?:[-*+]\s|\d+\.\s)'
# Continuation lines: at least 2 leading spaces with non-space
$rxListCont  = '^\s{2,}\S'

# Lines that are ONLY slash markers, possibly spaced: "\" or "/ /" (keep indentation as empty line)
$rxOnlyMarkers = '^\s*(?:[\/\\](?:\s+[\/\\])*)\s*$'

# Trailing markers at EOL (allow no space before markers):
# Keep group 'keep' (everything before markers), drop markers (slashes and spaces)
$rxTrailingMarkers = '^(?<keep>.*?)(?<markers>(?:[\/\\](?:\s+[\/\\])*)\s*)$'

Get-ChildItem -Path $docsRoot -Recurse -Filter *.md -File | ForEach-Object {
  $p = $_.FullName
  $raw = Get-Content -Raw -LiteralPath $p -Encoding utf8

  # Preserve original line endings
  $useCRLF = $raw -match "`r`n"
  $lines   = $raw -split '\r?\n'
  $out     = New-Object System.Collections.Generic.List[string]

  $inFence = $false
  $inList  = $false
  $touched = $false

  for ($i = 0; $i -lt $lines.Count; $i++) {
    $line = $lines[$i]

    # Toggle fence state
    if ($line -match $rxFence) { $inFence = -not $inFence }

    # Track list context (outside fences)
    if (-not $inFence) {
      if ($line -match $rxListStart) {
        $inList = $true
      } elseif ([string]::IsNullOrWhiteSpace($line)) {
        $inList = $false
      } elseif ($line -match $rxListCont) {
        # continuation keeps inList as-is
      } else {
        $inList = $false
      }
    }

    # Skip within fenced code blocks
    if ($inFence) {
      $out.Add($line)
      continue
    }

    # If limiting scope to lists and we're not in a list, pass through
    if ($OnlyInLists -and -not $inList) {
      $out.Add($line)
      continue
    }

    # Case 1: line is ONLY markers -> convert to a blank line
    if ($line -match $rxOnlyMarkers) {
      $out.Add('')
      $touched = $true
      continue
    }

    # Case 2: trailing markers at end of a content line (no space required before markers)
    if ($line -match $rxTrailingMarkers) {
      $keep = $Matches['keep']

      # If there were any markers removed, write the cleaned line
      if ($keep -ne $line) {
        $out.Add($keep)
        $touched = $true
        continue
      }
    }

    # Default: unchanged
    $out.Add($line)
  }

  if ($touched) {
    $joiner = $useCRLF ? "`r`n" : "`n"
    $newText = [string]::Join($joiner, $out)
    if ($newText -ne $raw) {
      Set-Content -LiteralPath $p -Value $newText -Encoding utf8
      Write-Host "Normalized GitBook slash breaks in: $p"
      $changed = $true
      $filesChanged++
    }
  }
}
