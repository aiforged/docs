@echo off
setlocal
powershell -ExecutionPolicy Bypass -NoProfile -File "%~dp0scripts\dev.ps1" serve
endlocal