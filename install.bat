@echo off
setlocal

REM Define the target directory
set "targetDir=C:\Users\%USERNAME%\AppData\LocalLow\Colossal Order\Cities Skylines II\ModsData\ExtraAssetsImporter\CustomDecals\WallDecor"

REM Check if the WallDecor folder exists
if not exist "WallDecor" (
    echo ERROR: The "WallDecor" folder is missing. Ensure it is in the same directory as this script.
    pause
    exit /b
)

REM Create the directories if they do not exist
if not exist "%targetDir%" (
    mkdir "%targetDir%"
    if errorlevel 1 (
        echo ERROR: Failed to create target directory. Check your permissions.
        pause
        exit /b
    )
)

REM Copy the contents of WallDecor to the target directory
xcopy "WallDecor" "%targetDir%" /E /I /Y
if errorlevel 1 (
    echo ERROR: Failed to copy files. Check your permissions or folder structure.
    pause
    exit /b
)

echo Installation complete.
pause