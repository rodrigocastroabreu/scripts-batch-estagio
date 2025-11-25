@echo off
title REMOVER MICROSOFT STORE
color 0C
echo ===========================================
echo REMOVENDO MICROSOFT STORE DO SISTEMA
echo ===========================================
echo.

:: Chama PowerShell para remover o app
powershell -Command "Get-AppxPackage *Microsoft.WindowsStore* | Remove-AppxPackage"

echo.
echo MICROSOFT STORE REMOVIDA COM SUCESSO!
echo Reinicie o Windows para concluir.
pause
