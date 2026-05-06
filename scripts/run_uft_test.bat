@echo off
REM ============================================================
REM Script para ejecutar prueba UFT desde Jenkins
REM Practica: Modulos4_5_Cross_Browser_Platform_EcosistemaDevOps
REM ============================================================

set "UFT_TESTS_BASE=C:\Users\student\Documents\Functional Testing"
set "TEST_NAME=Modulos4_5_Cross_Browser_Platform_EcosistemaDevOps"
set "TEST_PATH=%UFT_TESTS_BASE%\%TEST_NAME%"
set "RESULT_PATH=C:\jenkins-agent\uft-results\%TEST_NAME%"
set "LOG_PATH=C:\jenkins-agent\uft-logs\%TEST_NAME%_uft-run.log"
set "UFT_EXE=C:\Program Files (x86)\OpenText\Functional Testing\bin\UFT.exe"

echo ============================================================
echo Ejecutando prueba UFT
echo Practica: %TEST_NAME%
echo Test path: %TEST_PATH%
echo Result path: %RESULT_PATH%
echo Log path: %LOG_PATH%
echo UFT exe: %UFT_EXE%
echo ============================================================

if not exist "C:\jenkins-agent\uft-results" mkdir "C:\jenkins-agent\uft-results"
if not exist "%RESULT_PATH%" mkdir "%RESULT_PATH%"
if not exist "C:\jenkins-agent\uft-logs" mkdir "C:\jenkins-agent\uft-logs"

if not exist "%UFT_EXE%" goto ERROR_UFT_EXE
if not exist "%TEST_PATH%" goto ERROR_TEST_PATH

"%UFT_EXE%" -run -test "%TEST_PATH%" -result "%RESULT_PATH%" -log "%LOG_PATH%"

if errorlevel 1 goto ERROR_UFT_RUN

echo Ejecucion UFT finalizada correctamente.
exit /b 0

:ERROR_UFT_EXE
echo ERROR: No existe el ejecutable de UFT.
echo Ruta esperada: %UFT_EXE%
exit /b 1

:ERROR_TEST_PATH
echo ERROR: No existe el test UFT.
echo Ruta esperada: %TEST_PATH%
exit /b 1

:ERROR_UFT_RUN
echo ERROR: La ejecucion de UFT finalizo con error.
exit /b 1