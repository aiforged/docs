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

  # Markdown links/images: ![...](.gitbook/assets/...) or with ../ prefixes
  $new = [regex]::Replace($new, '\((\s*)(?:\.\./)*\.gitbook/assets/', "($1$($prefix)assets/")

  # HTML src/href with double quotes
  $new = [regex]::Replace($new, 'src="(?:\.\./)*\.gitbook/assets/', "src=""$($prefix)assets/")
  $new = [regex]::Replace($new, 'href="(?:\.\./)*\.gitbook/assets/', "href=""$($prefix)assets/")

  # HTML src/href with single quotes
  $new = [regex]::Replace($new, "src='(?:\.\./)*\.gitbook/assets/", "src='$($prefix)assets/")
  $new = [regex]::Replace($new, "href='(?:\.\./)*\.gitbook/assets/", "href='$($prefix)assets/")

  $new = [regex]::Replace($new, '(?:\.\.\/)*\.gitbook/assets/', "($1$($prefix)assets/")

  if ($new -ne $content) {
    Set-Content -LiteralPath $file -Value $new -Encoding utf8
    Write-Host "Updated .gitbook/assets paths in: $file"
    $changed = $true
  }
}

if ($changed) {
  git add -A
  git commit -m "Rewrite .gitbook/assets links to docs/assets for MkDocs"
  git push
} else {
  Write-Host "No .gitbook/assets paths found to rewrite."
}