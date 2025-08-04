@echo off
set PROJECTPATH=%cd%\\vendor\\lc3_examples\\BasicProject
set WORKSPACE=%cd%\lc3_workspace
set LOGCONFIGURATION=%cd%\log4j.xml

echo === Real LC3 Test Run ===
"C:\Program Files\logi.cals\logiCAD3\eclipseC.exe" --launcher.ini logiCAD3.ini ^
 -application com.logicals.application.importer.application ^
 -noSplash -projectPath "%PROJECTPATH%" -data "%WORKSPACE%" ^
 -vmargs -Dlog4j.configuration=file:%LOGCONFIGURATION%

echo === Test complete ===
