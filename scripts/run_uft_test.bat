@echo off
REM ============================================================
REM Script para ejecutar pruebas UFT desde Jenkins
REM ============================================================

REM Ruta donde estará el test UFT
set TEST_PATH=C:\jenkins-agent\uft-tests\test1

REM Ruta donde se guardarán los resultados
set RESULT_PATH=C:\jenkins-agent\uft-results

REM Ruta de logs
set LOG_PATH=C:\jenkins-agent\uft-logs\uft-run.log

REM Mostrar inicio
echo Iniciando ejecucion UFT...

REM Ejecutar UFT en modo consola
"C:\Program Files (x86)\OpenText\Functional Testing\bin\UFT.exe" ^
 -run ^
 -test "%TEST_PATH%" ^
 -result "%RESULT_PATH%" ^
 -log "%LOG_PATH%"

REM Validar ejecución
if %ERRORLEVEL% NEQ 0 (
    echo Error en ejecucion UFT
    exit /b 1
)

echo Ejecucion UFT finalizada correctamente