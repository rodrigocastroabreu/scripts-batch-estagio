@echo off
title DESBLOQUEAR PERSONALIZACAO DO WINDOWS (REMOVER POLITICAS)
echo ============================================================
echo Removendo chaves e valores de politica relacionados a wallpaper,
echo screensaver e personalizacao (HKCU e HKLM). Execute como Admin.
echo ============================================================
echo.

:: --- Remover chaves de politica no HKCU (usuario) ---
REG DELETE "HKCU\Software\Policies\Microsoft\Windows\Personalization" /f 2>nul
REG DELETE "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" /f 2>nul
REG DELETE "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\ActiveDesktop" /f 2>nul
REG DELETE "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /f 2>nul
REG DELETE "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /f 2>nul

:: --- Remover valores em HKCU\Control Panel\Desktop (limpar Wallpaper e estilo) ---
REG DELETE "HKCU\Control Panel\Desktop" /v Wallpaper /f 2>nul
REG DELETE "HKCU\Control Panel\Desktop" /v WallpaperStyle /f 2>nul
REG DELETE "HKCU\Control Panel\Desktop" /v TileWallpaper /f 2>nul

:: --- Tentar remover chaves de politica no HKLM (requere Admin) ---
REG DELETE "HKLM\SOFTWARE\Policies\Microsoft\Windows\Personalization" /f 2>nul
REG DELETE "HKLM\SOFTWARE\Policies\Microsoft\Windows\Control Panel\Desktop" /f 2>nul
REG DELETE "HKLM\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Policies\ActiveDesktop" /f 2>nul
REG DELETE "HKLM\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Policies\Explorer" /f 2>nul
REG DELETE "HKLM\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Policies\System" /f 2>nul

:: --- Limpar screensaver forçado (HKCU e HKLM) ---
REG DELETE "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" /v SCRNSAVE.EXE /f 2>nul
REG DELETE "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" /v ScreenSaveActive /f 2>nul
REG DELETE "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" /v ScreenSaveTimeOut /f 2>nul

REG DELETE "HKLM\SOFTWARE\Policies\Microsoft\Windows\Control Panel\Desktop" /v SCRNSAVE.EXE /f 2>nul
REG DELETE "HKLM\SOFTWARE\Policies\Microsoft\Windows\Control Panel\Desktop" /v ScreenSaveActive /f 2>nul
REG DELETE "HKLM\SOFTWARE\Policies\Microsoft\Windows\Control Panel\Desktop" /v ScreenSaveTimeOut /f 2>nul

:: --- Forçar atualização de políticas e parâmetros do usuário ---
echo Forcando atualizacao de politicas e parametros...
gpupdate /force 2>nul
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters

:: --- Reiniciar Explorer para aplicar imediatamente ---
echo Reiniciando o Explorer para aplicar mudancas...
taskkill /f /im explorer.exe >nul 2>nul
timeout /t 1 >nul
start explorer.exe

echo.
echo ============================================================
echo TENTATIVA DE DESBLOQUEIO CONCLUIDA.
echo Se ainda houver bloqueio, leia as instrucoes abaixo.
echo ============================================================
pause
