@echo off
set PROJECTPATH=%cd%\vendor\lc3_examples\BasicProject
set WORKSPACE=%cd%\real_test_workspace
set LOGCONFIG=%cd%\log4j.xml

echo === Importing Project into Workspace ===
eclipseC -launcher.ini logiCAD3.ini ^
 -application com.logicals.application.importer.application ^
 -noSplash ^
 -projectPath "%PROJECTPATH%" ^
 -data "%WORKSPACE%" ^
 -vmargs -Dlog4j.configuration=file:%LOGCONFIG%

echo === Running LC3 Real Unit Tests ===
eclipseC -launcher.ini logiCAD3.ini ^
 -application com.logicals.unittest.runner.application ^
 -noSplash ^
 -projectPath "%PROJECTPATH%" ^
 -data "%WORKSPACE%" ^
 -vmargs -Dlog4j.configuration=file:%LOGCONFIG%

echo === Test run complete ===
