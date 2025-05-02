@echo off
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

cd /d "%~dp0"

set LOGFILE=%~dp0WindowsCMD.log
if not exist %LOGFILE% echo Log initialized on %date% %time% > %LOGFILE%

title Windows CMD Command Explorer

mode con: cols=60 lines=35

color 0A
setlocal EnableDelayedExpansion

echo Starting Windows CMD Command Explorer...

:mainmenu
cls
powershell -Command "& { $host.UI.RawUI.BufferSize = New-Object Management.Automation.Host.Size(100, 300) }"
echo Debug: Entered main menu. >> %LOGFILE%
echo =======================================================
echo I                                                     I
echo I           "Windows CMD Command Explorer"            I 
echo I                                                     I
echo =======================================================
echo I                                                     I
echo I "This tool helps you learn and execute commands"    I
echo I "easily. Select a category to explore:"             I
echo I                                                     I
echo =======================================================
echo I                                                     I
echo I "[1] File & Directory Management - Handle files"    I
echo I      "and folders"                                  I
echo I                                                     I
echo =======================================================
echo I                                                     I
echo I "[2] Disk & Storage Management - Optimize storage"  I
echo I      "and disks"                                    I
echo I                                                     I
echo =======================================================
echo I                                                     I
echo I "[3] Network & Internet - Troubleshoot connectivity"I
echo I      "and network issues"                           I
echo I                                                     I
echo =======================================================
echo I                                                     I
echo I "[4] System Commands - Check system info and"       I
echo I      "processes"                                    I
echo I                                                     I
echo =======================================================
echo I                                                     I
echo I "[5] User & Security - Manage accounts and"         I
echo I      "security settings"                            I
echo I                                                     I
echo =======================================================
echo I                                                     I
echo I "[6] Power & Battery - Control power settings"      I
echo I      "and battery life"                             I
echo I                                                     I
echo =======================================================
echo I                                                     I
echo I "[7] Windows Management - Access hidden Windows"    I
echo I      "tools"                                        I
echo I                                                     I
echo =======================================================
echo I                                                     I
echo I "[8] Advanced & Troubleshooting - Debug issues"     I
echo I      "and optimize performance"                     I
echo I                                                     I
echo =======================================================
echo I                                                     I
echo I "[9] Fun & Hidden Commands - Cool tricks and"       I
echo I      "Easter eggs"                                  I
echo I                                                     I
echo =======================================================
echo I                                                     I
echo I "[10] Updates & Maintenance - Manage updates and"   I
echo I      "maintenance"                                  I
echo I                                                     I
echo =======================================================
echo I                                                     I
echo I "[11] Software Control - Manage installed software" I
echo I      "and apps"                                     I
echo I                                                     I
echo =======================================================
echo I                                                     I
echo I "[12] Startup & Boot - Configure startup and boot"  I
echo I      "options"                                      I
echo I                                                     I
echo =======================================================
echo I                                                     I
echo I "[13] Performance & Health - Monitor performance"   I
echo I      "and health"                                   I
echo I                                                     I
echo =======================================================
echo I                                                     I
echo I "[14] Automation & Scripting - Automate tasks with" I
echo I      "scripts"                                      I
echo I                                                     I
echo =======================================================
echo I "[15] Exit"                                         I
echo =======================================================

set /p choice=Enter your selection (1-15): 
echo Debug: User input received: %choice% >> %LOGFILE%
if not defined choice goto invalidinput

set choice=%choice: =%
echo Debug: Raw user input after trimming: '%choice%' >> %LOGFILE%

set /a isNumeric=%choice% 2>nul
if "%isNumeric%" neq "%choice%" goto invalidinput
if %choice% lss 1 goto invalidinput
if %choice% gtr 15 goto invalidinput

echo Debug: Valid input detected: '%choice%' >> %LOGFILE%
goto validinput

:validinput
if "%choice%"=="1" start Categories\FileManagement.bat >> %LOGFILE% 2>&1
if "%choice%"=="2" start Categories\DiskStorage.bat >> %LOGFILE% 2>&1
if "%choice%"=="3" start Categories\NetworkCommands.bat >> %LOGFILE% 2>&1
if "%choice%"=="4" start Categories\SystemCommands.bat >> %LOGFILE% 2>&1
if "%choice%"=="5" start Categories\UserSecurity.bat >> %LOGFILE% 2>&1
if "%choice%"=="6" start Categories\PowerBattery.bat >> %LOGFILE% 2>&1
if "%choice%"=="7" start Categories\WindowsManagement.bat >> %LOGFILE% 2>&1
if "%choice%"=="8" start Categories\AdvancedTroubleshooting.bat >> %LOGFILE% 2>&1
if "%choice%"=="9" start Categories\FunHidden.bat >> %LOGFILE% 2>&1
if "%choice%"=="10" start Categories\UpdatesMaintenance.bat >> %LOGFILE% 2>&1
if "%choice%"=="11" start Categories\SoftwareControl.bat >> %LOGFILE% 2>&1
if "%choice%"=="12" start Categories\StartupBoot.bat >> %LOGFILE% 2>&1
if "%choice%"=="13" start Categories\PerformanceHealth.bat >> %LOGFILE% 2>&1
if "%choice%"=="14" start Categories\AutomationScripting.bat >> %LOGFILE% 2>&1
if "%choice%"=="15" exit

:invalidinput
echo =======================================================
echo I "ERROR: Invalid input! Please enter a number"       I
echo I "between 1 and 15"                                  I
echo =======================================================
echo Debug: Invalid input detected. >> %LOGFILE%
pause
goto mainmenu

:end
echo Debug: Script reached the end. >> %LOGFILE%
pause