@echo off
color e
title Instalator .iso Souboru
net session
cls
C:
cd "C:\Users\%username%\downloads"

set /p iso=Zadejte nazev .iso, ktery chcete nainstalovat: 
:start

rem MS-DOS
if "%iso%"=="MS-DOS" set iso=MS-DOS
if "%iso%"=="ms-dos" set iso=MS-DOS
if "%iso%"=="microsoft dos" set iso=MS-DOS
if "%iso%"=="msdos" set iso=MS-DOS
if "%iso%"=="MS-DOS" call :Instalace "https://archive.org/download/msdos6_22/msdos6_22disk1.img" & "https://archive.org/download/msdos6_22/msdos6_22disk2.img" & https://archive.org/download/msdos6_22/msdos6_22disk3.img "1"

rem Win1
if "%iso%"=="win1" set iso=Win1
if "%iso%"=="WIN1" set iso=Win1
if "%iso%"=="Windows 1" set iso=Win1
if "%iso%"=="windows 1" set iso=Win1
if "%iso%"=="WINDOWS 1" set iso=Win1
if "%iso%"=="Win1" call :Instalace "https://winworldpc.com/download/83cc2aec-a591-11e9-b7f9-fa163e9022f0/from/c3ae6ee2-8099-713d-3411-c3a6e280947e" "1"

rem Win2
if "%iso%"=="win2" set iso=Win2
if "%iso%"=="WIN2" set iso=Win2
if "%iso%"=="Windows 2" set iso=Win2
if "%iso%"=="windows 2" set iso=Win2
if "%iso%"=="WINDOWS 2" set iso=Win2
if "%iso%"=="Win2" call :Instalace "https://winworldpc.com/download/0474c84d-d5c4-11eb-9de1-0200008a0da4/from/c3ae6ee2-8099-713d-3411-c3a6e280947e" "1"

rem Win3.1
if "%iso%"=="win3.1" set iso=Win3.1
if "%iso%"=="WIN3.1" set iso=Win3.1
if "%iso%"=="Windows 3.1" set iso=Win3.1
if "%iso%"=="windows 3.1" set iso=Win3.1
if "%iso%"=="WINDOWS 3.1" set iso=Win3.1
if "%iso%"=="Win3.1" call :Instalace "https://winworldpc.com/download/3f56c38f-6118-c39a-11c3-a4e284a2c3a5/from/c3ae6ee2-8099-713d-3411-c3a6e280947e" "1"

rem Win95
if "%iso%"=="windows 95" set iso=Win95
if "%iso%"=="Windows 95" set iso=Win95
if "%iso%"=="Win95" set iso=Win95
if "%iso%"=="win 95" set iso=Win95
if "%iso%"=="Win 95" set iso=Win95
if "%iso%"=="win95" set iso=Win95
if "%iso%"=="Win98" call :Instalace "https://winworldpc.com/download/c2d275fa-4e61-11ec-b881-0200008a0da4/from/c3ae6ee2-8099-713d-3411-c3a6e280947e" "1"

rem Win98
if "%iso%"=="windows 98" set iso=Win98
if "%iso%"=="Windows 98" set iso=Win98
if "%iso%"=="Win98" set iso=Win98
if "%iso%"=="win98" set iso=Win98
if "%iso%"=="Win98" call :Instalace "https://winworldpc.com/download/417712c3-a418-c39a-11c3-a4e284a2c3a5/from/c39ac2af-c381-c2bf-1b25-11c3a4e284a2" "1"

rem WinNT
if "%iso%"=="windows nt" set iso=WinNT
if "%iso%"=="Windows NT" set iso=WinNT
if "%iso%"=="Winnt" set iso=WinNT
if "%iso%"=="winNT" set iso=WinNT
if "%iso%"=="WinNT" call :Instalace "https://winworldpc.com/download/15c87d03-f4bb-11ec-8dc3-0200008a0da4/from/c3ae6ee2-8099-713d-3411-c3a6e280947e" "1"

rem Win1
if "%iso%"=="windows1.0.4" set iso=Win1
if "%iso%"=="win11.0.4" set iso=Win1
if "%iso%"=="Windows1" set iso=Win1
if "%iso%"=="Win1" set iso=Win1
if "%iso%"=="win1.0.4" set iso=Win1
if "%iso%"=="Win1" call :Instalace "https://winworldpc.com/download/4e7b2e4c-cb86-c2bd-11c3-a4c2ac5a5404" "1"

rem Win10
if "%iso%"=="windows 10" set iso=Win10
if "%iso%"=="Windows 10" set iso=Win10
if "%iso%"=="Win10" set iso=Win10
if "%iso%"=="win10" set iso=Win10
if "%iso%"=="Win10" call :Instalace "https://archive.org/download/windows-10-1507-home-and-pro/Win10_Czech_x64.iso" "1"

rem Win11
if "%iso%"=="windows 11" set iso=Win11
if "%iso%"=="Windows 11" set iso=Win11
if "%iso%"=="Win11" set iso=Win11
if "%iso%"=="win11" set iso=Win11
if "%iso%"=="Win11" call :Instalace "https://archive.org/details/windows-11_202108" "1"

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
