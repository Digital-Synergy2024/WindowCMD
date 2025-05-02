@echo off

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

cd /d "%~dp0"

set LOGFILE=%~dp0UpdatesMaintenance.log
if not exist %LOGFILE% echo Log initialized on %date% %time% > %LOGFILE%

powershell -Command "& { $host.UI.RawUI.BufferSize = New-Object Management.Automation.Host.Size(100, 300) }"

cls
echo =======================================================
echo I                                                     I
echo I             "Updates & Maintenance"                 I
echo I                                                     I
echo =======================================================
echo I "Manage updates and perform system maintenance:"    I
echo I --------------------------------------------------- I
echo I "[1] wuauclt /detectnow       - Force update check" I
echo I "[2] sfc /scannow             - Scan and repair"    I
echo I      "system files"                                 I
echo I "[3] dism /online /cleanup-image /restorehealth"    I
echo I      "- Repair Windows image"                       I
echo I "[4] cleanmgr                 - Open Disk Cleanup"  I
echo =======================================================
echo I                                                     I
echo I "Use the corresponding number to execute a command" I
echo I "or type [back] to return:"                         I
echo I                                                     I
echo =======================================================

:menu
set /p choice=Enter your selection (1-4 or back): 
echo Debug: User input received in UpdatesMaintenance: %choice% >> %LOGFILE%
if "%choice%"=="back" exit
if "%choice%"=="1" wuauclt /detectnow
if "%choice%"=="2" sfc /scannow
if "%choice%"=="3" dism /online /cleanup-image /restorehealth
if "%choice%"=="4" cleanmgr
if "%choice%"=="" goto menu
echo Invalid input. Please try again. >> %LOGFILE%
goto menu