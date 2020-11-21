@echo off
for /l %%A in (0,1,2) Do (
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
	)
	