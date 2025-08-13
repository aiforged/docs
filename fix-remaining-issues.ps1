# Map GitBook types to MkDocs admonition types
function Map-Type([string]$t) {
  switch ($t.ToLower()) {
    'note'      { 'note' }
    'info'      { 'info' }
    'tip'       { 'tip' }
    'success'   { 'success' }
    'warning'   { 'warning' }
    'important' { 'warning' }   # no native 'important' -> warning
    'danger'    { 'danger' }
    'error'     { 'danger' }
    default     { 'note' }
  }
}

# Indent block content by 4 spaces for admonition body
function Indent-Block([string]$s) {
  $lines = $s -split '\r?\n'
  $indented = $lines | ForEach-Object {
    if ([string]::IsNullOrEmpty($_)) { '    ' } else { '    ' + $_ }
  }
  return ($indented -join "`n")
}

$docsRoot = (Resolve-Path -LiteralPath "docs").Path
$changed = $false
$totalConverted = 0

# Regex options: IgnoreCase + Singleline (dot matches newlines) + Multiline not needed
$opts = [System.Text.RegularExpressions.RegexOptions]::IgnoreCase -bor `
        [System.Text.RegularExpressions.RegexOptions]::Singleline

Get-ChildItem -Path $docsRoot -Recurse -Filter *.md -File | ForEach-Object {
  $path = $_.FullName
  $text = Get-Content -Raw -LiteralPath $path -Encoding utf8
  $out  = $text

  # 1) {% hint style="info" %} ... {% endhint %}  (accepts " or ' quotes)
  $rxHint = New-Object System.Text.RegularExpressions.Regex `
    '{%\s*hint\s+style\s*=\s*["'']([^"''\r\n]+)["'']\s*%}\s*(.*?)\s*{%\s*endhint\s*%}', $opts

  $out = $rxHint.Replace($out, {
    param($m)
    $kind = Map-Type $m.Groups[1].Value
    $body = Indent-Block $m.Groups[2].Value
    "!!! $kind`n$body"
  })

  # 2) {% note %}...{% endnote %}, {% warning %}...{% endwarning %}, etc.
  $rxSimple = New-Object System.Text.RegularExpressions.Regex `
    '{%\s*(note|info|tip|success|warning|important|danger|error)\s*%}\s*(.*?)\s*{%\s*end\1\s*%}', $opts

  $out = $rxSimple.Replace($out, {
    param($m)
    $kind = Map-Type $m.Groups[1].Value
    $body = Indent-Block $m.Groups[2].Value
    "!!! $kind`n$body"
  })

  if ($out -ne $text) {
    Set-Content -LiteralPath $path -Value $out -Encoding utf8
    Write-Host "Converted GitBook hints to admonitions in: $path"
    $changed = $true
    $totalConverted++
  }
}