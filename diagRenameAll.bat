@echo off

REM Author David Deuber

REM =============================================================
REM this tool renames only diagtool result dirs
REM No arguement needed
REM ==============================================================




echo.
for /D %%a in (*diagtool_results*) do call diagRename.bat %%a 
echo.

IF NOT EXIST pdt\ mkdir pdt
@echo Moving all Diagtool results to pdt dir and runing Diagsearch tool
FOR /d %%i IN (*_pdt) DO move %%i pdt\%%i 
echo.



goto :eof


:EXIT
echo ------------------------------------------
@echo Warning: No zip files here
@echo Exiting program
echo ------------------------------------------
goto :eof

:EXIT_NONE
echo ------------------------------------------
@echo Warning: No original zip files here
@echo Are you running from the location?
@echo Exiting program
echo ------------------------------------------
goto :eof



:EXIT_ALREADY_DONE
echo ------------------------------------------
@echo Warning: log4all.log aleady exists
@echo Warning: If you need to run again remove log4all.log and exit Glogg first
@echo Exiting program
echo ------------------------------------------
goto :eof



