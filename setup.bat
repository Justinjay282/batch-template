@echo off
setlocal enabledelayedexpansion

where python
if errorlevel 1 (
    color 0C
    set duration=5
    echo %red_color%Installation Failed...%red_color%

    echo Please make sure that you have the following.
    echo Python 3.9.*
    echo Added python 3.9 to systen environment variable's PATH

    echo Exiting in ... 

    for /l %%i in (%duration%,-1,1) do (
    echo !duration!...

    timeout /t 1 >nul
    
    set /a duration-=1
    )
    exit /b 1
)

:: set virtual environment name
set venv_name=mmd-venv

:: create virtual environment
echo Creating virtual environment
python -m venv %venv_name%
echo Virtual environment succesfully created
:: 
set venv_directory=.\%venv_name%\Scripts\activate

if exist %venv_directory% (
    echo Installing all dependencies...
    call %venv_directory%
    pip install --no-index --find-links=./dependencies -r requirements.txt
    echo Successfully installed all dependencies
) else (
    echo Incorrect directory, report to ACSS
    timeout /t 2
    goto :end
)

echo Successful Installation, Program Exiting...

timeout /t 3
