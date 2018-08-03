@echo off
setlocal enabledelayedexpansion

REM Author David Deuber

REM =============================================================
REM this tool combines all your log4j files into one file
REM run from the dir above the *_main_latest_logs' dir containing your log4j files
REM ==============================================================



set argCount=0
for %%x in (%*) do (
   set /A argCount+=1
   set "argVec[!argCount!]=%%~x"
)

IF %argCount% equ 0 (goto BLANK )
IF %argCount% equ 1 (goto ONE )
IF %argCount% gtr 1 (goto MAX )

:ONE


rem take input from user 
set diagResults_dir=%1
rem Does string have a trailing slash? if so remove it 
IF %diagResults_dir:~-1%==\ SET diagResults_dir=%diagResults_dir:~0,-1%
IF NOT EXIST %diagResults_dir% (GOTO :NOFILE)





echo.
REM FOR /f "delims=" %%i in ('dir /s/b *_main_latest_logs') do echo %%i
echo.

FOR /f "delims=" %%i in ('dir /s/b *_main_latest_logs') do pushd 2>nul %%i & diaglog4jCombo_noPrompt.bat 2>nul & popd 2>nul


goto :eof



:NOFILE
@echo Warning: File not found
@echo  requires one arguement, the uncompressed PDT
goto :eof

:DONE_ALREADY
@echo Warning: This file is already exists
goto :eof

:NOT_DIAG
@echo Warning: this dir doesn't seem to contain Diagtool results
@echo Not renaming %diagResults_dir%
goto :eof



:BLANK
@echo Warning: No arguement given
@echo What diagsearch folder do want to rename?
goto :eof

:MAX
@echo Warning: Too many arguements
@echo You only need to add a zipped file
goto :eof





