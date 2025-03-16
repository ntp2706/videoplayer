@echo off
echo Starting local server...

REM Create a VBS script to run Python server hidden
echo Set WshShell = CreateObject("WScript.Shell") > run_server.vbs
echo WshShell.Run "cmd /c python -m http.server 8000", 0 >> run_server.vbs
echo Set WshShell = Nothing >> run_server.vbs

REM Create a VBS script to run Node.js server hidden
echo Set WshShell = CreateObject("WScript.Shell") > run_node.vbs
echo WshShell.Run "cmd /c npx http-server -p 8000 --cors", 0 >> run_node.vbs
echo Set WshShell = Nothing >> run_node.vbs

REM Check if Python is installed
python --version > nul 2>&1
if errorlevel 1 (
    REM Start Node.js server hidden
    start "" wscript.exe run_node.vbs
) else (
    REM Start Python server hidden
    start "" wscript.exe run_server.vbs
)

REM Wait for server to start
timeout /t 2 /nobreak > nul

REM Open browser
start http://localhost:8000/videoplayer.html

REM Delete the temporary VBS scripts
del run_server.vbs
del run_node.vbs

REM Exit the batch script
exit 