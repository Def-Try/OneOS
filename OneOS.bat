@echo off

title OneOS
cd %path%\system
copy C:\Windows\system32\ping.exe system\
copy C:\Windows\system32\choice.exe system\
copy C:\Windows\system32\ru-RU\choice.exe.mui system\
copy C:\Windows\system32\en-US\choice.exe.mui system\
copy C:\Windows\system32\find.exe system\
mode con: cols=140 lines=49
set path=%cd%
cd %path%\system
::setting main variables


:start
set admin=0
set autorepair=0
set loaderror=0
set mclr=0
set tclr=0
set btclr=0
set bbcls=0
set ver=1.1
set loginbackground=%path%\system\login.bmp
set background=%path%\system\background.bmp
cls
echo Preloading initialization...
echo Press O to goto modes select
choice /t 4 /n /c OC /d C
if %errorlevel%==1 goto modes
goto loading

:modes
cls
echo       OneOS Loading Modes
echo Select loading mode
echo.
echo 1.Standart
echo 2.Secure
echo 3.Recovery
echo.
echo 4.Select operating system
echo 5.Select operation core
echo.
choice /n /c 12345
if %errorlevel%==1 goto loading
if %errorlevel%==2 goto secureloading
if %errorlevel%==3 goto recovery
if %errorlevel%==4 goto systemselect
if %errorlevel%==5 goto coreselect



:loading
echo.
echo                        OneOS
echo.
ColorShow /0a "                       . " &echo . .
ping -n 2 localhost>nul
cls
echo.
echo                        OneOS
echo.
ColorShow /0a "                       . . " &echo .
ping -n 2 localhost>nul
cls
echo.
echo                        OneOS
echo.
ColorShow /0a "                       . . ."
ping -n 2 localhost>nul
cls
echo.
echo                        OneOS
echo.
ColorShow /0a "                       . . " &echo .
ping -n 2 localhost>nul
cls
echo.
echo                        OneOS
echo.
ColorShow /0a "                       . " &echo . . 
ping -n 2 localhost>nul
cls
echo.
echo                        OneOS
echo.
echo                        . . .
ping -n 2 localhost>nul
cls
start "" cmdbkg.exe "%loginbackground%" 30 1
ping -n 3 localhost>nul
color F7
ping -n 2 localhost>nul
color 1F
ping -n 1 localhost>nul
color F7
ping -n 2 localhost>nul
color BF
:loginscreen
cls
set i=0
call button 10 10 0F "Login" 20 10 C0 "Shutdown" X _Var_Box _Var_Hover
GetInput /M %_Var_Box% /H %_Var_Hover%
if %errorlevel%==1 goto loginnew
if %errorlevel%==2 exit
goto loginscreen

:loginnew

::

cls
echo ______________________________
echo \      Login                  \
echo  \_____________________________\
echo.
echo Please,enter your user name and password:

set /p name=User Name: 
set /p usrpass=Password: 
for /f "Delims=" %%a in (..\users\%name%\pass.oui) do (
	set pass=%%a
)
if EXIST "..\users\%name%\%name%.oui" set user=%name%
if %name% NEQ %user% goto nameincorrect
if %usrpass%==%pass% goto desktoploading

:loginold
cls
set /p name=User Name: 
set /p usrpass=Password: 
for /f "Delims=" %%a in (..\users\%name%\pass.oui) do (
	set pass=%%a
)
if EXIST "..\users\%name%\%name%.oui" set user=%name%
if %name% NEQ %user% goto nameincorrect
if %usrpass%==%pass% goto desktoploading
:nameincorrect
cls
echo User name or password incorrect,try again
pause>nul
goto loginscreen
:desktoploading
cls
echo Loading your personal settings
echo.
echo.
echo     (1/2)
echo.
echo   Loading THEME.oui...
for /f "Delims=" %%a in (..\users\%name%\theme.oui) do (
	set theme=%%a
)
if %theme%==1 (
set mclr=8
set tclr=F
set btclr=0
set bbclr=7
color %mclr%%tclr% )
if %theme%==2 (
set mclr=B
set tclr=F
set btclr=0
set bbclr=3
color %mclr%%tclr% )
if %theme%==3 (
set mclr=1
set tclr=F
set btclr=7
set bbclr=0
color %mclr%%tclr% )
if %theme%==4 (
set mclr=0
set tclr=F
set btclr=7
set bbclr=0
color %mclr%%tclr% )
if %theme%==5 (
set mclr=F
set tclr=0
set btclr=0
set bbclr=7
color %mclr%%tclr% )

