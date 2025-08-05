@echo off
REM Usage: convert_source_to_xmi.bat <ProjectName> <SourceFile> [ReferenceFiles]
if "%~1"=="" (
    echo ERROR: Project name is missing.
    exit /b 1
)
if "%~2"=="" (
    echo ERROR: Source file is missing.
    exit /b 1
)
set PROJECTNAME=%~1
set SRCFILE=%~2
set REFFILES=%~3
set WORKSPACE=%cd%\%PROJECTNAME%
set LOGCONFIG=%cd%\log4j.xml
if not exist "%WORKSPACE%" (
    echo ERROR: Workspace not found: %WORKSPACE%
    exit /b 1
)
set CMD=eclipseC -launcher.ini logiCAD3.ini ^
 -application com.logicals.testing.iecsourcetoxmi.application ^
 -noSplash ^
 -data "%WORKSPACE%" ^
 -iecSource "%SRCFILE%" ^
 -vmargs -Dlog4j.configuration=file:%LOGCONFIG%
if not "%REFFILES%"=="" set CMD=%CMD% -referenceFiles "%REFFILES%"
%CMD%
