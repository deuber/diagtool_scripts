@echo off
setlocal enabledelayedexpansion

REM Author David Deuber

REM =============================================================
REM This tool renames the diagtool results based on context 
REM ==============================================================


@echo ------------------------------
set argCount=0
for %%x in (%*) do (
   set /A argCount+=1
   set "argVec[!argCount!]=%%~x"
)

IF %argCount% equ 0 (goto BLANK )
IF %argCount% equ 1 (goto ONE )
IF %argCount% equ 2 (goto TWO )
IF %argCount% gtr 2 (goto MAX )

:TWO
rem take input from user 
set IR_folder=%1
set zipFile=%2

IF NOT EXIST %zipFile% (GOTO :NOZIP)


set diagResults_dir= "\\10.123.30.101\polarion\Support\IR\"

IF NOT EXIST %diagResults_dir% (GOTO :NOFILE)

set diagResults_dir_IR= \\10.123.30.101\polarion\Support\IR\%1

set uploaded_file= \\10.123.30.101\polarion\Support\IR\%1\%2

IF EXIST %diagResults_dir_IR% (GOTO :DIR_EXISTS)
IF NOT EXIST %diagResults_dir_IR% (GOTO :MAKEDIR)


:ONE
@echo Warning: No arguements
@echo The tool requires 2 arguements
@echo eg. diagUpload IR_NUMBER ZIP_FILE
@echo Warning: Exiting Tool
@echo ------------------------------
goto :eof

:DIR_EXISTS
@echo Copying %2 to %diagResults_dir_IR%
xcopy   %2  %diagResults_dir_IR%
@echo %uploaded_file% is now available
@echo ------------------------------
goto :eof


:MAKEDIR
@echo Creating new dir %1 within %diagResults_dir%
mkdir %diagResults_dir_IR%
@echo Copying %2 to %diagResults_dir_IR%
xcopy  %2  %diagResults_dir_IR%
@echo %uploaded_file% is now available
@echo ------------------------------
goto :eof


goto :eof


:NOZIP
@echo Warning: %2% Does not exist
@echo Warning: Exiting Tool
@echo ------------------------------
goto :eof


:NOFILE
@echo Warning: %diagResults_dir% Directory not found 
@echo Warning: Exiting Tool
@echo ------------------------------
goto :eof



:BLANK
@echo Warning: No arguement given, what file do you want to upload? 
@echo Warning: Exiting Tool
@echo ------------------------------
goto :eof

:MAX
@echo Warning: Too many arguements
@echo The tool requires 2 arguements
@echo eg. diagUpload IR_NUMBER ZIP_FILE
@echo Warning: Exiting Tool
@echo ------------------------------
goto :eof





