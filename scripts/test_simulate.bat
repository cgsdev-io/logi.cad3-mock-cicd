@echo off
set PROJECTPATH=%cd%\vendor\lc3_examples\BasicProject
set WORKSPACE=%cd%\test_workspace
set LOGCONFIG=%cd%\log4j.xml

echo === Simulating LC3 Test Run ===
echo eclipseC -launcher.ini logiCAD3.ini ^-application com.logicals.application.importer.application ^-noSplash ^-projectPath %PROJECTPATH% ^-data %WORKSPACE% ^-vmargs -Dlog4j.configuration=file:%LOGCONFIG%
timeout /t 2 >nul
echo Tests simulated successfully.
