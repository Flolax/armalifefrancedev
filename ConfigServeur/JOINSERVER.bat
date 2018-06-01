@echo off
:: Modify your folders etc!
set armapath="D:\SteamGames\steamapps\common\Arma 3"
set armaparams=-connect=127.0.0.1 -port=2302 -password=dev -mod=@ALF -noLauncher -useBE -skipIntro -noSplash -noPause -world=empty -showScriptErrors -noFilePatching
set serverexe=arma3launcher.exe

echo.
echo Restarting
:: start the servers..
cd /d %armapath%
start "" %serverexe% %armaparams%

exit