ping -n 2 localhost>nul

cls
echo Loading your personal settings
echo.
echo.
echo     (2/2)
echo.
echo   Loading IsAdmin.oui...
for /f "Delims=" %%a in (..\users\%name%\IsAdmin.oui) do (
set admin=%%a
)

start "" cmdbkg.exe "%background%" 30 1
goto desktop

:desktop
color %mclr%%tclr%
cls
call box 9 46 3 140 - - 70 0
call button 5 10 %bbclr%%btclr% "Apps" 15 10 %bbclr%%btclr% "Explorer"  0 46 A0 "    Start     " X _Var_Box _Var_Hover
GetInput /M %_Var_Box% /H %_Var_Hover%
if %errorlevel%==1 start apps.bat
if %errorlevel%==2 start explorer.bat
if %errorlevel%==3 goto startmenu
goto desktop

:startmenu
cls
color %mclr%%tclr%
call box 9 46 3 140 - - 70 0
call button 5 10 %bbclr%%btclr% "Apps" 15 10 %bbclr%%btclr% "Explorer"  0 46 A0 "    Start     " 0 43 C0 "Shutdown      " 0 34 %bbclr%%btclr% "Apps          " 0 31 %bbclr%%btclr% "Explorer      " 0 28 %bbclr%%btclr% "Control Panel " 0 40 C0 "Log off       " 0 37 %bbclr%%btclr% "DT-DOS session" X _Var_Box _Var_Hover
GetInput /M %_Var_Box% /H %_Var_Hover%
if %errorlevel%==1 start apps.bat
if %errorlevel%==2 start explorer.bat
if %errorlevel%==3 goto desktop
if %errorlevel%==4 exit
if %errorlevel%==5 start apps.bat
if %errorlevel%==6 start explorer.bat
if %errorlevel%==7 goto controlpanel
if %errorlevel%==8 goto loginscreen
if %errorlevel%==9 goto dtdos
goto desktop
:controlpanel
cls
echo лллл лллл л  л ллл лллл лллл л       лллл лллл л  л ллл л
echo л  л л  л лл л  л  л  л л  л л       л  л л  л лл л л   л
echo л    л  л л лл  л  лллл л  л л       лллл лллл л лл ллл л
echo л  л л  л л  л  л  л л  л  л л       л    л  л л  л л   л
echo лллл лллл л  л  л  л л  лллл ллл     л    л  л л  л ллл ллл
echo.
call button 5 10 %bbclr%%btclr% "Users" 15 10 %bbclr%%btclr% "Themes"  0 46 A0 "Exit" 25 10 %bbclr%%btclr% "About" X _Var_Box _Var_Hover
GetInput /M %_Var_Box% /H %_Var_Hover%
if %errorlevel%==1 goto panelusers
if %errorlevel%==2 goto panelthemes
if %errorlevel%==3 goto desktop
if %errorlevel%==4 goto panelabout

:panelusers
cls
echo л л ллл ллл лллл ллл
echo л л л   л   л  л л
echo л л ллл ллл лллл ллл
echo л л   л л   л л    л
echo ллл ллл ллл л л  ллл
echo.
call button 5 10 %bbclr%%btclr% "Create" 5 20 %bbclr%%btclr% "Delete"  0 46 A0 "Back" X _Var_Box _Var_Hover
GetInput /M %_Var_Box% /H %_Var_Hover%
if %errorlevel%==1 goto createuser
if %errorlevel%==2 goto deleteuser
if %errorlevel%==3 goto controlpanel

