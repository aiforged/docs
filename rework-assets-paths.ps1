# Compute docs root
$docsRoot = (Resolve-Path -LiteralPath "docs").Path

# Helper: build prefix like "", "../", "../../" based on file depth relative to docs/
function Get-RelPrefix([string]$dirPath, [string]$rootPath) {
  $rel = $dirPath.Substring($rootPath.Length).TrimStart('\','/')
  if ([string]::IsNullOrEmpty($rel)) { return "" }
  $segments = $rel -split '[\\/]' | Where-Object { $_ -ne "" }
  return ("../" * $segments.Count)
}

$changed = $false

Get-ChildItem -Path $docsRoot -Recurse -Filter *.md -File | ForEach-Object {
  $file = $_.FullName
  $prefix = Get-RelPrefix -dirPath $_.DirectoryName -rootPath $docsRoot

  $content = Get-Content -Raw -LiteralPath $file -Encoding utf8
  $new = $content

  # Markdown-style links/images: ![alt](/assets/...) or [text](/assets/...)
  $new = [regex]::Replace($new, '\((\s*)/assets/', "($1$($prefix)assets/")

  # HTML img/src with double quotes: <img src="/assets/...">
  $new = $new -replace 'src="/assets/', "src=""$($prefix)assets/"

  # HTML img/src with single quotes: <img src='/assets/...'>
  $new = $new -replace "src='/assets/", "src='$($prefix)assets/"

  # HTML href with double quotes: <a href="/assets/...">
  $new = $new -replace 'href="/assets/', "href=""$($prefix)assets/"

  # HTML href with single quotes: <a href='/assets/...'>
  $new = $new -replace "href='/assets/", "href='$($prefix)assets/"

  if ($new -ne $content) {
    Set-Content -LiteralPath $file -Value $new -Encoding utf8
    Write-Host "Updated /assets paths in: $file"
    $changed = $true
  }
}

if ($changed) {
  git add -A
  git commit -m "Rewrite absolute /assets/ links to correct relative paths for MkDocs"
  git push
} else {
  Write-Host "No /assets/ paths found to rewrite."
}