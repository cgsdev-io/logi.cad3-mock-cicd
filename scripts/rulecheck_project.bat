@echo off
REM === Usage: rulecheck_project.bat <ProjectName> <ObjectToValidate> <ReportPath> <ReportFile> ===

if "%~1"=="" (
    echo ERROR: Project name parameter is missing.
    echo Usage: %~nx0 ProjectName ObjectToValidate ReportPath ReportFile
    exit /b 1
)

if "%~2"=="" (
    echo ERROR: ObjectToValidate parameter is missing.
    echo Usage: %~nx0 ProjectName ObjectToValidate ReportPath ReportFile
    exit /b 1
)

if "%~3"=="" (
    echo ERROR: ReportPath parameter is missing.
    echo Usage: %~nx0 ProjectName ObjectToValidate ReportPath ReportFile
    exit /b 1
)

if "%~4"=="" (
    echo ERROR: ReportFile parameter is missing.
    echo Usage: %~nx0 ProjectName ObjectToValidate ReportPath ReportFile
    exit /b 1
)

set PROJECTNAME=%~1
set OBJECT=%~2
set REPORTPATH=%~3
set REPORTFILE=%~4
set WORKSPACE=%cd%\%PROJECTNAME%
set LOGCONFIG=%cd%\log4j.xml

if not exist "%WORKSPACE%" (
    echo ERROR: Workspace "%WORKSPACE%" does not exist. Import or create the project first.
    exit /b 1
)

if not exist "%REPORTPATH%" (
    mkdir "%REPORTPATH%"
)

echo === Running Rule Check on LC3 Project: %PROJECTNAME% ===
eclipseC -launcher.ini logiCAD3.ini ^
 -application com.logicals.mrc.application ^
 -noSplash ^
 -data "%WORKSPACE%" ^
 -projectPath "%WORKSPACE%\\%PROJECTNAME%" ^
 -objectToValidate "%OBJECT%" ^
 -outputPath "%REPORTPATH%" ^
 -outputFile "%REPORTFILE%" ^
 -checkEmptyWorkspace ^
 -vmargs -Dlog4j.configuration=file:%LOGCONFIG%

echo === Rule check completed. Report saved to: %REPORTPATH%\\%REPORTFILE% ===
