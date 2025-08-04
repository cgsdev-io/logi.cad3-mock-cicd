@echo off
set PROJECTPATH=%cd%\\vendor\\lc3_examples\\BasicProject
set WORKSPACE=%cd%\lc3_workspace

echo === Real LC3 Build ===
"C:\Program Files\logi.cals\logiCAD3\logiCAD3.exe" ^
 -data "%WORKSPACE%" ^
 -projectPath "%PROJECTPATH%" ^
 -application com.logicals.builder.lc3builder.application ^
 -configurationName BasicConfig

echo === Build complete ===
