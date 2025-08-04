@echo off
set PROJECTPATH=%cd%\\vendor\\lc3_examples\\BasicProject
set WORKSPACE=%cd%\temp_workspace

echo === Simulating LC3 Build ===
echo logiCAD3.exe -data "%WORKSPACE%" ^
 -projectPath "%PROJECTPATH%" ^
 -application com.logicals.builder.lc3builder.application ^
 -configurationName BasicConfig
timeout /t 2 >nul
echo Build simulated successfully.
