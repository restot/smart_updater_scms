@echo on
set /a var=1

:LOOP
start "do_%var%" cmd /k "color a && ping 127.0.0.1 -n 2 && exit"

if %var% gtr 3 goto :END
set /a var+=1
goto :LOOP
:END
pause
