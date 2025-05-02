@echo off

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

cd /d "%~dp0"

set LOGFILE=%~dp0StartupBoot.log
if not exist %LOGFILE% echo Log initialized on %date% %time% > %LOGFILE%

powershell -Command "& { $host.UI.RawUI.BufferSize = New-Object Management.Automation.Host.Size(100, 300) }"

cls
echo =======================================================
echo I                                                     I
echo I           "Startup & Boot Configuration"            I
echo I                                                     I
echo =======================================================
echo I "Configure startup and boot options:"               I
echo I --------------------------------------------------- I
echo I "[1] msconfig                - Open System"         I
echo I      "Configuration"                                I
echo I "[2] bcdedit                 - Edit boot"           I
echo I      "configuration"                                I
echo I "[3] taskmgr                 - Open Task Manager"   I
echo I      "(Startup tab)"                                I
echo =======================================================
echo I                                                     I
echo I "Use the corresponding number to execute a command" I
echo I "or type [back] to return:"                         I
echo I                                                     I
echo =======================================================

:menu
set /p choice=Enter your selection (1-3 or back): 
echo Debug: User input received in StartupBoot: %choice% >> %LOGFILE%
if "%choice%"=="back" exit
if "%choice%"=="1" msconfig
if "%choice%"=="2" bcdedit
if "%choice%"=="3" taskmgr
if "%choice%"=="" goto menu
echo Invalid input. Please try again. >> %LOGFILE%
goto menu