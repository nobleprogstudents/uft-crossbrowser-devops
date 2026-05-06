@echo off
setlocal enabledelayedexpansion

REM ============================================================
REM Script para ejecutar prueba UFT desde Jenkins
REM Practica: Modulos4_5_Cross_Browser_Platform_EcosistemaDevOps
REM ============================================================

set "TEST_NAME=Modulos4_5_Cross_Browser_Platform_EcosistemaDevOps"
set "TEST_PATH=C:\Users\student\Documents\Functional Testing\%TEST_NAME%"
set "RESULT_BASE=C:\jenkins-agent\uft-results"
set "RESULT_PATH=%RESULT_BASE%\%TEST_NAME%"
set "LOG_BASE=C:\jenkins-agent\uft-logs"
set "LOG_PATH=%LOG_BASE%\%TEST_NAME%_launcher.log"
set "UFT_EXE=C:\Program Files (x86)\OpenText\Functional Testing\bin\UFT.exe"

echo ============================================================
echo Ejecutando prueba UFT
echo Practica: %TEST_NAME%
echo Test path: %TEST_PATH%
echo Result path: %RESULT_PATH%
echo Log path: %LOG_PATH%
echo UFT exe: %UFT_EXE%
echo ============================================================

if not exist "%RESULT_BASE%" mkdir "%RESULT_BASE%"
if exist "%RESULT_PATH%" rmdir /s /q "%RESULT_PATH%"
mkdir "%RESULT_PATH%"

if not exist "%LOG_BASE%" mkdir "%LOG_BASE%"
if exist "%LOG_PATH%" del "%LOG_PATH%"

echo Inicio ejecucion UFT: %DATE% %TIME% > "%LOG_PATH%"

if not exist "%UFT_EXE%" (
    echo ERROR: No existe UFT.exe >> "%LOG_PATH%"
    echo ERROR: No existe UFT.exe
    exit /b 1
)

if not exist "%TEST_PATH%" (
    echo ERROR: No existe el test UFT >> "%LOG_PATH%"
    echo ERROR: No existe el test UFT: %TEST_PATH%
    exit /b 1
)

REM Lanzamos UFT usando start /wait para esperar a que termine.
REM Esto evita que Jenkins marque éxito solo porque el proceso fue invocado.
start "" /wait "%UFT_EXE%" -run -test "%TEST_PATH%" -result "%RESULT_PATH%"

set "UFT_EXIT=%ERRORLEVEL%"

echo Codigo salida UFT: %UFT_EXIT% >> "%LOG_PATH%"
echo Fin ejecucion UFT: %DATE% %TIME% >> "%LOG_PATH%"

echo ============================================================
echo Contenido de carpeta de resultados:
dir "%RESULT_PATH%"
echo ============================================================

if %UFT_EXIT% NEQ 0 (
    echo ERROR: UFT devolvio codigo de error %UFT_EXIT%
    exit /b %UFT_EXIT%
)

dir /b "%RESULT_PATH%" > "%LOG_BASE%\result_files.tmp"

for /f %%A in ("%LOG_BASE%\result_files.tmp") do set SIZE=%%~zA

if not exist "%RESULT_PATH%" (
    echo ERROR: No existe carpeta de resultados UFT.
    exit /b 1
)

dir /b "%RESULT_PATH%" | findstr . >nul
if errorlevel 1 (
    echo ERROR: UFT no genero archivos en la carpeta de resultados.
    echo ERROR: Revisa si UFT se puede ejecutar en sesion interactiva desde Jenkins.
    exit /b 1
)

echo Ejecucion UFT finalizada y resultados detectados.
exit /b 0