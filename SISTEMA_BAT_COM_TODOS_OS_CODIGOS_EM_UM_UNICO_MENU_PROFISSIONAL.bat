:MENU
echo off
cls
color 0B
title PAINEL ADMINISTRATIVO WINDOWS - Criado pelo estagiario para automacao

echo ==========================================================================================
echo              PAINEL ADMINISTRATIVO WINDOWS
echo              Criado pelo estagiario para automacao
echo ==========================================================================================
echo.
echo Este painel permite aplicar bloqueios e configuracoes de seguranca
echo e tambem desfazer essas acoes de forma controlada (engenharia reversa).
echo.
echo ==========================================================================================
echo.

:: ===============================
:: ACOES DE ATIVACAO / BLOQUEIO
:: ===============================
color 0A
echo ACOES DE ATIVACAO E BLOQUEIO
echo Estas opcoes APLICAM configuracoes restritivas e de seguranca no sistema.
echo.
echo [1] Aplicar DNS Cloudflare Family (seguranca e filtragem de conteudo)
echo [2] Bloquear jogos, Microsoft Store e wallpapers (arquivo HOSTS)
echo [3] Bloquear personalizacao do Windows (politicas do sistema)
echo [4] Remover Microsoft Store
echo.

:: ===============================
:: ACOES DE ENGENHARIA REVERSA
:: ===============================
color 09
echo ACOES DE ENGENHARIA REVERSA (DESFAZER / RESTAURAR)
echo Estas opcoes REVERTEM as configuracoes aplicadas anteriormente,
echo restaurando o comportamento padrao do Windows.
echo.
echo [5] Restaurar DNS automatico
echo [6] Desbloquear jogos / Store / sites (FORCA TOTAL)
echo [7] Desbloquear personalizacao do Windows
echo [8] Restaurar Microsoft Store
echo.

color 07
echo [0] Sair
echo.
echo ==========================================================================================
set /p opcao=Escolha uma opcao e pressione ENTER: 


if "%opcao%"=="1" goto DNS_APLICAR
if "%opcao%"=="2" goto BLOQUEIO_JOGOS
if "%opcao%"=="3" goto BLOQ_PERSON
if "%opcao%"=="4" goto REM_STORE

if "%opcao%"=="5" goto DNS_RESTAURAR
if "%opcao%"=="6" goto DESBLOQUEAR_JOGOS_FORCADO
if "%opcao%"=="7" goto DESBLOQ_PERSON
if "%opcao%"=="8" goto REST_STORE

if "%opcao%"=="0" exit
goto MENU



:BLOQUEIO_JOGOS
cls
color 0A
title BLOQUEIO DE JOGOS ONLINE, MICROSOFT STORE E SOFTWARES DE PAPEL DE PAREDE

echo Preparando arquivo HOSTS para escrita...

set "HOSTS=%SystemRoot%\System32\drivers\etc\hosts"

attrib -r "%HOSTS%" 2>nul
icacls "%HOSTS%" /grant Administrators:F >nul 2>nul

echo Arquivo HOSTS liberado para edicao.
echo.

echo =======================================================
echo        BLOQUEANDO SITES E PROGRAMAS INDESEJADOS
echo =======================================================
echo.

