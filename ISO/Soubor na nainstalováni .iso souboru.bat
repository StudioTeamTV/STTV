@echo off
color e
title Instalator .iso
net session
cls
C:
cd "C:\Users\%username%\downloads"

set /p aplikace=Zadejte nazev .iso, ktery chcete nainstalovat: 
:start

rem Win98
if "%aplikace%"=="windows 98" set aplikace=Win98
if "%aplikace%"=="Windows 98" set aplikace=Win98
if "%aplikace%"=="Win98" set aplikace=Win98
if "%aplikace%"=="win98" set aplikace=Win98
if "%aplikace%"=="Win98" call :Instalace "https://winworldpc.com/download/417712c3-a418-c39a-11c3-a4e284a2c3a5/from/c39ac2af-c381-c2bf-1b25-11c3a4e284a2" "1"

echo Zadany soubor .iso neni na seznamu, budete ho muset nainstalovat rucne
pause > nul
cls
set /p aplikace=Zadany soubor .iso nebyl spravne napiste ho znovu spravne: 
goto start

:Instalace
echo Instaluji %aplikace%.....
start %~1
if exist "%~2" del "%~2"
:repeat
timeout /t 0 > nul
if not exist "%~2" goto repeat
if %~3 == 1 (start "%~2" "%~2") else (forfiles /m %~2 /c "cmd /c start @file @file")
cls
set /p aplikace=Zadejte nazev dalsiho .iso souboru, ktery chcete nainstalovat: 
goto start