@echo off
setlocal enabledelayedexpansion

:: Define the root folder containing video files
set "root_folder=C:\Users\ASUS\Downloads\Video"

:: Check if FFmpeg is in PATH
where ffmpeg >nul 2>nul
if %errorlevel% neq 0 (
    echo Error: FFmpeg not found. Please check your installation.
    pause
    exit /b
)

:: Iterate through all .ts files in the root folder and subfolders
for /r "%root_folder%" %%F in (*.ts) do (
    set "input=%%F"
    set "output=%%~dpF%%~nF.mp4"

    :: Display the file being processed
    echo ======================================
    echo Converting: "!input!" -> "!output!"
    echo ======================================

    :: Run FFmpeg to convert, handling audio issues
    ffmpeg -y -i "!input!" -c:v copy -c:a aac -b:a 192k "!output!"

    :: Check if FFmpeg was successful
    if %errorlevel% equ 0 (
        echo Conversion successful: "!output!"
        :: If you want to delete the original .ts file after conversion, remove "::" from the line below
        :: del "!input!"
    ) else (
        echo Error during conversion: "!input!"
    )
)

echo All files have been processed!
pause
