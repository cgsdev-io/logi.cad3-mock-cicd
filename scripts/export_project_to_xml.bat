@echo off
REM Usage: export_project_to_xml.bat <ProjectName> [ObjectToExport] [OutputPath] [OutputFile]
if "%~1"=="" (
    echo ERROR: Project name is missing.
    exit /b 1
)
set PROJECTNAME=%~1
set OBJECT=%~2
set OUTPATH=%~3
set OUTFILE=%~4
set WORKSPACE=%cd%\%PROJECTNAME%
set LOGCONFIG=%cd%\log4j.xml
if not exist "%WORKSPACE%" (
    echo ERROR: Workspace not found: %WORKSPACE%
    exit /b 1
)
set CMD=eclipseC -launcher.ini logiCAD3.ini ^
 -application com.logicals.lc32.export.application ^
 -noSplash ^
 -data "%WORKSPACE%" ^
 -projectPath "%WORKSPACE%\\%PROJECTNAME%" ^
 -vmargs -Dlog4j.configuration=file:%LOGCONFIG%
if not "%OBJECT%"=="" set CMD=%CMD% -objectToExport %OBJECT%
if not "%OUTPATH%"=="" set CMD=%CMD% -outputPath "%OUTPATH%"
if not "%OUTFILE%"=="" set CMD=%CMD% -outputFile "%OUTFILE%"
%CMD%
