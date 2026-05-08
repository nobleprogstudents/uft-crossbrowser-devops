@echo off
setlocal

set "BROWSER=%~1"

if "%BROWSER%"=="" set "BROWSER=chrome"

echo Navegador recibido desde Jenkins: %BROWSER%

REM ============================================================
REM Lanza la ejecución real de UFT mediante VBScript
REM ============================================================

REM Nombre de la práctica.
set "TEST_NAME=Modulos4_5_Cross_Browser_Platform_EcosistemaDevOps"

REM Ruta del test UFT.
set "TEST_PATH=C:\Users\student\Documents\Functional Testing\%TEST_NAME%"

REM Ruta de resultados.
set "RESULT_PATH=C:\jenkins-agent\uft-results\%TEST_NAME%"

REM Ruta de logs.
set "LOG_PATH=C:\jenkins-agent\uft-logs\%TEST_NAME%_launcher.log"

REM Ruta del script VBS controlador.
set "VBS_PATH=%CD%\scripts\run_uft_test.vbs"

REM Mostramos contexto.
echo ============================================================
echo Ejecutando UFT mediante VBScript
echo Test path: %TEST_PATH%
echo Result path: %RESULT_PATH%
echo VBS path: %VBS_PATH%
echo Log path: %LOG_PATH%
echo ============================================================

REM Creamos carpeta de logs si no existe.
if not exist "C:\jenkins-agent\uft-logs" mkdir "C:\jenkins-agent\uft-logs"

REM Creamos carpeta base de resultados si no existe.
if not exist "C:\jenkins-agent\uft-results" mkdir "C:\jenkins-agent\uft-results"

REM Limpiamos resultados anteriores.
if exist "%RESULT_PATH%" rmdir /s /q "%RESULT_PATH%"

REM Creamos carpeta nueva de resultados.
mkdir "%RESULT_PATH%"

REM Validamos que exista el test UFT.
if not exist "%TEST_PATH%" (
    echo ERROR: No existe el test UFT: %TEST_PATH%
    exit /b 1
)

REM Validamos que exista el controlador VBS.
if not exist "%VBS_PATH%" (
    echo ERROR: No existe el archivo VBS: %VBS_PATH%
    exit /b 1
)

REM Ejecutamos el VBS y guardamos salida en log.
cscript //nologo "%VBS_PATH%" "%BROWSER%" > "%LOG_PATH%" 2>&1

REM Mostramos el log en Jenkins.
type "%LOG_PATH%"

REM Si cscript falla, fallamos Jenkins.
if errorlevel 1 (
    echo ERROR: Fallo la ejecucion de UFT mediante VBS.
    exit /b 1
)

REM Validamos que UFT haya generado resultados.
dir /b "%RESULT_PATH%" | findstr . >nul

REM Si no hay resultados, fallamos Jenkins.
if errorlevel 1 (
    echo ERROR: UFT no genero resultados.
    exit /b 1
)

REM Si llegó aquí, la ejecución fue real.
echo Ejecucion UFT finalizada con resultados detectados.
exit /b 0
