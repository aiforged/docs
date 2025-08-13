# Run from the repository root

# Compute docs root
$docsRoot = (Resolve-Path -LiteralPath "docs").Path

# Helper: build prefix like "", "../", "../../" based on file depth relative to docs/
function Get-RelPrefix([string]$dirPath, [string]$rootPath) {
  $rel = $dirPath.Substring($rootPath.Length).TrimStart('\','/')
  if ([string]::IsNullOrEmpty($rel)) { return "" }
  $segments = $rel -split '[\\/]' | Where-Object { $_ -ne "" }
  return ("../" * $segments.Count)
}

# Helper: encode spaces/parentheses/square-brackets in URL path segments
function Encode-UrlPath([string]$s) {
  if (-not $s) { return $s }
  $sb = New-Object System.Text.StringBuilder
  foreach ($ch in $s.ToCharArray()) {
    switch ($ch) {
      ' ' { [void]$sb.Append('%20') }
      '(' { [void]$sb.Append('%28') }
      ')' { [void]$sb.Append('%29') }
      '[' { [void]$sb.Append('%5B') }
      ']' { [void]$sb.Append('%5D') }
      default { [void]$sb.Append($ch) }
    }
  }
  $sb.ToString()
}

$changed = $false
$totalFiles = 0

Get-ChildItem -Path $docsRoot -Recurse -Filter *.md -File | ForEach-Object {
  $file   = $_.FullName
  $prefix = Get-RelPrefix -dirPath $_.DirectoryName -rootPath $docsRoot

  $text = Get-Content -Raw -LiteralPath $file -Encoding utf8
  $new  = $text

  # 1) Inline Markdown (no angle brackets): ![](.gitbook/assets/...) -> assets/, encode path
  $rxMdGitBook = [regex]'\((\s*)(?:\.\.\/)*\.gitbook/assets/([^)"'']+)([^)]*)\)'
  $new = $rxMdGitBook.Replace($new, {
    param($m) "(" + $m.Groups[1].Value + "$prefix" + "assets/" + (Encode-UrlPath $m.Groups[2].Value) + $m.Groups[3].Value + ")" })

  # 2) Inline Markdown (with angle brackets inside ()): ![](<.gitbook/assets/...>)
  $rxMdGitBookAngle = [regex]'\((\s*)<\s*(?:\.\.\/)*\.gitbook/assets/([^>]+)>\s*([^)]*)\)'
  $new = $rxMdGitBookAngle.Replace($new, {
    param($m) "(" + $m.Groups[1].Value + "$prefix" + "assets/" + (Encode-UrlPath $m.Groups[2].Value) + $m.Groups[3].Value + ")" })

  # 3) HTML src/href -> assets/, encode
  $rxSrcDqGitBook  = [regex]'src="(?:\.\.\/)*\.gitbook/assets/([^"]+)"'
  $rxSrcSqGitBook  = [regex]"src='(?:\.\.\/)*\.gitbook/assets/([^']+)'"
  $rxHrefDqGitBook = [regex]'href="(?:\.\.\/)*\.gitbook/assets/([^"]+)"'
  $rxHrefSqGitBook = [regex]"href='(?:\.\.\/)*\.gitbook/assets/([^']+)'"

  $new = $rxSrcDqGitBook.Replace($new,  { param($m) 'src="'  + "$prefix" + 'assets/' + (Encode-UrlPath $m.Groups[1].Value) + '"' })
  $new = $rxSrcSqGitBook.Replace($new,  { param($m) "src='"  + "$prefix" + 'assets/' + (Encode-UrlPath $m.Groups[1].Value) + "'" })
  $new = $rxHrefDqGitBook.Replace($new, { param($m) 'href="' + "$prefix" + 'assets/' + (Encode-UrlPath $m.Groups[1].Value) + '"' })
  $new = $rxHrefSqGitBook.Replace($new, { param($m) "href='" + "$prefix" + 'assets/' + (Encode-UrlPath $m.Groups[1].Value) + "'" })

  # 4) Reference-style definitions: [id]: ../../.gitbook/assets/foo.png "title"
  $rxRefGitBook = New-Object System.Text.RegularExpressions.Regex `
    '^\s*(\[[^\]]+\]:\s*)(?:\.\.\/)*\.gitbook/assets/([^\s]+)(\s+["''][^"'']*["''])?\s*$', `
    ([System.Text.RegularExpressions.RegexOptions]::IgnoreCase -bor `
     [System.Text.RegularExpressions.RegexOptions]::Multiline)
  $new = $rxRefGitBook.Replace($new, {
    param($m) $m.Groups[1].Value + "$prefix" + 'assets/' + (Encode-UrlPath $m.Groups[2].Value) + $m.Groups[3].Value })

  # 5) Angle-bracket autolinks: <../../.gitbook/assets/foo.png>
  $rxAutoGitBook = [regex]'<(?:\.\.\/)*\.gitbook/assets/([^ >]+)>'
  $new = $rxAutoGitBook.Replace($new, {
    param($m) '<' + "$prefix" + 'assets/' + (Encode-UrlPath $m.Groups[1].Value) + '>' })

  # 6) Encode-only for existing assets/ (no prefix change)
  #    Inline Markdown (no angle brackets)
  $rxMdAssets = [regex]'\((\s*)((?:\.\.\/)*assets/)([^)"'']+)([^)]*)\)'
  $new = $rxMdAssets.Replace($new, {
    param($m) "(" + $m.Groups[1].Value + $m.Groups[2].Value + (Encode-UrlPath $m.Groups[3].Value) + $m.Groups[4].Value + ")" })

  #    Inline Markdown (with angle brackets)
  $rxMdAssetsAngle = [regex]'\((\s*)<\s*((?:\.\.\/)*assets/)([^>]+)>\s*([^)]*)\)'
  $new = $rxMdAssetsAngle.Replace($new, {
    param($m) "(" + $m.Groups[1].Value + $m.Groups[2].Value + (Encode-UrlPath $m.Groups[3].Value) + $m.Groups[4].Value + ")" })

  #    HTML src/href
  $rxSrcDqAssets  = [regex]'src="((?:\.\.\/)*assets/)([^"]+)"'
  $rxSrcSqAssets  = [regex]"src='((?:\.\.\/)*assets/)([^']+)'"
  $rxHrefDqAssets = [regex]'href="((?:\.\.\/)*assets/)([^"]+)"'
  $rxHrefSqAssets = [regex]"href='((?:\.\.\/)*assets/)([^']+)'"

  $new = $rxSrcDqAssets.Replace($new,  { param($m) 'src="'  + $m.Groups[1].Value + (Encode-UrlPath $m.Groups[2].Value) + '"' })
  $new = $rxSrcSqAssets.Replace($new,  { param($m) "src='"  + $m.Groups[1].Value + (Encode-UrlPath $m.Groups[2].Value) + "'" })
  $new = $rxHrefDqAssets.Replace($new, { param($m) 'href="' + $m.Groups[1].Value + (Encode-UrlPath $m.Groups[2].Value) + '"' })
  $new = $rxHrefSqAssets.Replace($new, { param($m) "href='" + $m.Groups[1].Value + (Encode-UrlPath $m.Groups[2].Value) + "'" })

  if ($new -ne $text) {
    Set-Content -LiteralPath $file -Value $new -Encoding utf8
    Write-Host "Updated asset URLs in: $file"
    $changed = $true
    $totalFiles++
  }
}

if ($changed) {
  git add -A
  git commit -m "Rewrite .gitbook/assets -> assets with correct prefixes; encode asset URLs; handle angle-bracket Markdown, HTML, refs, and autolinks"
  git push
  Write-Host "Completed. Updated $totalFiles file(s)."
} else {
  Write-Host "No asset URL changes detected."
}

# Sanity check: any remaining .gitbook/assets refs?
$remaining = Select-String -Path (Join-Path $docsRoot '**\*.md') -Pattern '\.gitbook/assets/' -List -ErrorAction SilentlyContinue
if ($remaining) {
  Write-Host "`nStill found .gitbook/assets in these files:"
  $remaining | ForEach-Object { Write-Host " - $($_.Path)" }
} else {
  Write-Host "`nNo remaining .gitbook/assets references."
}