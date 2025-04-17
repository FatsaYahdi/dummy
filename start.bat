@echo off
set program_path="path"
set program_name=name
set working_directory=path

:check_process
for /f "tokens=*" %%a in ('time /t') do set current_time=%%a
tasklist /fi "imagename eq %program_name%" /nh /fo csv | findstr /i /c:"%program_name%" > nul
if errorlevel 1 (
    echo [%current_time%] is not running. Starting it...
    cd /d %working_directory%
    start "" %program_path%
    echo [%current_time%] Started.
) else (
    echo [%current_time%] is running. Doing nothing.
)

timeout /t 120 /nobreak > nul
goto :check_process
