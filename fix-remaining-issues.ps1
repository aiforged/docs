$files = @(
  "docs/WorkQueue.md",
  "docs/depricated-info/workqueue.md"
) | Where-Object { Test-Path $_ }

foreach ($p in $files) {
  $t = Get-Content -Raw -LiteralPath $p -Encoding utf8
  # Convert absolute /assets -> relative assets/ (these two files sit at different depths)
  $prefix = (Split-Path -Parent $p) -replace [regex]::Escape((Resolve-Path "docs").Path), ''
  $segments = ($prefix -split '[\\/]' | Where-Object { $_ }).Count
  $rel = ("../" * $segments)
  $n = $t -replace '\((\s*)/assets/', "($1$(${rel})assets/" `
                 -replace 'src="/assets/', "src=""$(${rel})assets/" `
                 -replace "src='/assets/", "src='$(${rel})assets/" `
                 -replace 'href="/assets/', "href=""$(${rel})assets/" `
                 -replace "href='/assets/", "href='$(${rel})assets/"
  if ($n -ne $t) {
    Set-Content -LiteralPath $p -Value $n -Encoding utf8
    Write-Host "Fixed absolute /assets in: $p"
  }
}