@echo on
set /a var=1

:LOOP

start "do_%var%" cmd /k "color a && rails g model Vendor%var% col_0:text col_1:text col_2:text col_3:text col_4:text col_5:text col_6:text col_7:text col_8:text col_9:text col_10:text col_11:text col_12:text col_13:text col_14:text col_15:text col_16:text col_17:text col_18:text col_19:text col_20:text col_21:text col_22:text col_23:text col_24:text col_25:text col_26:text col_27:text col_28:text col_29:text col_30:text col_31:text col_32:text col_33:text col_34:text col_35:text col_36:text col_37:text col_38:text col_39:text col_40:text col_41:text col_42:text col_43:text col_44:text col_45:text col_46:text col_47:text col_48:text col_49:text col_50:text col_51:text col_52:text col_53:text col_54:text col_55:text col_56:text col_57:text col_58:text col_59:text col_60:text col_61:text col_62:text col_63:text col_64:text col_65:text col_66:text col_67:text col_68:text col_69:text col_70:text col_71:text col_72:text col_73:text col_74:text col_75:text col_76:text col_77:text col_78:text col_79:text col_80:text col_81:text col_82:text col_83:text col_84:text col_85:text col_86:text col_87:text col_88:text col_89:text col_90:text col_91:text col_92:text col_93:text col_94:text col_95:text col_96:text col_97:text col_98:text col_99:text col_100:text && pause && exit" 

if %var% gtr 9 goto :END
set /a var+=1
goto :LOOP
:END
pause
