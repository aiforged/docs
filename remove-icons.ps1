# Run in the repository root
$paths = @()

# All Markdown files under docs/
if (Test-Path docs) {
  $paths += Get-ChildItem -Path docs -Recurse -Filter *.md -File
}

# mkdocs.yml at root (optional)
$mk = Get-Item -LiteralPath mkdocs.yml -ErrorAction SilentlyContinue
if ($mk) { $paths += $mk }

$changed = $false

foreach ($p in $paths) {
  $content = Get-Content -Raw -LiteralPath $p.FullName -Encoding utf8
  $new = [regex]::Replace($content, '(?m)^\s*icon:\s*.*\r?\n?', '')
  if ($new -ne $content) {
    Set-Content -LiteralPath $p.FullName -Value $new -Encoding utf8
    Write-Host "Updated: $($p.FullName)"
    $changed = $true
  }
}

if ($changed) {
  git add -A
  git commit -m "Remove unsupported icon: metadata to fix MkDocs Material build"
  git push
} else {
  Write-Host "No changes needed."
}