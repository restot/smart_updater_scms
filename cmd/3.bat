@echo on
set /a var=2

:LOOP

start "do_%var%" cmd /k "color a && rails g migration AddColToVendor%var% visible:bool && pause && exit" 

if %var% gtr 9 goto :END
set /a var+=1
goto :LOOP
:END
pause
