@echo off

:: Modify your folders etc!
set armapath="D:\SteamGames\steamapps\common\Arma 3"
set armaparams=-AutoInit -port=2302 -maxMem=2047 -loadMissionToMemory "-mod=@ALF_server;@ALF" "-config=D:\SteamGames\steamapps\common\Arma 3\config.cfg" "-cfg=D:\SteamGames\steamapps\common\Arma 3\basic.cfg" "-BEPath=D:\SteamGames\steamapps\common\Arma 3\Battleye"
set serverexe=arma3server.exe

echo.
echo Restarting
:: start the servers..
cd /d %armapath%
start "" %serverexe% %armaparams%


exit