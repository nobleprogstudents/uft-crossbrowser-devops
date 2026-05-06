' ============================================================
' Ejecuta UFT usando Automation Object Model
' Cross Browser Version
' ============================================================

Option Explicit

Dim qtApp
Dim qtTest
Dim qtResultsOpt
Dim testPath
Dim resultPath
Dim browserName

' ============================================================
' Obtenemos navegador desde Jenkins.
' ============================================================

If WScript.Arguments.Count > 0 Then
    browserName = WScript.Arguments(0)
Else
    browserName = "chrome"
End If

WScript.Echo "Navegador solicitado: " & browserName

' ============================================================
' Definimos rutas.
' ============================================================

testPath = "C:\Users\student\Documents\Functional Testing\Modulos4_5_Cross_Browser_Platform_EcosistemaDevOps"

resultPath = "C:\jenkins-agent\uft-results\" & browserName

' ============================================================
' Creamos objeto UFT.
' ============================================================

Set qtApp = CreateObject("QuickTest.Application")

' ============================================================
' Lanzamos UFT.
' ============================================================

qtApp.Launch

qtApp.Visible = True

' ============================================================
' Abrimos el test.
' ============================================================

qtApp.Open testPath, True

Set qtTest = qtApp.Test

' ============================================================
' PASAMOS EL BROWSER AL TEST UFT
' ============================================================

Environment.Value("BrowserName") = browserName

' ============================================================
' Configuramos carpeta de resultados.
' ============================================================

Set qtResultsOpt = CreateObject("QuickTest.RunResultsOptions")

qtResultsOpt.ResultsLocation = resultPath

' ============================================================
' Ejecutamos test.
' ============================================================

qtTest.Run qtResultsOpt, True

' ============================================================
' Resultado final.
' ============================================================

WScript.Echo "Estado final UFT: " & qtTest.LastRunResults.Status

' ============================================================
' Cerramos recursos.
' ============================================================

qtTest.Close

qtApp.Quit

Set qtResultsOpt = Nothing
Set qtTest = Nothing
Set qtApp = Nothing