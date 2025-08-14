param(
  [string]$DocsRoot = "docs",
  [switch]$DryRun = $false,
  [switch]$IncludeSimpleWrappers = $true # convert <div><img/></div> and <p><img/></p> too
)

$ErrorActionPreference = "Stop"

# Resolve docs root
$docsPath = (Resolve-Path -LiteralPath $DocsRoot).Path

# Regex for fences
$rxFence = '^\s*(```|~~~)'

# Patterns (Singleline + IgnoreCase), anchored at line start to avoid inline HTML
# 1) <div?><figure><img ...></figure></div?>
$patFigure = '(?ms)^(?<indent>[ \t]*)(?:<div[^>]*>\s*)?<figure\b[^>]*>\s*(?<img><img\b[^>]*?/?>)\s*(?:<figcaption\b[^>]*>[\s\S]*?</figcaption>\s*)?</figure>\s*(?:</div>)?\s*$'
# 2) Optional simple wrappers around a single <img>
$patWrapper = '(?ms)^(?<indent>[ \t]*)(?:<(?:div|p)\b[^>]*>)\s*(?<img><img\b[^>]*?/?>)\s*</(?:div|p)>\s*$'

# Helpers to extract attributes
function Get-ImgAttr {
  param([string]$imgTag, [string]$name)
  $m = [Regex]::Match($imgTag, "(?i)\b$name\s*=\s*""([^""]*)""")
  if (-not $m.Success) { $m = [Regex]::Match($imgTag, "(?i)\b$name\s*=\s*'([^']*)'") }
  if ($m.Success) { return $m.Groups[1].Value } else { return "" }
}

# Decode HTML entities in alt text
Add-Type -AssemblyName System.Net
function HtmlDecode([string]$s) { [System.Net.WebUtility]::HtmlDecode($s) }

$files = Get-ChildItem -Path $docsPath -Recurse -Filter *.md -File
$changedFiles = 0

foreach ($f in $files) {
  $raw = Get-Content -Raw -LiteralPath $f.FullName -Encoding utf8
  $useCRLF = $raw -match "`r`n"

  # Split into lines to track fences and rebuild
  $lines = $raw -split '\r?\n'
  $outLines = New-Object System.Collections.Generic.List[string]
  $buf = New-Object System.Collections.Generic.List[string]
  $inFence = $false
  $touched = $false

  function Flush-Buffer {
    param([ref]$bufRef, [ref]$outRef, [ref]$touchedRef)
    if ($bufRef.Value.Count -eq 0) { return }
    $text = ($bufRef.Value -join "`n")
    $origText = $text

    # Replace figure blocks
    $count1 = [Regex]::Matches($text, $patFigure, 'IgnoreCase, Singleline').Count
    if ($count1 -gt 0) {
      $text = [Regex]::Replace($text, $patFigure, {
        param($m)
        $indent = $m.Groups['indent'].Value
        $imgTag = $m.Groups['img'].Value
        $src = Get-ImgAttr $imgTag 'src'
        $alt = HtmlDecode (Get-ImgAttr $imgTag 'alt')
        if ([string]::IsNullOrWhiteSpace($src)) { return $m.Value } # safety: skip if no src
        if ($alt -ne '') { return "$indent![$alt]($src)" } else { return "$indent![]($src)" }
      }, 'IgnoreCase, Singleline')
    }

    # Replace simple wrappers if enabled
    if ($IncludeSimpleWrappers) {
      $count2 = [Regex]::Matches($text, $patWrapper, 'IgnoreCase, Singleline').Count
      if ($count2 -gt 0) {
        $text = [Regex]::Replace($text, $patWrapper, {
          param($m)
          $indent = $m.Groups['indent'].Value
          $imgTag = $m.Groups['img'].Value
          $src = Get-ImgAttr $imgTag 'src'
          $alt = HtmlDecode (Get-ImgAttr $imgTag 'alt')
          if ([string]::IsNullOrWhiteSpace($src)) { return $m.Value }
          if ($alt -ne '') { return "$indent![$alt]($src)" } else { return "$indent![]($src)" }
        }, 'IgnoreCase, Singleline')
      }
    }

    if ($text -ne $origText) { $touchedRef.Value = $true }

    # Push back to outLines as separate lines (preserve trailing empty line if present)
    foreach ($l in [System.Text.RegularExpressions.Regex]::Split($text, "`n")) {
      $outRef.Value.Add($l)
    }

    # Clear buffer
    $bufRef.Value.Clear() | Out-Null
  }

  for ($i=0; $i -lt $lines.Count; $i++) {
    $line = $lines[$i]

    if ($line -match $rxFence) {
      # Before toggling fence, flush content buffer
      Flush-Buffer ([ref]$buf) ([ref]$outLines) ([ref]$touched)
      $inFence = -not $inFence
      $outLines.Add($line)
      continue
    }

    if ($inFence) {
      # Pass through code block lines
      $outLines.Add($line)
    } else {
      $buf.Add($line)
    }
  }

  # Flush any remaining buffer
  Flush-Buffer ([ref]$buf) ([ref]$outLines) ([ref]$touched)

  if ($touched) {
    $joiner = $useCRLF ? "`r`n" : "`n"
    $newText = [string]::Join($joiner, $outLines)

    if (-not $DryRun) {
      Set-Content -LiteralPath $f.FullName -Value $newText -Encoding utf8
      Write-Host "Converted figures in: $($f.FullName)"
    } else {
      Write-Host "[DryRun] Would convert figures in: $($f.FullName)"
    }
    $changedFiles++
  }
}

if ($changedFiles -gt 0) {
  if (-not $DryRun) {
    Write-Host "Updated $changedFiles file(s)."
    Write-Host "Tip: run 'mkdocs build --strict' to validate."
  } else {
    Write-Host "[DryRun] $changedFiles file(s) would be updated."
  }
} else {
  Write-Host "No figure/image wrappers found to convert."
}