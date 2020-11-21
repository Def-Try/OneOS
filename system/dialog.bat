@echo off
if %1==1 goto custom
if %1==2 goto okcancel
if %1==3 goto cancelretryskip
if %1==4 goto yesno
if %1==4 goto ok
goto help

:help
echo Dialog OneOS command
echo Usage:
echo   call dialog.bat [mode] [text] {button1} {button2}
echo.
echo  Mode - working mode:
echo                     1.Custom
echo                     2.OK, Cancel
echo                     3.Cancel, Retry, Skip
echo                     4.Yes, No
echo                     5.OK
echo  Text - dialog text(in "")
echo  Button1 - Button 1 text(ONLY CUSTOM MODE, in "")
echo  Button2 - Button 2 text(ONLY CUSTOM MODE, in "")
goto :EOF
:okcancel
echo %2
call button 10 10 0F "OK" 20 10 0F "Cancel" X _Var_Box _Var_Hover
GetInput /M %_Var_Box% /H %_Var_Hover%
if %errorlevel%==1 set answer=1
if %errorlevel%==2 set answer=2
goto :EOF
:cancelretryskip
echo %2
call button 10 10 0F "Retry" 20 10 0F "Skip" 30 10 0F "Cancel" X _Var_Box _Var_Hover
GetInput /M %_Var_Box% /H %_Var_Hover%
if %errorlevel%==1 set answer=1
if %errorlevel%==2 set answer=2
if %errorlevel%==2 set answer=3
goto :EOF
:yesno
echo %2
call button 10 10 0F "Yes" 20 10 0F "No" X _Var_Box _Var_Hover
GetInput /M %_Var_Box% /H %_Var_Hover%
if %errorlevel%==1 set answer=1
if %errorlevel%==2 set answer=2
goto :EOF
:ok
echo %2
call button 10 10 0F "OK" X _Var_Box _Var_Hover
GetInput /M %_Var_Box% /H %_Var_Hover%
if %errorlevel%==1 set answer=1
goto :EOF
:custom
echo %2
call button 10 10 0F %3 10 20 0F %4 X _Var_Box _Var_Hover
GetInput /M %_Var_Box% /H %_Var_Hover%
if %errorlevel%==1 set answer=1
if %errorlevel%==2 set answer=2
goto :EOF

:exit