:panelthemes
cls
echo ллл л  л ллл л   л ллл ллл
echo  л  л  л л   лл лл л   л
echo  л  лллл ллл л л л ллл ллл
echo  л  л  л л   л   л л     л
echo  л  л  л ллл л   л ллл ллл
echo.
call button 5 10 %bbclr%%btclr% "ZeroOS" 17 10 %bbclr%%btclr% "Windows" 29 10 %bbclr%%btclr% "DOS" 37 10 %bbclr%%btclr% "Terminal" 5 20 %bbclr%%btclr% "Terminal(negative)" 0 46 A0 "Back" X _Var_Box _Var_Hover
GetInput /M %_Var_Box% /H %_Var_Hover%
if %errorlevel%==1 (del /s /q ..\users\%name%\THEME.oui & echo 1>..\users\%name%\THEME.oui)
if %errorlevel%==2 (del /s /q ..\users\%name%\THEME.oui & echo 2>..\users\%name%\THEME.oui)
if %errorlevel%==3 (del /s /q ..\users\%name%\THEME.oui & echo 3>..\users\%name%\THEME.oui)
if %errorlevel%==4 (del /s /q ..\users\%name%\THEME.oui & echo 4>..\users\%name%\THEME.oui)
if %errorlevel%==5 (del /s /q ..\users\%name%\THEME.oui & echo 5>..\users\%name%\THEME.oui)
if %errorlevel%==6 goto controlpanel
goto controlpanel
:panelabout
cls
echo лллл лллл  лллл л л ллл
echo л  л л  лл л  л л л  л
echo лллл лллл  л  л л л  л
echo л  л л  лл л  л л л  л
echo л  л лллл  лллл ллл  л
echo.
echo OneOS version: 1.1
echo OneGET version: 1.6

echo.
echo Developer and design by Def-Try
echo Copying any part of code not allowed
echo Contact: https://discord.gg/GrtRzGG
echo.
echo Hey! A'm avaiable on github!
echo.
call button 0 46 %bbclr%%btclr% "Back" X _Var_Box _Var_Hover
GetInput /M %_Var_Box% /H %_Var_Hover%
if %errorlevel%==1 goto controlpanel


:createuser
cls
echo Creating user name:
set /p usr=: 
echo Creating password:
set /p pass=: 
echo Is admin?(Y/N):
set /p admin1=: 
mkdir ..\users\%usr%\
echo %usr%>..\users\%usr%\user.oui
echo %pass%>..\users\%usr%\pass.oui
if %admin1%==Y echo 1>>..\users\%usr%\IsAdmin.oui
if %admin1%==y echo 1>>..\users\%usr%\IsAdmin.oui
goto controlpanel
:deleteuser
cls
echo Deleting user name:
set /p usr=: 
rmdir /s /q ..\users\%usr%
goto controlpanel

:BSOD
color 0F
echo Oops! We have a problem with OneOS. We stopped it so as not to harm your data. 
echo If this is the first time you see this screen, just reboot. 
echo If this screen appears again, follow these steps:
echo.
echo 	Reboot
echo 	Enter recovery and fix the problem
echo 	Disable services that were installed before the problem appeared
echo 	Contact technical support.
echo.
echo If all else fails, make a copy of this OS version and reinstall
echo.
echo Technical Information:
echo.
echo ErrorLevel: %errorlevel%
echo Stopcode: %stopcode%
echo User: %name%
echo Last loaded module: %module%
echo.
pause>nul
exit

:dtdos
cd ..
color 07
cls
echo DT-DOS session
echo.
echo OneOS 1.1 console
echo.
:command
set /p cmd=OneOS@%name% $~: 
%cmd%
goto command