:: ============================================
:: BLOQUEIO DE SITES DE JOGOS ONLINE (BR + INT)
:: ============================================
echo Adicionando dominios de jogos...
(
    echo 127.0.0.1 roblox.com
    echo 127.0.0.1 www.roblox.com
    echo 127.0.0.1 minecraft.net
    echo 127.0.0.1 www.minecraft.net

    echo 127.0.0.1 crazygames.com.br
    echo 127.0.0.1 www.crazygames.com.br

    echo 127.0.0.1 steampowered.com
    echo 127.0.0.1 store.steampowered.com
    echo 127.0.0.1 www.steampowered.com
    echo 127.0.0.1 epicgames.com
    echo 127.0.0.1 store.epicgames.com
    echo 127.0.0.1 www.epicgames.com
    echo 127.0.0.1 riotgames.com
    echo 127.0.0.1 www.riotgames.com
    echo 127.0.0.1 leagueoflegends.com
    echo 127.0.0.1 www.leagueoflegends.com
    echo 127.0.0.1 valorant.com
    echo 127.0.0.1 www.valorant.com
    echo 127.0.0.1 fortnite.com
    echo 127.0.0.1 www.fortnite.com
    echo 127.0.0.1 freefire.com
    echo 127.0.0.1 www.freefire.com
    echo 127.0.0.1 garena.com
    echo 127.0.0.1 www.garena.com
    echo 127.0.0.1 origin.com
    echo 127.0.0.1 www.origin.com
    echo 127.0.0.1 ea.com
    echo 127.0.0.1 www.ea.com
    echo 127.0.0.1 ubisoft.com
    echo 127.0.0.1 store.ubi.com
    echo 127.0.0.1 www.ubisoft.com
    echo 127.0.0.1 battlenet.com
    echo 127.0.0.1 www.battlenet.com
    echo 127.0.0.1 blizzard.com
    echo 127.0.0.1 www.blizzard.com
    echo 127.0.0.1 xbox.com
    echo 127.0.0.1 www.xbox.com

    echo 127.0.0.1 crazygames.com
    echo 127.0.0.1 www.crazygames.com
    echo 127.0.0.1 clickjogos.com.br
    echo 127.0.0.1 www.clickjogos.com.br
    echo 127.0.0.1 poki.com
    echo 127.0.0.1 www.poki.com
    echo 127.0.0.1 jogos360.com.br
    echo 127.0.0.1 www.jogos360.com.br
    echo 127.0.0.1 1001jogos.com.br
    echo 127.0.0.1 www.1001jogos.com.br
    echo 127.0.0.1 ojogos.com.br
    echo 127.0.0.1 www.ojogos.com.br
    echo 127.0.0.1 minijogos.com.br
    echo 127.0.0.1 www.minijogos.com.br
    echo 127.0.0.1 friv.com
    echo 127.0.0.1 www.friv.com
    echo 127.0.0.1 y8.com
    echo 127.0.0.1 pt.y8.com
    echo 127.0.0.1 kizi.com
    echo 127.0.0.1 www.kizi.com
    echo 127.0.0.1 notdoppler.com
    echo 127.0.0.1 www.notdoppler.com
) >> "%HOSTS%"

:: ============================================
:: BLOQUEIO MICROSOFT STORE
:: ============================================
echo Adicionando dominios da Microsoft Store...
(
    echo 127.0.0.1 store.microsoft.com
    echo 127.0.0.1 apps.microsoft.com
    echo 127.0.0.1 storeedgefd.dsx.mp.microsoft.com
    echo 127.0.0.1 storeedgefd-prod.dsx.mp.microsoft.com
    echo 127.0.0.1 storefrontdl.windowsupdate.com
) >> "%HOSTS%"

:: ============================================
:: BLOQUEIO DE SOFTWARES DE PAPEL DE PAREDE
:: ============================================
echo Adicionando dominios de softwares de papel de parede...
(
    echo 127.0.0.1 wallpaperengine.io
    echo 127.0.0.1 www.wallpaperengine.io
    echo 127.0.0.1 livelywallpaper.net
    echo 127.0.0.1 www.livelywallpaper.net
    echo 127.0.0.1 rainmeter.net
    echo 127.0.0.1 www.rainmeter.net
    echo 127.0.0.1 deskspace.com
    echo 127.0.0.1 www.deskspace.com
    echo 127.0.0.1 push-entertainment.com
    echo 127.0.0.1 www.push-entertainment.com
    echo 127.0.0.1 mylivewallpapers.com
    echo 127.0.0.1 www.mylivewallpapers.com
    echo 127.0.0.1 wallpapercave.com
    echo 127.0.0.1 www.wallpapercave.com
    echo 127.0.0.1 wallpaperflare.com
    echo 127.0.0.1 www.wallpaperflare.com
) >> "%HOSTS%"

echo.
echo Limpando cache DNS do Windows...
ipconfig /flushdns >nul

echo Fechando navegadores abertos...
taskkill /f /im chrome.exe >nul 2>nul
taskkill /f /im msedge.exe >nul 2>nul
taskkill /f /im firefox.exe >nul 2>nul
taskkill /f /im opera.exe >nul 2>nul
taskkill /f /im brave.exe >nul 2>nul

echo =======================================================
echo BLOQUEIO APLICADO COM SUCESSO
echo Reabra o navegador para testar
echo =======================================================
pause
goto MENU



:DESBLOQUEAR_JOGOS_FORCADO
cls
color 09
title DESBLOQUEIO TOTAL - HOSTS + DNS + DoH

