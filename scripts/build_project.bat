@echo off
REM === Usage: build_project.bat <ProjectName> <ConfigurationName> ===

if "%~1"=="" (
    echo ERROR: Project name parameter is missing.
    echo Usage: %~nx0 ProjectName ConfigurationName
    exit /b 1
)

if "%~2"=="" (
    echo ERROR: Configuration name parameter is missing.
    echo Usage: %~nx0 ProjectName ConfigurationName
    exit /b 1
)

set PROJECTNAME=%~1
set CONFIGNAME=%~2
set WORKSPACE=%cd%\%PROJECTNAME%
set LOGCONFIG=%cd%\log4j.xml

if not exist "%WORKSPACE%" (
    echo ERROR: Workspace "%WORKSPACE%" does not exist. Import or create the project first.
    exit /b 1
)

echo === Building LC3 Project: %PROJECTNAME% with configuration: %CONFIGNAME% ===
eclipseC -launcher.ini logiCAD3.ini ^
 -application com.logicals.builder.lc3builder.application ^
 -noSplash ^
 -data "%WORKSPACE%" ^
 -configurationName %CONFIGNAME% ^
 -vmargs -Dlog4j.configuration=file:%LOGCONFIG%

echo === Build process completed for configuration: %CONFIGNAME% ===
