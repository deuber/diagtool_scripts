@echo off


REM Author David Deuber


REM =============================================================
REM this tool combines all your log4j files into one file
REM run from the dir containing your log4j files
REM ==============================================================

REM ==============================================
set maxfile=30
REM limit the number of files to be combined
REM ==============================================

REM Don't run if exists
if EXIST log4all.log (GOTO :EXIT_ALREADY_DONE)

REM Got Glogg?
IF EXIST "C:\Program Files\glogg\glogg.exe" (set editor="C:\Program Files\glogg\glogg.exe") ELSE (GOTO :EXIT)


REM Got log4j?

IF EXIST *log4j* (echo Combining log4j files into one log4all.log) ELSE (GOTO :EXIT_NONE)
@echo please wait

REM move .csv out of the way
REM make excel dir if needed
if EXIST *csv* (if not exist excel_files mkdir excel_files )
REM move excel files to excek dir 
if EXIST *csv* ( move *csv* excel_files  >nul ) 





echo.
for %%a in (log4j*) do echo %%a 
echo.


REM Counting number of log4j files, too many might be bad
set i=0
for %%a in (log4j*) do set /a i+=1
if %i% gtr %maxfile% GOTO :EXIT_TOO_MANY


for %%a in (log4j*) do echo [%%a] >> log4all.log & type "%%a" >> log4all.log


@echo Removing no longer needed files:
for %%a in (log4j*) do echo %%a 
for %%a in (log4j*) do del %%a 
echo.




start %editor%  log4all.log


goto :eof


:EXIT
echo ------------------------------------------
@echo Warning: Glogg or 7zip appears to be missing
@echo Download Glogg to "C:\Program Files\"
@echo Download 7-Zip to "C:\Program Files\"
@echo Exiting program
echo ------------------------------------------
goto :eof

:EXIT_NONE
echo ------------------------------------------
@echo Warning: No log4j files here
@echo Are you running from the right place?
@echo Exiting program
echo ------------------------------------------
goto :eof

:EXIT_TOO_MANY
echo ------------------------------------------
@echo Warning: Too many log4j files
@echo Exiting program
echo ------------------------------------------

:EXIT_ALREADY_DONE
echo ------------------------------------------
@echo Warning: log4all.log aleady exists here
@echo Exiting program
echo ------------------------------------------

goto :eof



