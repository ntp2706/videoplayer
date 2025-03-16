@echo off
setlocal

:: Define the folder containing .ts files
set "target_folder=C:\Users\ASUS\Downloads\Video"

:: Confirm deletion of all .ts files
echo Warning: All .ts files in "%target_folder%" will be deleted!
choice /C YN /M "Are you sure you want to continue? (Y/N)"

:: If the user chooses "Y", proceed with deletion
if %errorlevel% equ 1 (
    echo Deleting .ts files...
    del /s /q "%target_folder%\*.ts"
    echo Done! All .ts files have been deleted.
) else (
    echo Deletion canceled.
)

pause
