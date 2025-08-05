@echo off
REM Usage: test_block.bat <ProjectName> <LibraryDefinitionName> <BlockName>
if "%~1"=="" (
    echo ERROR: Project name is missing.
    exit /b 1
)
if "%~2"=="" (
    echo ERROR: Library definition name (.lc3lib) is missing.
    exit /b 1
)
if "%~3"=="" (
    echo ERROR: Block name is missing.
    exit /b 1
)
set PROJECTNAME=%~1
set LIBDEFNAME=%~2
set BLOCKNAME=%~3
set WORKSPACE=%cd%\%PROJECTNAME%
set LOGCONFIG=%cd%\log4j.xml
if not exist "%WORKSPACE%" (
    echo ERROR: Workspace not found: %WORKSPACE%
    exit /b 1
)
eclipseC -launcher.ini logiCAD3.ini ^
 -application com.logicals.library.lc3lib.application ^
 -noSplash ^
 -data "%WORKSPACE%" ^
 -projectPath "%WORKSPACE%\\%PROJECTNAME%" ^
 -libraryDefinitionName %LIBDEFNAME% ^
 -libTestBlock %BLOCKNAME% ^
 -vmargs -Dlog4j.configuration=file:%LOGCONFIG%
