@echo off
title OneOS SDK
echo.
echo.
echo.
echo Loading... Please wait...
echo.
echo.
set projectspath=%cd%\projects
ping -n 3 localhost>nul
:main
cls
echo Welcome back, creator. 
echo What project are we working on now?
echo.
dir /b projects\*.oap
echo.
echo 1.Delete   2.Open   3.Create   4.Exit
set /p choice=Action: 
if %choice%==4 exit
set /p project=Project: 
if %choice%==1 goto delete
if %choice%==2 goto open
if %choice%==3 goto create

:delete
cls
call dialog.bat 4 "Are you sure?(Delete)"
if %answer%==1 del /s /q projects\%project%.oap
goto main

:create
echo @echo off>>projects\%project%.oap
echo ::your code here>>projects\%project%.oap
goto main

:open
cls
echo Project opening,please wait
ping -n 3 localhost>nul
:projectedit
cls
echo.
echo 1.Edit   2.Compile   3.Compile and run   4.Copy to APPS   5.Close
set /p choice2=: 
if %choice2%==1 edit projects\%project%.oap
if %choice2%==2 copy projects\%project%.oap projects\%project%.cmd
if %choice2%==3 (copy projects\%project%.oap ..\%project%.cmd & start ..\%project%.cmd)
if %choice2%==4 copy projects\%project%.oap ..\apps\%project%.bat
if %choice2%==5 goto main
goto projectedit


