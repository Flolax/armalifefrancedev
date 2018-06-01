@echo off

:: Modify your folders etc!
set armapath="D:\SteamGames\steamapps\common\Arma 3"
set armaparams=-client -connect=127.0.0.1 -port=2302 -password=dev -maxMem=2047 -mod=@ALF;@ALF_hc;@extDB2;
set serverexe=arma3.exe

echo.
echo Restarting
:: start the servers..
cd /d %armapath%
start "" %serverexe% %armaparams%


exit