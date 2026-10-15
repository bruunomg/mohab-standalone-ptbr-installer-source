@echo off
setlocal EnableExtensions EnableDelayedExpansion
cd /d "%~dp0"
title MOHAB Standalone - Reverter MOD PT-BR
set "ADB=%~dp0ferramentas\adb.exe"
set "REMOTE_DIR=/sdcard/Android/obb/com.Virtuos.R6DLM"
set "NAME=patch.3.12297.com.Virtuos.R6DLM.obb"

if not exist "%ADB%" (echo [ERRO] adb.exe ausente.& pause& exit /b 1)
"%ADB%" start-server >nul 2>&1
set "COUNT=0"
for /f "skip=1 tokens=1,2" %%A in ('"%ADB%" devices') do if "%%B"=="device" set /a COUNT+=1
if not "!COUNT!"=="1" (echo [ERRO] Conecte e autorize exatamente um PICO ou META QUEST.& "%ADB%" devices& pause& exit /b 1)
for /f "delims=" %%M in ('"%ADB%" shell getprop ro.product.manufacturer') do set "HEADSET_MAKER=%%M"
for /f "delims=" %%M in ('"%ADB%" shell getprop ro.product.model') do set "HEADSET_MODEL=%%M"
echo Headset detectado: !HEADSET_MAKER! !HEADSET_MODEL!
"%ADB%" shell test -f "%REMOTE_DIR%/%NAME%.backup-original" || (echo [ERRO] Backup original nao encontrado no headset.& pause& exit /b 1)
echo Restaurando patch.3 original...
"%ADB%" shell am force-stop com.Virtuos.R6DLM >nul 2>&1
"%ADB%" shell cp "%REMOTE_DIR%/%NAME%.backup-original" "%REMOTE_DIR%/%NAME%.restaurando" || goto :ERRO
"%ADB%" shell mv -f "%REMOTE_DIR%/%NAME%.restaurando" "%REMOTE_DIR%/%NAME%" || goto :ERRO
echo [OK] patch.3 original restaurada. O backup foi preservado.
pause
exit /b 0
:ERRO
echo [ERRO] Nao foi possivel restaurar a OBB.
pause
exit /b 1
