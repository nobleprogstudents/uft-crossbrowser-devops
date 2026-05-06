@echo off
REM ============================================================
REM Validacion de comunicacion desde agente Windows hacia Selenium Grid
REM ============================================================

REM Mostramos mensaje inicial.
echo Validando Selenium Grid desde Windows...

REM Definimos la URL publica del Grid expuesta por Docker Desktop.
set GRID_URL=http://localhost:4444/status

REM Mostramos la URL que vamos a consultar.
echo Consultando: %GRID_URL%

REM Ejecutamos curl para consultar el estado del Grid.
curl -s %GRID_URL%

REM Agregamos salto visual en consola.
echo.

REM Mensaje final.
echo Validacion de Selenium Grid desde Windows finalizada.