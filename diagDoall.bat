@echo off
setlocal enabledelayedexpansion

REM Author David Deuber


REM =============================================================
echo.
@echo This tool runs multiple diagtools in one command
echo.
@echo Unzips all .zip files within the directory
@echo Moves zipped files to a new zipDir directory
@echo Finds diagtool results and renames them based on their Polarion context (Standalone, Coordinator, Nodes)
@echo Creates a new pdt directory
@echo Moves renamed Diagtool results to pdt dir
@echo Combines log4j files into one log4all.log within main_latest_logs directories
@echo Runs diagsearch parsing tool on contents of pdt dir
@echo See also http://cns.labs.polarion.com/polarion/#/project/support/wiki/How%20To/Diagtool%20scripts
echo.
REM ==============================================================

@echo -------------------------------------------------------
@echo Step One: Unzip all .zip files
@echo -------------------------------------------------------
@echo running diagUnzipAll.bat
diagUnzipAll.bat|more

@echo -------------------------------------------------------
@echo Step Two: Rename Diagtool results folders
@echo -------------------------------------------------------
@echo running diagRenameAll.bat
diagRenameAll.bat|more

@echo -------------------------------------------------------
@echo Step Three: Combine log4j files within each instance
@echo -------------------------------------------------------
@echo running diaglog4jComboAll.bat
diaglog4jComboAll.bat pdt |more

@echo -------------------------------------------------------
@echo Last Four: Run Diasearch log parsing tool
@echo -------------------------------------------------------
@echo running diagsearch pdt
diagsearch pdt







