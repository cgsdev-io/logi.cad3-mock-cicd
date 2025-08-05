@echo off
REM === Usage: load_project.bat <ProjectName> <ConfigurationName> <TargetName> ===

if "%~1"=="" (
    echo ERROR: Project name parameter is missing.
    echo Usage: %~nx0 ProjectName ConfigurationName TargetName
    exit /b 1
)

if "%~2"=="" (
    echo ERROR: Configuration name parameter is missing.
    echo Usage: %~nx0 ProjectName ConfigurationName TargetName
    exit /b 1
)

if "%~3"=="" (
    echo ERROR: Target name parameter is missing.
    echo Usage: %~nx0 ProjectName ConfigurationName TargetName
    exit /b 1
)

set PROJECTNAME=%~1
set CONFIGNAME=%~2
set TARGETNAME=%~3
set WORKSPACE=%cd%\%PROJECTNAME%
set LOGCONFIG=%cd%\log4j.xml

if not exist "%WORKSPACE%" (
    echo ERROR: Workspace "%WORKSPACE%" does not exist. Import or create the project first.
    exit /b 1
)

echo === Loading LC3 Project: %PROJECTNAME% with configuration: %CONFIGNAME% to target: %TARGETNAME% ===
eclipseC -launcher.ini logiCAD3.ini ^
 -application com.logicals.application.loader.application ^
 -noSplash ^
 -data "%WORKSPACE%" ^
 -configurationName %CONFIGNAME% ^
 -targetName %TARGETNAME% ^
 -vmargs -Dlog4j.configuration=file:%LOGCONFIG%

echo === Load process completed for target: %TARGETNAME% ===
