@echo off
echo              OneOS Apps
cd..
cd apps
:appstart
cls
dir /b *.bat
dir /b *.exe
set /p app=App name:
cls
call %app%
goto appstart