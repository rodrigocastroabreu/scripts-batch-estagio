@echo off
title RESTAURANDO MICROSOFT STORE (UNIVERSAL)
color 0A
echo ===========================================
echo RESTAURANDO MICROSOFT STORE...
echo ===========================================
echo.

powershell -ExecutionPolicy Unrestricted -Command ^
"$pkg = Get-AppxPackage -AllUsers Microsoft.WindowsStore; if ($pkg -ne $null) { Add-AppxPackage -DisableDevelopmentMode -Register ($pkg.InstallLocation + '\AppxManifest.xml') } else { Write-Host 'Microsoft Store nao encontrada no sistema.' }"

echo.
echo ===========================================
echo PROCESSO CONCLUIDO!
echo Reinicie o Windows para aplicar.
echo ===========================================
pause
