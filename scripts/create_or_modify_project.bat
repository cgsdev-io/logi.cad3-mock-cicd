@echo off
REM === Usage: create_or_modify_project.bat <ProjectName> ===

if "%~1"=="" (
    echo ERROR: Project name parameter is missing.
    echo Usage: %~nx0 ProjectName
    exit /b 1
)

set PROJECTNAME=%~1
set WORKSPACE=%cd%\real_workspace
set LOGCONFIG=%cd%\log4j.xml

echo === Creating or Modifying LC3 Project: %PROJECTNAME% ===
eclipseC -launcher.ini logiCAD3.ini ^
 -application com.logicals.application.creator.application ^
 -noSplash ^
 -data "%WORKSPACE%" ^
 -vmargs -Dlog4j.configuration=file:%LOGCONFIG% ^
 -projectName %PROJECTNAME%

echo === Project "%PROJECTNAME%" created or modified in workspace "%WORKSPACE%" ===
