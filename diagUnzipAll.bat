@echo off

REM Author David Deuber

REM =============================================================
REM this tool unzips all your files within a dir
REM No arguement needed
REM ==============================================================



REM Got zip files? 
IF NOT EXIST *diagtool*.zip  (GOTO :EXIT_NONE)


echo Unzipping the following diagtool results
for %%a in (*diagtool*.zip) do diagUnzip.bat  %%a 


goto :eof


:EXIT
echo ------------------------------------------
@echo Warning: No zip files here
@echo Exiting program
echo ------------------------------------------
goto :eof

:EXIT_NONE
echo ------------------------------------------
@echo Warning: No .zip files found with name including "diagtool"
@echo If your zipped files are in fact diagtool results, rename the file to include string "diagtool"
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



