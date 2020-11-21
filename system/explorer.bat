@echo off
title Explorer
cd C:\
:main
cls
dir /b
echo.
echo 1.Goto   2.Delete   3.Create(folder)   4.Create(file)
echo 5.Edit   6.Reflesh  7.Open             8.Exit
set /p choice=
if %choice%==1 goto goto
if %choice%==2 goto delete
if %choice%==3 goto createdir
if %choice%==4 goto createfile
if %choice%==5 goto edit
if %choice%==6 goto main
if %choice%==7 goto open
if %choice%==8 exit


:goto
cls
echo Go to 
set /p to=Folder: 
cd %to%
goto main
:delete
cls
echo Delete 
set /p del=Folder/file: 
del /s /q %del%
rmdir /s /q %del%
goto main
:createfile
cls
echo Create file in this folder with 
set /p name=Name: 
echo .>>%name%
goto main
:createdir
cls
echo Create folder in here with 
set /p name=Name: 
mkdir %name%
goto main

:edit
cls
echo Edit
set /p name=File: 
edit %name%
if %errorlevel%==1 (Fatal error! Command "edit" is not avaiable. && pause)
goto main
:open
cls
echo Open
set /p name=File:
start %name%
goto main