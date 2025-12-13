@echo off
chcp 65001 >nul
title DNS Cloudflare Family - Gerenciador Profissional
mode con: cols=90 lines=35

:: =========================
:: VERIFICA ADMIN
:: =========================
net session >nul 2>&1
if %errorlevel% neq 0 (
    color 0C
    echo ============================================================
    echo ERRO: PERMISSAO NEGADA
    echo ============================================================
    echo Este programa precisa ser executado como ADMINISTRADOR.
    echo Clique com o botao direito no arquivo e escolha:
    echo Executar como administrador
    echo.
    pause
    exit
)

:MENU
cls
color 0B
echo ================================================================================
echo                   DNS CLOUDFLARE FAMILY - GERENCIADOR
echo ================================================================================
echo.
echo O que este programa faz:
echo - Configura DNS Cloudflare Family (bloqueio de malware e conteudo adulto)
echo - Aplica em TODAS as interfaces de rede
echo - Oferece restauracao para DNS automatico
echo - Inclui verificacao e informacoes educativas
echo.
echo DNS Utilizado:
echo IPv4: 1.1.1.3 / 1.0.0.3
echo IPv6: 2606:4700:4700::1113 / 2606:4700:4700::1003
echo.
echo Documentacao oficial:
echo https://developers.cloudflare.com/1.1.1.1/ip-addresses/
echo.
echo ================================================================================
echo.
color 0A
echo [1] Aplicar DNS Cloudflare Family (SEGURANCA MAXIMA)
color 09
echo [2] Restaurar DNS Automatico (PADRAO WINDOWS)
color 0E
echo [3] Ver Interfaces de Rede
color 0D
echo [4] Ver DNS Ativo (Diagnostico)
color 0C
echo [0] Sair
color 07
echo.
set /p opcao=Escolha uma opcao e pressione ENTER: 

if "%opcao%"=="1" goto APLICAR
if "%opcao%"=="2" goto RESTAURAR
if "%opcao%"=="3" goto INTERFACES
if "%opcao%"=="4" goto VERDNS
if "%opcao%"=="0" exit
goto MENU

:: =========================
:: APLICAR DNS
:: =========================
:APLICAR
cls
color 0A
echo ============================================================
echo APLICANDO DNS CLOUDFLARE FAMILY EM TODAS AS INTERFACES
echo ============================================================
echo.

for /f "skip=3 tokens=1,2,3,*" %%A in ('netsh interface show interface') do (
    if "%%A"=="Habilitado" (
        echo Configurando interface: %%D

        netsh interface ip set dns name="%%D" static 1.1.1.3 >nul
        netsh interface ip add dns name="%%D" 1.0.0.3 index=2 >nul

        netsh interface ipv6 set dns name="%%D" static 2606:4700:4700::1113 >nul
        netsh interface ipv6 add dns name="%%D" 2606:4700:4700::1003 index=2 >nul

        echo OK.
        echo.
    )
)

ipconfig /flushdns >nul
echo Cache DNS limpo.
echo.
echo DNS Cloudflare Family aplicado com sucesso.
pause
goto MENU

:: =========================
:: RESTAURAR DNS
:: =========================
:RESTAURAR
cls
color 0E
echo ============================================================
echo RESTAURANDO DNS AUTOMATICO (DHCP)
echo ============================================================
echo.

for /f "skip=3 tokens=1,2,3,*" %%A in ('netsh interface show interface') do (
    if "%%A"=="Habilitado" (
        echo Restaurando interface: %%D

        netsh interface ip set dns name="%%D" dhcp >nul
        netsh interface ipv6 set dns name="%%D" dhcp >nul

        echo OK.
        echo.
    )
)

ipconfig /flushdns >nul
echo Cache DNS limpo.
echo.
echo DNS automatico restaurado com sucesso.
pause
goto MENU

:: =========================
:: LISTAR INTERFACES
:: =========================
:INTERFACES
cls
color 09
echo ============================================================
echo INTERFACES DE REDE DETECTADAS
echo ============================================================
echo.
netsh interface show interface
echo.
pause
goto MENU

:: =========================
:: VER DNS ATIVO
:: =========================
:VERDNS
cls
color 0D
echo ============================================================
echo DNS ATUAL CONFIGURADO NO SISTEMA
echo ============================================================
echo.
ipconfig /all | findstr /i "DNS"
echo.
pause
goto MENU
