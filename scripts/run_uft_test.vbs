' ============================================================
' Ejecuta UFT One usando Automation Object Model
' ============================================================

Option Explicit

' Declaramos variables principales.
Dim qtApp
Dim qtTest
Dim qtResultsOpt
Dim testPath
Dim resultPath

' Ruta exacta del test creado en UFT.
testPath = "C:\Users\student\Documents\Functional Testing\Modulos4_5_Cross_Browser_Platform_EcosistemaDevOps"

' Ruta donde se guardarán los resultados.
resultPath = "C:\jenkins-agent\uft-results\Modulos4_5_Cross_Browser_Platform_EcosistemaDevOps"

' Creamos instancia de UFT.
Set qtApp = CreateObject("QuickTest.Application")

' Lanzamos UFT.
qtApp.Launch

' Hacemos visible UFT para que puedas cerrar manualmente el popup de licencia.
qtApp.Visible = True

' Abrimos el test indicado.
qtApp.Open testPath, True

' Obtenemos el test cargado.
Set qtTest = qtApp.Test

' Configuramos la carpeta de resultados.
Set qtResultsOpt = CreateObject("QuickTest.RunResultsOptions")

' Indicamos dónde guardar resultados.
qtResultsOpt.ResultsLocation = resultPath

' Ejecutamos el test y esperamos a que termine.
qtTest.Run qtResultsOpt, True

' Mostramos el estado final.
WScript.Echo "Estado final UFT: " & qtTest.LastRunResults.Status

' Cerramos el test.
qtTest.Close

' Cerramos UFT.
qtApp.Quit

' Liberamos objetos.
Set qtResultsOpt = Nothing
Set qtTest = Nothing
Set qtApp = Nothing