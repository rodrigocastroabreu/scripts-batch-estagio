@echo off
title BLOQUEIO DE JOGOS ONLINE, MICROSOFT STORE E SOFTWARES DE PAPEL DE PAREDE
color 0A
echo =======================================================
echo        BLOQUEANDO SITES E PROGRAMAS INDESEJADOS
echo =======================================================
echo.

set "HOSTS=%SystemRoot%\System32\drivers\etc\hosts"

:: ============================================
:: BLOQUEIO DE SITES DE JOGOS ONLINE (BR + INT)
:: ============================================
echo Adicionando dominios de jogos...
(
    :: Jogos populares e plataformas
    echo 127.0.0.1 roblox.com
    echo 127.0.0.1 www.roblox.com
    echo 127.0.0.1 minecraft.net
    echo 127.0.0.1 https://www.crazygames.com.br
    echo 127.0.0.1 www.crazygames.com.br
    echo 127.0.0.1 www.minecraft.net
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

    :: Jogos de navegador
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
echo =======================================================
echo  BLOQUEIO CONCLUIDO COM SUCESSO!
echo  Sites de jogos, Microsoft Store e apps de papel de parede bloqueados.
echo  Feche os navegadores e rode: ipconfig /flushdns
echo =======================================================
pause
