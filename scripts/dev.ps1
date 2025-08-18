param(
  [ValidateSet('setup','serve','build','clean')] [string]$Task = 'serve',
  [int]$Port = 8000,
  [string]$DevHost = '127.0.0.1',
  [switch]$NoBrowser
)

$ErrorActionPreference = 'Stop'

# Resolve repo root: one level up from this script's folder
$repoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$venvDir  = Join-Path $repoRoot '.venv'

Push-Location $repoRoot

function Get-Python {
  $candidates = @('python', 'python3')
  foreach ($c in $candidates) {
    $cmd = Get-Command $c -ErrorAction SilentlyContinue
    if ($cmd) { return $cmd.Source }
  }
  throw "Python not found. Please install Python 3.10+ and re-run."
}

function Ensure-Venv {
  if (-not (Test-Path $venvDir)) {
    $py = Get-Python
    & $py -m venv $venvDir
  }
}

function Use-Venv {
  $act = Join-Path $venvDir 'Scripts\Activate.ps1'
  if (-not (Test-Path $act)) { throw "Virtual env not found. Run: .\scripts\dev.ps1 setup" }
  . $act
}

function Ensure-Requirements {
  python -m pip install --upgrade pip
  if (Test-Path 'requirements.txt') {
    pip install -r requirements.txt
  } else {
    pip install mkdocs mkdocs-material
  }
}

function Ensure-Config {
  if (-not (Test-Path 'mkdocs.yml')) {
    throw "Config file 'mkdocs.yml' not found at $repoRoot. Please run this from a valid MkDocs repo."
  }
}

switch ($Task) {
  'setup' {
    Ensure-Venv
    Use-Venv
    Ensure-Requirements
    Ensure-Config
    Write-Host "Setup complete."
  }
  'serve' {
    Ensure-Venv
    Use-Venv
    Ensure-Requirements
    Ensure-Config

    $url = "http://$DevHost`:$Port/"
    # Background waiter: poll HTTP until ready, then open browser (unless suppressed)
    $waiter = Start-Job -Name "mkdocs-wait" -ArgumentList $url, $NoBrowser -ScriptBlock {
        param($u, $noBrowser)
        $deadline = (Get-Date).AddSeconds(120)
        while ((Get-Date) -lt $deadline) {
        try {
            $resp = Invoke-WebRequest -Uri $u -UseBasicParsing -TimeoutSec 2 -Headers @{ 'Cache-Control'='no-cache' }
            if ($resp.StatusCode -ge 200 -and $resp.StatusCode -lt 500) {
            if (-not $noBrowser) {
                Start-Process $u | Out-Null
            }
            Write-Host "MkDocs is up at $u" -ForegroundColor Green
            break
            }
        } catch { }
        Start-Sleep -Seconds 1
        }
    }

    try {
        # Run the server in the foreground (shows logs, supports Ctrl+C)
        python -m mkdocs serve -a "$DevHost`:$Port"
    } finally {
        # Cleanup waiter job if still running
        if ($waiter.State -in @('Running','NotStarted')) {
        Stop-Job $waiter -Force -ErrorAction SilentlyContinue
        }
        Remove-Job $waiter -Force -ErrorAction SilentlyContinue
    }
  }
  'build' {
    Ensure-Venv
    Use-Venv
    Ensure-Requirements
    Ensure-Config
    python -m mkdocs build --strict
    Write-Host "Site built in ./site"
  }
  'clean' {
    if (Test-Path "site") { Remove-Item -Recurse -Force "site" }
    Write-Host "Cleaned build output."
  }
}

Pop-Location