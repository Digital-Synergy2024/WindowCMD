@echo off

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

cd /d "%~dp0"

set LOGFILE=%~dp0AdvancedTroubleShooting.log
if not exist %LOGFILE% echo Log initialized on %date% %time% > %LOGFILE%

powershell -Command "& { $host.UI.RawUI.BufferSize = New-Object Management.Automation.Host.Size(100, 300) }"

cls
echo =======================================================
echo I                                                     I
echo I             "Advanced & Troubleshooting"            I
echo I                                                     I
echo =======================================================
echo I "Debug and troubleshoot system issues:"             I
echo I --------------------------------------------------- I
echo I "[1] sfc /scannow           - Scan and repair"      I
echo I      "system files"                                 I
echo I "[2] dism /online /cleanup-image /restorehealth"    I
echo I      "- Repair Windows image"                       I
echo I "[3] bcdedit                - Edit boot"            I
echo I      "configuration"                                I
echo I "[4] verifier               - Driver Verifier"      I
echo I      "Manager"                                      I
echo =======================================================
echo I                                                     I
echo I "Use the corresponding number to execute a command" I
echo I "or type [back] to return:"                         I
echo I                                                     I
echo =======================================================

:menu
set /p choice=Enter your selection (1-4 or back): 
echo Debug: User input received in AdvancedTroubleshooting: %choice% >> %LOGFILE%
if "%choice%"=="back" exit
if "%choice%"=="1" sfc /scannow
if "%choice%"=="2" dism /online /cleanup-image /restorehealth
if "%choice%"=="3" bcdedit
if "%choice%"=="4" verifier
if "%choice%"=="" goto menu
echo Invalid input. Please try again. >> %LOGFILE%
goto menu