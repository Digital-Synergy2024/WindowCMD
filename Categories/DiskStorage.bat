@echo off

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

cd /d "%~dp0"

set LOGFILE=%~dp0DiskStorage.log
if not exist %LOGFILE% echo Log initialized on %date% %time% > %LOGFILE%

powershell -Command "& { $host.UI.RawUI.BufferSize = New-Object Management.Automation.Host.Size(100, 300) }"

cls
echo =======================================================
echo I                                                     I
echo I             "Disk & Storage Management"             I
echo I                                                     I
echo =======================================================
echo I "Optimize and troubleshoot disk health:"            I
echo I --------------------------------------------------- I
echo I "[1] chkdsk C: /f /r          - Scan and repair"    I
echo I      "disk errors"                                  I
echo I "[2] diskpart                 - Advanced disk"      I
echo I      "management"                                   I
echo I "[3] format C:                - Format a disk"      I
echo I      "(WARNING: Erases data!)"                      I
echo I "[4] defrag C:                - Defragment a disk"  I
echo I      "for speed"                                    I
echo I "[5] cleanmgr                 - Cleanup disk"       I
echo I      "space"                                        I
echo =======================================================
echo I                                                     I
echo I "Use the corresponding number to execute a command" I
echo I "or type [back] to return:"                         I
echo I                                                     I
echo =======================================================

:menu
set /p choice=Enter your selection (1-5 or back): 
echo Debug: User input received in DiskStorage: %choice% >> %LOGFILE%
if "%choice%"=="back" exit
if "%choice%"=="1" chkdsk C: /f /r
if "%choice%"=="2" diskpart
if "%choice%"=="3" format C:
if "%choice%"=="4" defrag C:
if "%choice%"=="5" cleanmgr
if "%choice%"=="" goto menu
echo Invalid input. Please try again. >> %LOGFILE%
goto menu