:: MAIN SECURE MODE CODE, PLANNING TO MOVE IT TO FILE

:secureloading
cls
echo Please wait...
ping -n 3 localhost>nul


:securelogin
set screen=LOGIN
cls
echo Secure Mode                                            Screen:%screen%
call button 10 10 70 "Login" 20 10 C0 "Shutdown" X _Var_Box _Var_Hover
GetInput /M %_Var_Box% /H %_Var_Hover%
if %errorlevel%==1 goto securelogin2
if %errorlevel%==2 exit
goto securelogin

:securelogin2
cls
echo Secure Mode                                            Screen:%screen%
echo.
echo.
echo ______________________________
echo \      Login                  \
echo  \_____________________________\
echo.
echo Please,enter your user name and password:

set /p name=User Name: 
set /p usrpass=Password: 
for /f "Delims=" %%a in (..\users\%name%\pass.oui) do (
	set pass=%%a
)
if EXIST "..\users\%name%\%name%.oui" set user=%name%
if %name% NEQ %user% goto securelogin
if %usrpass%==%pass% goto securedesktop

:securedesktop
set screen=DESKTOP:%name%
cls
echo Secure Mode                                            Screen:%screen%
call box 9 46 3 140 - - 70 0
call button 5 10 70 "LOCK" 15 10 70 "Explorer"  0 46 A0 "    Start     " X _Var_Box _Var_Hover
GetInput /M %_Var_Box% /H %_Var_Hover%
if %errorlevel%==1 goto securedesktop
if %errorlevel%==2 start explorer.bat
if %errorlevel%==3 goto securestart-menu
goto securedesktop

:securestart-menu
set screen=DESKTOP:%name%\DESKTOP:START
cls
echo Secure Mode                                            Screen:%screen%
call box 9 46 3 140 - - 70 0
call button 5 10 70 "LOCK" 15 10 70 "Explorer"  0 46 A0 "    Start     " 0 43 C0 "Shutdown      " 0 34 70 "LOCK          " 0 31 70 "Explorer      " 0 28 70 "Only for full " 0 40 C0 "Log off       " 0 37 70 "              " X _Var_Box _Var_Hover
GetInput /M %_Var_Box% /H %_Var_Hover%
if %errorlevel%==1 goto securedesktop
if %errorlevel%==2 start explorer.bat
if %errorlevel%==3 goto securedesktop
if %errorlevel%==4 exit
if %errorlevel%==5 goto securedesktop
if %errorlevel%==6 start explorer.bat
if %errorlevel%==7 goto securedesktop
if %errorlevel%==8 goto securelogin
if %errorlevel%==9 goto securedesktop
goto securedesktop


:recovery
cls
echo OneOS Recovery Mode
echo.
echo 1.Reset all settings
echo 2.Delete all user data
echo 3.Console
echo 4.Load Update
echo 5.Low-level core manipulations
echo 6.Download last update
echo 7.Reboot
echo.
set /p recch=OneOS@Recovery:~$ 
if %recch%==1 goto recreset
if %recch%==2 goto recdel
if %recch%==3 goto recconsole
if %recch%==4 goto recupdload
if %recch%==5 goto recllcm
if %recch%==6 goto recdlu
if %recch%==7 goto start

:recreset
cls
echo Reseting...
echo 0000>..\users\root\pass.oui
echo 1>..\users\root\THEME.oui
echo.
echo Done!
echo Press any key to continue.
pause>Nul
goto recovery
:recdel
cls
echo Sorry! We can't find user data.
echo Press any key
echo.
pause>nul
goto recovery
:recconsole
cls
color 07
cls
echo  Console
echo.
:command2
set /p cmd=OneOS@Recovery $~: 
%cmd%
goto command2
:recupload
cls
echo Select file to load:
echo.
set 
:systemselect
:coreselect