@echo off
title BLOQUEAR PERSONALIZACAO DO WINDOWS
echo ================================================
echo  Aplicando bloqueios para evitar alteração do papel de parede...
echo ================================================
echo.

:: ==============================
:: CRIAR PASTAS NECESSARIAS
:: ==============================
REG ADD "HKCU\Software\Policies\Microsoft\Windows\Personalization" /f
REG ADD "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" /f
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\ActiveDesktop" /f

:: ==============================
:: BLOQUEAR ALTERACAO DE PAPEL DE PAREDE
:: ==============================
REG ADD "HKCU\Software\Policies\Microsoft\Windows\Personalization" /v NoChangingWallPaper /t REG_DWORD /d 1 /f
REG ADD "HKCU\Software\Policies\Microsoft\Windows\Personalization" /v NoChangingLockScreen /t REG_DWORD /d 1 /f
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\ActiveDesktop" /v NoChangingWallPaper /t REG_DWORD /d 1 /f
REG ADD "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" /v NoChangingWallPaper /t REG_DWORD /d 1 /f

:: ==============================
:: BLOQUEAR PROTECAO DE TELA (OPCIONAL, caso queira bloquear)
:: ==============================
REG ADD "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" /v ScreenSaveActive /t REG_SZ /d 1 /f
REG ADD "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" /v ScreenSaveTimeOut /t REG_SZ /d 600 /f
REG ADD "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" /v SCRNSAVE.EXE /t REG_SZ /d "C:\Windows\System32\scrnsave.scr" /f
REG ADD "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" /v NoDispScrSavPage /t REG_DWORD /d 1 /f

echo.
echo ================================================
echo  BLOQUEIOS APLICADOS COM SUCESSO!
echo  (Reinicie ou deslogue para garantir aplicacao)
echo ================================================
pause
