@echo off
echo -----------------------------
echo Starting MP4 remux process...
echo -----------------------------

REM Path to ffmpeg.exe (if you have added ffmpeg to PATH, you don't need to edit this)
set FFMPEG=ffmpeg

REM Loop through all MP4 files in the current folder
for %%F in (*.mp4) do (
    echo Processing: %%F
    "%FFMPEG%" -i "%%F" -c copy -movflags faststart "%%~nF.fixed.mp4"
)

echo -----------------------------
echo All files have been processed!
echo Output files: *.fixed.mp4
echo -----------------------------
pause
