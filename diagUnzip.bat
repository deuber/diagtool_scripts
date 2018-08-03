@echo off
setlocal enabledelayedexpansion

REM Author David Deuber

REM =============================================================
REM This tool unzips any .zip file
REM First arguement is name of .zip file
REM ==============================================================

IF EXIST "C:\Program Files\7-Zip\7z.exe" (set ziptool="C:\Program Files\7-Zip\7z.exe") ELSE (GOTO :EXIT)



set argCount=0
for %%x in (%*) do (
   set /A argCount+=1
   set "argVec[!argCount!]=%%~x"
)

IF %argCount% equ 0 (goto BLANK )
IF %argCount% equ 1 (goto ONE )
IF %argCount% gtr 1 (goto MAX )

:ONE
rem take input from user and clean up if needed
set zipFile=%1
set uNzipFile=%zipFile:~0,-4%



IF NOT EXIST %zipFile% (GOTO :NOFILE)
IF EXIST %uNzipFile% (GOTO :DONE_ALREADY)


IF NOT EXIST zipDir (mkdir zipDir 2>nul)


%ziptool% -r  x %zipFile% -oc:%uNzipFile% -y 2> nul


move %zipFile% zipDir > nul
echo.
@echo Unzipping %zipFile%
@echo Zipped file %zipFile% moved to zipDir
echo.


goto :eof

:NOFILE
@echo Warning: %zipFile% file not found
@echo This tool requires one arguement, a zipped file
@echo Exiting script
goto :eof

:DONE_ALREADY
@echo Warning: This file is already unzipped
@echo Exiting script
goto :eof


:EXIT
@echo Warning: 7-Zip appears to be missing
@echo Download 7-Zip to "C:\Program Files\"
@echo Exiting program
goto :eof

:BLANK
@echo Warning: No arguement given
@echo What file do want to unzip?
goto :eof

:MAX
@echo Warning: Too many arguements
@echo You only need to add a zipped file
goto :eof





