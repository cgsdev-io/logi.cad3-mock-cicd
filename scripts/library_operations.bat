@echo off
REM === Usage: library_operations.bat <ProjectName> <LibraryDefinitionName> [LibraryNameVersion] [LibDeployTo] [FullLibraryName] [EnableLibCheck] ===
REM Mandatory:
REM   ProjectName            - Workspace/project folder name
REM   LibraryDefinitionName  - .lc3lib file name (case-sensitive)
REM Optional:
REM   LibraryNameVersion     - Name__Version for build/deploy (e.g., MyLib__1.0.0)
REM   LibDeployTo            - Deployment target folder
REM   FullLibraryName        - Full path to library ZIP for verification
REM   EnableLibCheck         - Set to "true" to perform library verification

if "%~1"=="" (
    echo ERROR: Project name parameter is missing.
    echo Usage: %~nx0 ProjectName LibraryDefinitionName [LibraryNameVersion] [LibDeployTo] [FullLibraryName] [EnableLibCheck]
    exit /b 1
)

if "%~2"=="" (
    echo ERROR: Library definition name parameter is missing.
    echo Usage: %~nx0 ProjectName LibraryDefinitionName [LibraryNameVersion] [LibDeployTo] [FullLibraryName] [EnableLibCheck]
    exit /b 1
)

set PROJECTNAME=%~1
set LIBDEFNAME=%~2
set LIBNAMEVER=%~3
set LIBDEPLOYTO=%~4
set FULLLIBNAME=%~5
set ENABLELIBCHECK=%~6

set WORKSPACE=%cd%\%PROJECTNAME%
set LOGCONFIG=%cd%\log4j.xml

if not exist "%WORKSPACE%" (
    echo ERROR: Workspace "%WORKSPACE%" does not exist. Import or create the project first.
    exit /b 1
)

REM Build base command
set CMD=eclipseC -launcher.ini logiCAD3.ini ^
 -application com.logicals.library.lc3lib.application ^
 -noSplash ^
 -data "%WORKSPACE%" ^
 -projectPath "%WORKSPACE%\\%PROJECTNAME%" ^
 -libraryDefinitionName %LIBDEFNAME% ^
 -vmargs -Dlog4j.configuration=file:%LOGCONFIG%

REM Add optional build
if not "%LIBNAMEVER%"=="" (
    set CMD=%CMD% -libBuild %LIBNAMEVER%
) else (
    set CMD=%CMD% -libBuild
)

REM Add optional deploy
if not "%LIBNAMEVER%"=="" (
    set CMD=%CMD% -libDeploy %LIBNAMEVER%
) else (
    set CMD=%CMD% -libDeploy
)

REM Add optional deploy target
if not "%LIBDEPLOYTO%"=="" (
    set CMD=%CMD% -libDeployTo "%LIBDEPLOYTO%"
)

REM Add optional library check
if /I "%ENABLELIBCHECK%"=="true" (
    set CMD=%CMD% -libCheck
    if not "%FULLLIBNAME%"=="" (
        set CMD=%CMD% -fullLibraryName "%FULLLIBNAME%"
    )
)

echo === Executing: %CMD% ===
%CMD%

echo === Library operation(s) completed. ===
