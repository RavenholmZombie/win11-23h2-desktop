@ECHO OFF
ECHO Checking for Administrator Privileges...
if not "%1"=="am_admin" (
    powershell -Command "Start-Process -Verb RunAs -FilePath '%0' -ArgumentList 'am_admin'"
    exit /b
)
cls
:start
ECHO Windows 11 Feature Control - By RavenholmZombie
ECHO ====================================================
ECHO This tool can enable or disable Insider features (TIFE, etc)            
ECHO Requires Vivetool be installed in System32.                                                        
ECHO ====================================================
ECHO What do you want to do?
ECHO:
ECHO 1. Enable Features
ECHO 2. Disable Features
ECHO ====================
set choice=
set /p choice=Type 1 or 2 to continue...
if not '%choice%'=='' set choice=%choice:~0,1%

if '%choice%'=='1' goto enable
if '%choice%'=='2' goto disable
ECHO "%choice%" is not valid, try again
goto start

:enable
ECHO Enabling Modern Open With Dialog...
vivetool /enable /id:36302090
ECHO Enabling Tabs in File Explorer...
vivetool /enable /id:37634385
ECHO Enabling Sun Valley 2 Navigation Pane...
vivetool /enable /id:36354489
ECHO Enabling Desktop Search Bar...
vivetool /enable /id:37969115
ECHO Enabling Left Taskbar Search Button...
vivetool /enable /id:37010913
goto end

:disable
ECHO Disabling Modern Open With Dialog...
vivetool /reset /id:36302090
ECHO Disabling Tabs in File Explorer...
vivetool /reset /id:37634385
ECHO Disabling Sun Valley 2 Navigation Pane...
vivetool /reset /id:36354489
ECHO Disabling Desktop Search Bar...
vivetool /reset /id:37969115
ECHO Disabling Left Taskbar Search Button...
vivetool /reset /id:37010913
goto end

:end
CLS
ECHO Operation Complete. Would you like to restart your PC now?.
set choice=
set /p choice=Type Y or N...
if not '%choice%'=='' set choice=%choice:~0,1%

if '%choice%'=='Y' goto reboot
if '%choice%'=='N' goto done
if '%choice%'=='y' goto reboot
if '%choice%'=='n' goto done
ECHO "%choice%" is not valid, try again
goto end

:reboot
cls
echo Your PC will reboot momentarily...
shutdown /r /c "Rebooting PC in ten seconds" /t 10
exit

:done
exit
