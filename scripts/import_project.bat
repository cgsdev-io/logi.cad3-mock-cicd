@echo off
REM === Usage: import_project.bat <ProjectPath> ===

if "%~1"=="" (
    echo ERROR: Project path parameter is missing.
    echo Usage: %~nx0 ProjectPath
    exit /b 1
)

set PROJECTPATH=%~1

REM Extract folder name from given project path for workspace name
for %%I in ("%PROJECTPATH%") do set PROJECTNAME=%%~nI

set WORKSPACE=%cd%\%PROJECTNAME%
set LOGCONFIG=%cd%\log4j.xml

REM Create workspace directory if it doesn't exist
if not exist "%WORKSPACE%" (
    mkdir "%WORKSPACE%"
)

echo === Importing LC3 Project from: %PROJECTPATH% into workspace: %WORKSPACE% ===
eclipseC -launcher.ini logiCAD3.ini ^
 -application com.logicals.application.importer.application ^
 -noSplash ^
 -projectPath "%PROJECTPATH%" ^
 -data "%WORKSPACE%" ^
 -vmargs -Dlog4j.configuration=file:%LOGCONFIG%

echo === Project "%PROJECTNAME%" imported successfully into "%WORKSPACE%" ===
