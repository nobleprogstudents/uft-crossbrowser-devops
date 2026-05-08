' ============================================================
' Ejecuta UFT usando Automation Object Model
' Practica: Modulos4_5_Cross_Browser_Platform_EcosistemaDevOps
' ============================================================

Option Explicit

Dim qtApp
Dim qtTest
Dim qtResultsOpt
Dim testPath
Dim resultPath
Dim browserName
Dim fso
Dim runtimeFolder
Dim browserFile
Dim fileObj

' Recibimos el navegador desde Jenkins.
If WScript.Arguments.Count > 0 Then
    browserName = WScript.Arguments(0)
Else
    browserName = "chrome"
End If

WScript.Echo "Navegador solicitado: " & browserName

' Definimos rutas.
testPath = "C:\Users\student\Documents\Functional Testing\Modulos4_5_Cross_Browser_Platform_EcosistemaDevOps"
resultPath = "C:\jenkins-agent\uft-results\Modulos4_5_Cross_Browser_Platform_EcosistemaDevOps"

' Creamos carpeta runtime para comunicar Jenkins/VBS con UFT.
runtimeFolder = "C:\jenkins-agent\uft-runtime"
browserFile = runtimeFolder & "\browser.txt"

Set fso = CreateObject("Scripting.FileSystemObject")

' Creamos la carpeta runtime si no existe.
If Not fso.FolderExists(runtimeFolder) Then
    fso.CreateFolder(runtimeFolder)
End If

' Escribimos el navegador solicitado en un archivo temporal.
Set fileObj = fso.CreateTextFile(browserFile, True)
fileObj.WriteLine browserName
fileObj.Close

WScript.Echo "Archivo runtime generado: " & browserFile

' Creamos instancia de UFT.
Set qtApp = CreateObject("QuickTest.Application")

' Lanzamos UFT.
qtApp.Launch

' Lo dejamos visible porque tu licencia trial requiere cerrar manualmente el popup.
qtApp.Visible = True

' Abrimos el test.
qtApp.Open testPath, True

' Obtenemos el test abierto.
Set qtTest = qtApp.Test

' Configuramos resultados.
Set qtResultsOpt = CreateObject("QuickTest.RunResultsOptions")
qtResultsOpt.ResultsLocation = resultPath

' Ejecutamos el test y esperamos a que termine.
qtTest.Run qtResultsOpt, True

' Imprimimos resultado.
WScript.Echo "Estado final UFT: " & qtTest.LastRunResults.Status

' Cerramos test y UFT.
qtTest.Close
qtApp.Quit

' Liberamos objetos.
Set qtResultsOpt = Nothing
Set qtTest = Nothing
Set qtApp = Nothing
Set fileObj = Nothing
Set fso = Nothing
