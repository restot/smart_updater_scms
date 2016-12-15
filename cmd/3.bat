@echo on
set /a var=1

:LOOP

start "do_%var%" cmd /k "color a && rails g migration AddColsToVendor%var% col_101:text col_102:text col_103:text col_104:text col_105:text col_106:text col_107:text col_108:text col_109:text col_110:text col_111:text col_112:text col_113:text col_114:text col_115:text col_116:text col_117:text col_118:text col_119:text col_120:text && pause && exit" 

if %var% gtr 9 goto :END
set /a var+=1
goto :LOOP
:END
pause
