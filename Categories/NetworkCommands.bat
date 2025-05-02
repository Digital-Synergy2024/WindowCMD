@echo off

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

cd /d "%~dp0"

set LOGFILE=%~dp0NetworkCommands.log
if not exist %LOGFILE% echo Log initialized on %date% %time% > %LOGFILE%

powershell -Command "& { $host.UI.RawUI.BufferSize = New-Object Management.Automation.Host.Size(100, 300) }"

cls
echo =======================================================
echo I                                                     I
echo I          "Network & Internet Commands"              I
echo I                                                     I
echo =======================================================
echo I "Diagnose network issues and view connections:"     I
echo I --------------------------------------------------- I
echo I "[1] ipconfig /all           - Show all network"    I
echo I      "configurations"                               I
echo I "[2] ping [address]          - Test network"        I
echo I      "latency"                                      I
echo I "[3] tracert [address]       - Trace packet"        I
echo I      "route"                                        I
echo I "[4] netstat -an             - View network"        I
echo I      "connections"                                  I
echo I "[5] nslookup [website]      - Get domain IP"       I
echo I      "address"                                      I
echo =======================================================
echo I                                                     I
echo I "Use the corresponding number to execute a command" I
echo I "or type [back] to return:"                         I
echo I                                                     I
echo =======================================================

:menu
set /p choice=Enter your selection (1-5 or back): 
echo Debug: User input received in NetworkCommands: %choice% >> %LOGFILE%
if "%choice%"=="back" exit
if "%choice%"=="1" ipconfig /all
if "%choice%"=="2" ping
if "%choice%"=="3" tracert
if "%choice%"=="4" netstat -an
if "%choice%"=="5" nslookup
if "%choice%"=="" goto menu
echo Invalid input. Please try again. >> %LOGFILE%
goto menu