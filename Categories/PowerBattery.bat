@echo off

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

cd /d "%~dp0"

set LOGFILE=%~dp0PowerBattery.log
if not exist %LOGFILE% echo Log initialized on %date% %time% > %LOGFILE%

powershell -Command "& { $host.UI.RawUI.BufferSize = New-Object Management.Automation.Host.Size(100, 300) }"

cls
echo =======================================================
echo I                                                     I
echo I             "Power & Battery Management"            I
echo I                                                     I
echo =======================================================
echo I "Manage power settings and battery usage:"          I
echo I --------------------------------------------------- I
echo I "[1] powercfg /list         - List power schemes"   I
echo I "[2] powercfg /setactive [GUID] - Set active"       I
echo I      "power scheme"                                 I
echo I "[3] powercfg /batteryreport - Generate battery"    I
echo I      "report"                                       I
echo I "[4] shutdown /s /t 0       - Shutdown the"         I
echo I      "computer"                                     I
echo =======================================================
echo I                                                     I
echo I "Use the corresponding number to execute a command" I
echo I "or type [back] to return:"                         I
echo I                                                     I
echo =======================================================

:menu
set /p choice=Enter your selection (1-4 or back): 
echo Debug: User input received in PowerBattery: %choice% >> %LOGFILE%
if "%choice%"=="back" exit
if "%choice%"=="1" powercfg /list
if "%choice%"=="2" powercfg /setactive
if "%choice%"=="3" powercfg /batteryreport
if "%choice%"=="4" shutdown /s /t 0
if "%choice%"=="" goto menu
echo Invalid input. Please try again. >> %LOGFILE%
goto menu