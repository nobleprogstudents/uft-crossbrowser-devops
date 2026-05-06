@echo off
REM ============================================================
REM Script para ejecutar prueba UFT desde Jenkins
REM Practica: Modulos4_5_Cross_Browser_Platform_EcosistemaDevOps
REM ============================================================

REM Definimos la carpeta base oficial donde UFT guarda los tests.
set UFT_TESTS_BASE=C:\Users\student\Documents\Functional Testing

REM Definimos el nombre exacto de la practica.
set TEST_NAME=Modulos4_5_Cross_Browser_Platform_EcosistemaDevOps

REM Definimos la ruta completa del test UFT.
set TEST_PATH=%UFT_TESTS_BASE%\%TEST_NAME%

REM Definimos la carpeta donde Jenkins guardara resultados generados por UFT.
set RESULT_PATH=C:\jenkins-agent\uft-results\%TEST_NAME%

REM Definimos la carpeta donde Jenkins guardara logs auxiliares.
set LOG_PATH=C:\jenkins-agent\uft-logs\%TEST_NAME%_uft-run.log

REM Definimos la ruta real del ejecutable UFT en esta maquina Windows.
set UFT_EXE=C:\Program Files (x86)\OpenText\Functional Testing\bin\UFT.exe

REM Mostramos informacion de contexto en consola.
echo ============================================================
echo Ejecutando prueba UFT
echo Practica: %TEST_NAME%
echo Test path: %TEST_PATH%
echo Result path: %RESULT_PATH%
echo Log path: %LOG_PATH%
echo UFT exe: %UFT_EXE%
echo ============================================================

REM Creamos la carpeta de resultados si no existe.
if not exist "C:\jenkins-agent\uft-results" mkdir "C:\jenkins-agent\uft-results"

REM Creamos la carpeta especifica de resultados de la practica si no existe.
if not exist "%RESULT_PATH%" mkdir "%RESULT_PATH%"

REM Creamos la carpeta de logs si no existe.
if not exist "C:\jenkins-agent\uft-logs" mkdir "C:\jenkins-agent\uft-logs"

REM Validamos que exista el ejecutable de UFT.
if not exist "%UFT_EXE%" (
    echo ERROR: No existe el ejecutable de UFT en: %UFT_EXE%
    exit /b 1
)

REM Validamos que exista el test de UFT.
if not exist "%TEST_PATH%" (
    echo ERROR: No existe el test UFT en: %TEST_PATH%
    exit /b 1
)

REM Ejecutamos UFT apuntando al test de la practica.
"%UFT_EXE%" ^
 -run ^
 -test "%TEST_PATH%" ^
 -result "%RESULT_PATH%" ^
 -log "%LOG_PATH%"

REM Validamos el codigo de salida de UFT.
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: La ejecucion de UFT finalizo con error. Codigo: %ERRORLEVEL%
    exit /b 1
)

REM Indicamos finalizacion exitosa.
echo Ejecucion UFT finalizada correctamente.
exit /b 0