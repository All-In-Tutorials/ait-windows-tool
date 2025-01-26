@set version=v1.0
@echo off

:: Elevation Logic
set "batf_=%~f0"
set "batp_=%batf_:'=''%"  

:: Check if the script is running with administrator privileges
%_null% reg query HKU\S-1-5-19 >nul 2>&1 && goto :menu

:: If not elevated, request admin privileges
set "_vbsf=%temp%\admin_elevate.vbs"
(
echo Set UAC = CreateObject^("Shell.Application"^)
echo UAC.ShellExecute "cmd.exe", "/c ""%batf_:"=""%""", "", "runas", 1
) > "%_vbsf%"

cscript //nologo "%_vbsf%" && exit /b

del "%_vbsf%"
echo This script requires administrator privileges. Please re-run it as administrator.
pause
exit /b

:menu
cls
title AIT Windows Tool (Grim3ntrix) %version%
mode con cols=98 lines=23
color 0F
echo:
echo                   ===============================================================
echo                                         All-In Tutorials
echo                                                -
echo                              o AIT Windows Tool %version% (Grim3ntrix) o
echo                                                -
echo                        YouTube: https://www.youtube.com/@allintutorialsph
echo                          Tiktok: https://www.tiktok.com/@allintutorials
echo                   ===============================================================
echo:
echo                   _______________________________________________________________
echo                  ^|                                                               ^| 
echo                  ^|                                                               ^|
echo                  ^|      [1] Windows Test Signing Mode                            ^|
echo                  ^|      [2] More Tools                                           ^|
echo                  ^|      ___________________________________________________      ^|
echo                  ^|                                                               ^|
echo                  ^|      [0] Exit                                                 ^|
echo                  ^|                                                               ^|
echo                  ^|_______________________________________________________________^|
echo:          
choice /C:120 /N /M ">                   Enter Your Choice in the Keyboard [1,2,0] : "

if %errorlevel%==1 goto windows_test_signing
if %errorlevel%==2 goto menu2
if %errorlevel%==3 goto exit

:windows_test_signing
cls
title Test Signing Mode
mode con cols=98 lines=23
color 0F
echo:
echo                   ===============================================================
echo                                         All-In Tutorials
echo                                                -
echo                              o AIT Windows Tool %version% (Grim3ntrix) o
echo                                                -
echo                        YouTube: https://www.youtube.com/@allintutorialsph
echo                          Tiktok: https://www.tiktok.com/@allintutorials
echo                   ===============================================================
echo                   _______________________________________________________________
echo                  ^|                                                               ^| 
echo                  ^|                                                               ^|
echo                  ^|      [1] Turn OFF                                             ^|
echo                  ^|      [2] Turn ON                                              ^|
echo                  ^|      ___________________________________________________      ^|
echo                  ^|                                                               ^|
echo                  ^|      [0] Back to Main Menu                                    ^|
echo                  ^|                                                               ^|
echo                  ^|_______________________________________________________________^|
echo:
choice /C:120 /N /M ">                   Enter Your Choice in the Keyboard [1,2,0] : "

if %errorlevel%==1 goto turn_off
if %errorlevel%==2 goto turn_on
if %errorlevel%==3 goto menu

:menu2
cls
title More Tools
mode con cols=98 lines=23
color 0F
echo:
echo                   ===============================================================
echo                                         All-In Tutorials
echo                                                -
echo                              o AIT Windows Tool %version% (Grim3ntrix) o
echo                                                -
echo                        YouTube: https://www.youtube.com/@allintutorialsph
echo                          Tiktok: https://www.tiktok.com/@allintutorials
echo                   ===============================================================
echo                   _______________________________________________________________
echo                  ^|                                                               ^| 
echo                  ^|                                                               ^|
echo                  ^|      [1] Tool A (Coming Soon)                                 ^|
echo                  ^|      [2] Tool B (Coming Soon)                                 ^|
echo                  ^|      ___________________________________________________      ^|
echo                  ^|                                                               ^|
echo                  ^|      [0] Back to Main Menu                                    ^|
echo                  ^|                                                               ^|
echo                  ^|_______________________________________________________________^|
echo:
choice /C:120 /N /M ">                   Enter Your Choice in the Keyboard [1,2,0] : "

if %errorlevel%==1 goto tool_a
if %errorlevel%==2 goto tool_b
if %errorlevel%==3 goto menu

:turn_off
cls
color 1F
echo Executing... Turning OFF Test Signing Mode. Please wait.
timeout /t 3 /nobreak >nul
bcdedit -set TESTSIGNING OFF
cls
echo ==================================
echo Test signing mode is now OFF.
echo Please restart your computer for the changes to take effect.
echo ==================================
pause
goto windows_test_signing

:turn_on
cls
color 1F
echo Executing... Turning ON Test Signing Mode. Please wait.
timeout /t 3 /nobreak >nul
bcdedit -set TESTSIGNING ON
cls
echo ==================================
echo Test signing mode is now ON.
echo Please restart your computer for the changes to take effect.
echo ==================================
pause
goto windows_test_signing

:tool_a
cls
color 1F
echo Tool A is under development. Stay tuned!
pause
goto menu2

:tool_b
cls
color 1F
echo Tool B is under development. Stay tuned!
pause
goto menu2

:exit
cls
echo Exiting...
pause
