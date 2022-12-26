@echo off
color 8
title Navody
net session
cls
C:
cd "C:\Users\%username%\downloads"

set /p guide=Zadejte nazev napovedy, kterou chcete zobrazit: 
:start

rem Jak Odstranit Opravneni TrustedInstalleru
if "%guide%"=="jooti" set guide=Jak Odstranit Opravneni TrustedInstalleru
if "%guide%"=="JOOTI" set guide=Jak Odstranit Opravneni TrustedInstalleru
if "%guide%"=="Jooti" set guide=Jak Odstranit Opravneni TrustedInstalleru
if "%guide%"=="Jak Odstranit Opravneni TrustedInstalleru" call :Open "C:\users\%username%\desktop\Vbs\JOOTI.vbs" "1"

echo Zadana napoveda neni na seznamu, budete ji muset zobrazit rucne
pause > nul
cls
set /p guide=Preklepl jste se ale zadejte nazev napovedy, kterou chcete zobrazit: 
goto start

:Open
echo Zobrazuji %guide% a vypinam prikazovy radek (cmd.exe)
start %~1
call :exit
if exist "%~2" del "%~2"
:repeat
if not exist "%~2" goto repeat
if %~3 == 1 (start "%~2" "%~2") else (forfiles /m %~2 /c "cmd /c start @file @file")
cls

:exit
timeout /t 1
start C:\users\%username%\desktop\Vbs\DZPS.vbs
exit
