@echo off
setlocal EnableExtensions EnableDelayedExpansion
cd /d "%~dp0"
title MOHAB Standalone - Instalar MOD PT-BR no PICO ou META QUEST

set "ADB=%~dp0ferramentas\adb.exe"
set "LOCAL_OBB=%~dp0OBB_MODIFICADA\patch.3.12297.com.Virtuos.R6DLM.obb"
set "REMOTE_DIR=/sdcard/Android/obb/com.Virtuos.R6DLM"
set "REMOTE_NAME=patch.3.12297.com.Virtuos.R6DLM.obb"
set "EXPECTED_SIZE=314427536"
set "EXPECTED_SHA=561b4f19fcd213ff7db9aa36603122644adb5b198dde82169fb098d116381bcb"

echo ==============================================================
echo MEDAL OF HONOR ABOVE AND BEYOND - MOD STANDALONE PT-BR
echo ==============================================================
echo Este instalador altera somente patch.3. O main.obb nao e tocado.
echo Compativel com PICO e META QUEST via ADB.
echo Nao desconecte o headset durante o envio.
echo.

if not exist "%ADB%" goto :SEM_ADB
if not exist "%LOCAL_OBB%" goto :SEM_OBB
for %%F in ("%LOCAL_OBB%") do set "LOCAL_SIZE=%%~zF"
if not "!LOCAL_SIZE!"=="%EXPECTED_SIZE%" goto :OBB_INVALIDA
for /f "tokens=1" %%H in ('certutil -hashfile "%LOCAL_OBB%" SHA256 ^| findstr /r /v "hash CertUtil"') do set "LOCAL_SHA=%%H"
if /i not "!LOCAL_SHA!"=="%EXPECTED_SHA%" goto :OBB_INVALIDA

"%ADB%" start-server >nul 2>&1
set "COUNT=0"
for /f "skip=1 tokens=1,2" %%A in ('"%ADB%" devices') do if "%%B"=="device" set /a COUNT+=1
if not "!COUNT!"=="1" goto :SEM_DEVICE
for /f "delims=" %%M in ('"%ADB%" shell getprop ro.product.manufacturer') do set "HEADSET_MAKER=%%M"
for /f "delims=" %%M in ('"%ADB%" shell getprop ro.product.model') do set "HEADSET_MODEL=%%M"
echo Headset detectado: !HEADSET_MAKER! !HEADSET_MODEL!
"%ADB%" shell test -d "%REMOTE_DIR%" || goto :SEM_JOGO
"%ADB%" shell test -f "%REMOTE_DIR%/%REMOTE_NAME%" || goto :SEM_PATCH

echo Criando backup original dentro do headset, se ainda nao existir...
"%ADB%" shell test -f "%REMOTE_DIR%/%REMOTE_NAME%.backup-original" || "%ADB%" shell cp "%REMOTE_DIR%/%REMOTE_NAME%" "%REMOTE_DIR%/%REMOTE_NAME%.backup-original" || goto :FALHA

echo Enviando OBB modificada...
"%ADB%" shell am force-stop com.Virtuos.R6DLM >nul 2>&1
"%ADB%" push -p "%LOCAL_OBB%" "%REMOTE_DIR%/%REMOTE_NAME%.novo" || goto :FALHA
set "CHECK_SIZE=%TEMP%\mohab_remote_size_%RANDOM%.txt"
"%ADB%" shell stat -c %%s "%REMOTE_DIR%/%REMOTE_NAME%.novo" > "!CHECK_SIZE!" || goto :ENVIO_INVALIDO
set /p "REMOTE_SIZE=" < "!CHECK_SIZE!"
del /q "!CHECK_SIZE!" >nul 2>&1
set "REMOTE_SIZE=!REMOTE_SIZE: =!"
if not "!REMOTE_SIZE!"=="%EXPECTED_SIZE%" goto :ENVIO_INVALIDO
set "CHECK_SHA=%TEMP%\mohab_remote_sha_%RANDOM%.txt"
"%ADB%" shell sha256sum "%REMOTE_DIR%/%REMOTE_NAME%.novo" > "!CHECK_SHA!" || goto :ENVIO_INVALIDO
set /p "REMOTE_SHA_LINE=" < "!CHECK_SHA!"
del /q "!CHECK_SHA!" >nul 2>&1
for /f "tokens=1" %%H in ("!REMOTE_SHA_LINE!") do set "REMOTE_SHA=%%H"
if /i not "!REMOTE_SHA!"=="%EXPECTED_SHA%" goto :ENVIO_INVALIDO
"%ADB%" shell mv -f "%REMOTE_DIR%/%REMOTE_NAME%.novo" "%REMOTE_DIR%/%REMOTE_NAME%" || goto :FALHA

echo.
echo [OK] Mod instalado e verificado por SHA-256.
echo Abra o jogo manualmente dentro do headset.
pause
exit /b 0

:ENVIO_INVALIDO
"%ADB%" shell rm -f "%REMOTE_DIR%/%REMOTE_NAME%.novo" >nul 2>&1
echo [ERRO] O arquivo recebido nao passou na verificacao.
goto :FALHA
:SEM_ADB
echo [ERRO] ferramentas\adb.exe nao encontrado.
goto :FALHA
:SEM_OBB
echo [ERRO] A OBB modificada nao foi encontrada.
goto :FALHA
:OBB_INVALIDA
echo [ERRO] A OBB local foi alterada ou esta incompleta.
goto :FALHA
:SEM_DEVICE
echo [ERRO] Conecte e autorize exatamente um headset pelo ADB.
"%ADB%" devices
goto :FALHA
:SEM_JOGO
echo [ERRO] A pasta com.Virtuos.R6DLM nao foi encontrada no headset.
goto :FALHA
:SEM_PATCH
echo [ERRO] A patch.3 original nao foi encontrada no headset.
:FALHA
echo Instalacao interrompida.
pause
exit /b 1
