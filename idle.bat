@echo off
setlocal enabledelayedexpansion
set threshold=600
:main
echo Monitoring idle time. Press Ctrl+C to stop.
:check_inactivity
timeout /t 60 /nobreak >nul
for /f %%i in ('powershell -ExecutionPolicy Bypass -NoProfile -File Get-IdleTime.ps1') do set idle_time=%%i
echo Idle time: !idle_time! seconds
if !idle_time! GEQ %threshold% (
    REM Start the screensaver if the idle time exceeds the threshold.
    echo User idle for more than %threshold% seconds. Starting screensaver...
    start logon.scr /s
)
goto check_inactivity

    