echo =======================================================
echo DESBLOQUEIO TOTAL DE JOGOS E SITES
echo =======================================================
echo Esta opcao remove bloqueios por HOSTS, DNS e DoH
echo =======================================================
echo.
pause

set "HOSTS=%SystemRoot%\System32\drivers\etc\hosts"

:: ===============================
:: 1. RECRIAR HOSTS
:: ===============================
attrib -r "%HOSTS%" 2>nul
icacls "%HOSTS%" /grant Administrators:F >nul 2>nul
copy "%HOSTS%" "%HOSTS%.bak" >nul

(
echo # Copyright (c) Microsoft Corp.
echo #
echo # Arquivo HOSTS padrao do Windows
echo #
echo 127.0.0.1 localhost
echo ::1 localhost
) > "%HOSTS%"

echo HOSTS recriado.

:: ===============================
:: 2. FORCAR DNS AUTOMATICO
:: ===============================
echo Restaurando DNS automatico...
for /f "skip=3 tokens=1,2,3,*" %%A in ('netsh interface show interface') do (
    if "%%A"=="Habilitado" (
        netsh interface ip set dns name="%%D" dhcp >nul
        netsh interface ipv6 set dns name="%%D" dhcp >nul
    )
)

:: ===============================
:: 3. FLUSH DNS + REINICIAR SERVICO
:: ===============================
echo Limpando cache DNS...
ipconfig /flushdns >nul
net stop dnscache >nul
net start dnscache >nul

:: ===============================
:: 4. DESATIVAR DNS-over-HTTPS (DoH)
:: ===============================
echo Desativando DNS-over-HTTPS...
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v EnableAutoDoh /t REG_DWORD /d 0 /f >nul

:: ===============================
:: 5. FECHAR NAVEGADORES
:: ===============================
echo Fechando navegadores...
taskkill /f /im chrome.exe >nul 2>nul
taskkill /f /im msedge.exe >nul 2>nul
taskkill /f /im firefox.exe >nul 2>nul
taskkill /f /im opera.exe >nul 2>nul
taskkill /f /im brave.exe >nul 2>nul

echo.
echo =======================================================
echo DESBLOQUEIO TOTAL CONCLUIDO
echo Se ainda falhar, REINICIE o computador
echo =======================================================
pause
goto MENU





:: =====================================================================================
:: PARTE 3 - DNS CLOUDFLARE FAMILY
:: =====================================================================================

:DNS_APLICAR
cls
color 0B
echo ================================================================================
echo                   DNS CLOUDFLARE FAMILY - CONFIGURACAO
echo ================================================================================
echo.
echo O que e DNS?
echo DNS funciona como uma agenda da internet, convertendo nomes de sites
echo (como google.com) em enderecos numericos.
echo.
echo O que e Cloudflare Family?
echo E um DNS publico que bloqueia automaticamente:
echo - Sites maliciosos (malware)
echo - Tentativas de phishing
echo - Conteudo adulto
echo.
echo IPv4 e IPv6:
echo IPv4 e o padrao antigo (ex: 1.1.1.3)
echo IPv6 e o padrao novo e mais seguro
echo Este script configura os dois.
echo.
echo Enderecos utilizados:
echo IPv4: 1.1.1.3 / 1.0.0.3
echo IPv6: 2606:4700:4700::1113 / 2606:4700:4700::1003
echo.
echo Documentacao oficial:
echo https://developers.cloudflare.com/1.1.1.1/ip-addresses/
echo.
echo ================================================================================
pause

cls
color 0A
echo Aplicando DNS Cloudflare Family em TODAS as interfaces habilitadas...
echo.

for /f "skip=3 tokens=1,2,3,*" %%A in ('netsh interface show interface') do (
    if "%%A"=="Habilitado" (
        echo ------------------------------------------------
        echo Interface detectada: %%D
        echo ------------------------------------------------

        echo Aplicando DNS IPv4...
        netsh interface ip set dns name="%%D" static 1.1.1.3 >nul
        netsh interface ip add dns name="%%D" 1.0.0.3 index=2 >nul
        echo IPv4 OK.

        echo Aplicando DNS IPv6...
        netsh interface ipv6 set dns name="%%D" static 2606:4700:4700::1113 >nul
        netsh interface ipv6 add dns name="%%D" 2606:4700:4700::1003 index=2 >nul
        echo IPv6 OK.
        echo.
    )
)

