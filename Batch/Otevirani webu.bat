@echo off
color 4
title Otevreni Webu
net session
cls
C:
cd "C:\Users\%username%\downloads"

set /p web=Zadejte nazev webu, ktery chcete zobrazit: 
:start

rem YouTube
if "%web%"=="yt" set web=YouTube
if "%web%"=="youtube" set web=YouTube
if "%web%"=="YouTube" call :Open "https://youtube.com" "1"

rem DeepL
if "%web%"=="deepl" set web=DeepL
if "%web%"=="DeepL" set web=DeepL
if "%web%"=="DeepL" call :Open "https://www.deepl.com/translator" "1"

rem Roblox
if "%web%"=="rb" set web=Roblox
if "%web%"=="roblox" set web=Roblox
if "%web%"=="Roblox" set web=Roblox
if "%web%"=="Roblox" call :Open "https://web.roblox.com/home" "1"

echo Zadany web neni na seznamu, budete ho muset zobrazit rucne
pause > nul
cls
set /p web=Preklepl jste se ale zadejte nazev webu, ktery chcete zobrazit: 
goto start

:Open
echo Zobrazuji %web% a vypinam prikazovy radek (cmd.exe)
start %~1
call :exit
if exist "%~2" del "%~2"
:repeat
if not exist "%~2" goto repeat
if %~3 == 1 (start "%~2" "%~2") else (forfiles /m %~2 /c "cmd /c start @file @file")
cls

:exit
timeout /t 1
exit
