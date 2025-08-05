@echo off
REM Usage: import_objects_from_xml.bat <ProjectName> <InputFolder> <InputFile> <ImportFolder>
if "%~1"=="" (
    echo ERROR: Project name is missing.
    exit /b 1
)
set PROJECTNAME=%~1
set INPFOLDER=%~2
set INPFILE=%~3
set IMPFOLDER=%~4
set WORKSPACE=%cd%\%PROJECTNAME%
set LOGCONFIG=%cd%\log4j.xml
if not exist "%WORKSPACE%" (
    echo ERROR: Workspace not found: %WORKSPACE%
    exit /b 1
)
set CMD=eclipseC -launcher.ini logiCAD3.ini ^
 -application com.logicals.importer.application ^
 -noSplash ^
 -data "%WORKSPACE%" ^
 -projectPath "%WORKSPACE%\\%PROJECTNAME%" ^
 -vmargs -Dlog4j.configuration=file:%LOGCONFIG%
if not "%INPFOLDER%"=="" set CMD=%CMD% -inputFolder "%INPFOLDER%"
if not "%INPFILE%"=="" set CMD=%CMD% -inputFile "%INPFILE%"
if not "%IMPFOLDER%"=="" set CMD=%CMD% -importFolder "%IMPFOLDER%"
%CMD%