echo Limpando cache DNS do sistema...
ipconfig /flushdns >nul
echo Cache DNS limpo.
echo.

echo ================================================================================
echo DNS CLOUDFLARE FAMILY APLICADO COM SUCESSO
echo A navegacao agora esta mais segura
echo ================================================================================
pause
goto MENU


:DNS_RESTAURAR
cls
color 0E
echo ================================================================================
echo RESTAURANDO DNS AUTOMATICO (PADRAO WINDOWS)
echo ================================================================================
echo.
echo Esta opcao remove o DNS Cloudflare e restaura o DNS do provedor
echo configurado automaticamente pelo Windows (DHCP).
echo.
pause

cls
echo Restaurando DNS automatico em TODAS as interfaces...
echo.

for /f "skip=3 tokens=1,2,3,*" %%A in ('netsh interface show interface') do (
    if "%%A"=="Habilitado" (
        echo ------------------------------------------------
        echo Interface detectada: %%D
        echo ------------------------------------------------

        netsh interface ip set dns name="%%D" dhcp >nul
        netsh interface ipv6 set dns name="%%D" dhcp >nul
        echo DNS automatico restaurado.
        echo.
    )
)

echo Limpando cache DNS...
ipconfig /flushdns >nul
echo Cache DNS limpo.
echo.

echo ================================================================================
echo DNS AUTOMATICO RESTAURADO COM SUCESSO
echo ================================================================================
pause
goto MENU



:: =====================================================================================
:: PARTE 4 - BLOQUEAR PERSONALIZACAO DO WINDOWS
:: =====================================================================================

:BLOQ_PERSON
cls
color 0D
echo ================================================================
echo BLOQUEAR PERSONALIZACAO DO WINDOWS
echo ================================================================
echo Aplicando bloqueios para evitar alteracao de papel de parede,
echo tela de bloqueio e protecao de tela.
echo ================================================================
echo.
pause

cls
echo Criando chaves de politica necessarias...
echo.

:: ==============================
:: CRIAR PASTAS NECESSARIAS
:: ==============================
REG ADD "HKCU\Software\Policies\Microsoft\Windows\Personalization" /f
REG ADD "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" /f
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\ActiveDesktop" /f

echo.
echo Aplicando politicas de bloqueio...
echo.

:: ==============================
:: BLOQUEAR ALTERACAO DE PAPEL DE PAREDE
:: ==============================
REG ADD "HKCU\Software\Policies\Microsoft\Windows\Personalization" /v NoChangingWallPaper /t REG_DWORD /d 1 /f
REG ADD "HKCU\Software\Policies\Microsoft\Windows\Personalization" /v NoChangingLockScreen /t REG_DWORD /d 1 /f
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\ActiveDesktop" /v NoChangingWallPaper /t REG_DWORD /d 1 /f
REG ADD "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" /v NoChangingWallPaper /t REG_DWORD /d 1 /f

:: ==============================
:: BLOQUEAR PROTECAO DE TELA (OPCIONAL)
:: ==============================
REG ADD "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" /v ScreenSaveActive /t REG_SZ /d 1 /f
REG ADD "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" /v ScreenSaveTimeOut /t REG_SZ /d 600 /f
REG ADD "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" /v SCRNSAVE.EXE /t REG_SZ /d "C:\Windows\System32\scrnsave.scr" /f
REG ADD "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" /v NoDispScrSavPage /t REG_DWORD /d 1 /f

echo.
echo ================================================================
echo BLOQUEIOS APLICADOS COM SUCESSO
echo Para garantir total aplicacao, reinicie ou deslogue o usuario
echo ================================================================
pause
goto MENU


:: =====================================================================================
:: PARTE 5 - DESBLOQUEAR PERSONALIZACAO DO WINDOWS
:: =====================================================================================

:DESBLOQ_PERSON
cls
color 0A
echo ============================================================
echo DESBLOQUEAR PERSONALIZACAO DO WINDOWS
echo ============================================================
echo Removendo politicas de bloqueio de papel de parede,
echo tela de bloqueio e protecao de tela.
echo ============================================================
echo.
pause

cls
echo Removendo chaves e valores de politica...
echo.

