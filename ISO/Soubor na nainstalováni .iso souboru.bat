@echo off
color e
title Instalator .iso Souboru
net session
cls
C:
cd "C:\Users\%username%\downloads"

set /p iso=Zadejte nazev .iso, ktery chcete nainstalovat: 
:start

rem Win98
if "%iso%"=="windows 98" set iso=Win98
if "%iso%"=="Windows 98" set iso=Win98
if "%iso%"=="Win98" set iso=Win98
if "%iso%"=="win98" set iso=Win98
if "%iso%"=="Win98" call :Instalace "https://winworldpc.com/download/417712c3-a418-c39a-11c3-a4e284a2c3a5/from/c39ac2af-c381-c2bf-1b25-11c3a4e284a2" "1"

echo Zadany soubor .iso neni na seznamu, budete ho muset nainstalovat rucne
pause > nul
cls
set /p iso=Zadany soubor .iso nebyl spravne napiste ho znovu spravne: 
goto start

:Instalace
echo Instaluji %iso% a vypinam prikazovy radek (cmd.exe)
start %~1
call :exit
if exist "%~2" del "%~2"
:repeat
timeout /t 0 > nul
if not exist "%~2" goto repeat
if %~3 == 1 (start "%~2" "%~2") else (forfiles /m %~2 /c "cmd /c start @file @file")
cls
set /p aplikace=Zadejte nazev dalsiho .iso souboru, ktery chcete nainstalovat: 
goto start

:exit
timeout /t 1
exit
