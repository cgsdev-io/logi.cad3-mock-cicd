@echo off
REM Usage: pil_test.bat <ProjectName> <TestSuite> <OutputPath> <OutputFile> [ReleaseLibraryNameVersion]
if "%~1"=="" (
    echo ERROR: Project name is missing.
    exit /b 1
)
if "%~2"=="" (
    echo ERROR: Test suite name is missing.
    exit /b 1
)
if "%~3"=="" (
    echo ERROR: Output path is missing.
    exit /b 1
)
if "%~4"=="" (
    echo ERROR: Output file is missing.
    exit /b 1
)
set PROJECTNAME=%~1
set TESTSUITE=%~2
set OUTPATH=%~3
set OUTFILE=%~4
set RELEASENAME=%~5
set WORKSPACE=%cd%\%PROJECTNAME%
set LOGCONFIG=%cd%\log4j.xml
if not exist "%WORKSPACE%" (
    echo ERROR: Workspace not found: %WORKSPACE%
    exit /b 1
)
if not exist "%OUTPATH%" mkdir "%OUTPATH%"
set CMD=eclipseC -launcher.ini logiCAD3.ini ^
 -application com.logicals.application.test.pil.application ^
 -noSplash ^
 -data "%WORKSPACE%" ^
 -projectPath "%WORKSPACE%\\%PROJECTNAME%" ^
 -testSuite %TESTSUITE% ^
 -outputPath "%OUTPATH%" ^
 -outputFile "%OUTFILE%" ^
 -vmargs -Dlog4j.configuration=file:%LOGCONFIG%
if not "%RELEASENAME%"=="" (
    set CMD=%CMD% -releaseLibrary %RELEASENAME%
)
%CMD%