:: --- Remover chaves de politica no HKCU (usuario) ---
REG DELETE "HKCU\Software\Policies\Microsoft\Windows\Personalization" /f 2>nul
REG DELETE "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" /f 2>nul
REG DELETE "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\ActiveDesktop" /f 2>nul
REG DELETE "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /f 2>nul
REG DELETE "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /f 2>nul

:: --- Remover valores em HKCU\Control Panel\Desktop ---
REG DELETE "HKCU\Control Panel\Desktop" /v Wallpaper /f 2>nul
REG DELETE "HKCU\Control Panel\Desktop" /v WallpaperStyle /f 2>nul
REG DELETE "HKCU\Control Panel\Desktop" /v TileWallpaper /f 2>nul

:: --- Remover chaves de politica no HKLM (requer admin) ---
REG DELETE "HKLM\SOFTWARE\Policies\Microsoft\Windows\Personalization" /f 2>nul
REG DELETE "HKLM\SOFTWARE\Policies\Microsoft\Windows\Control Panel\Desktop" /f 2>nul
REG DELETE "HKLM\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Policies\ActiveDesktop" /f 2>nul
REG DELETE "HKLM\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Policies\Explorer" /f 2>nul
REG DELETE "HKLM\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Policies\System" /f 2>nul

:: --- Limpar configuracoes de protecao de tela ---
REG DELETE "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" /v SCRNSAVE.EXE /f 2>nul
REG DELETE "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" /v ScreenSaveActive /f 2>nul
REG DELETE "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" /v ScreenSaveTimeOut /f 2>nul

REG DELETE "HKLM\SOFTWARE\Policies\Microsoft\Windows\Control Panel\Desktop" /v SCRNSAVE.EXE /f 2>nul
REG DELETE "HKLM\SOFTWARE\Policies\Microsoft\Windows\Control Panel\Desktop" /v ScreenSaveActive /f 2>nul
REG DELETE "HKLM\SOFTWARE\Policies\Microsoft\Windows\Control Panel\Desktop" /v ScreenSaveTimeOut /f 2>nul

echo.
echo Forcando atualizacao de politicas do sistema...
gpupdate /force 2>nul

echo Atualizando parametros do usuario...
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters

echo.
echo Reiniciando o Explorer para aplicar mudancas...
taskkill /f /im explorer.exe >nul 2>nul
timeout /t 1 >nul
start explorer.exe

echo.
echo ============================================================
echo DESBLOQUEIO CONCLUIDO
echo Se ainda houver restricoes, reinicie o Windows
echo ============================================================
pause
goto MENU


:: =====================================================================================
:: PARTE 6 - REMOVER MICROSOFT STORE
:: =====================================================================================

:REM_STORE
cls
color 0C
echo ===========================================
echo REMOVENDO MICROSOFT STORE DO SISTEMA
echo ===========================================
echo Esta opcao remove a Microsoft Store do Windows
echo para impedir instalacao de aplicativos.
echo ===========================================
echo.
pause

cls
echo Executando remocao da Microsoft Store...
echo.

:: Chama PowerShell para remover o aplicativo
powershell -Command "Get-AppxPackage *Microsoft.WindowsStore* | Remove-AppxPackage"

echo.
echo ===========================================
echo MICROSOFT STORE REMOVIDA COM SUCESSO
echo Recomenda-se reiniciar o Windows
echo ===========================================
pause
goto MENU



:: =====================================================================================
:: PARTE 7 - RESTAURAR MICROSOFT STORE
:: =====================================================================================

:REST_STORE
cls
color 0A
echo ===========================================
echo RESTAURANDO MICROSOFT STORE
echo ===========================================
echo Esta opcao tenta restaurar a Microsoft Store
echo para todos os usuarios do sistema.
echo ===========================================
echo.
pause

cls
echo Executando restauracao da Microsoft Store...
echo.

powershell -ExecutionPolicy Unrestricted -Command ^
"$pkg = Get-AppxPackage -AllUsers Microsoft.WindowsStore; if ($pkg -ne $null) { Add-AppxPackage -DisableDevelopmentMode -Register ($pkg.InstallLocation + '\AppxManifest.xml') } else { Write-Host 'Microsoft Store nao encontrada no sistema.' }"

echo.
echo ===========================================
echo PROCESSO CONCLUIDO
echo Se a Store nao aparecer, reinicie o Windows
echo ===========================================
pause
goto MENU





