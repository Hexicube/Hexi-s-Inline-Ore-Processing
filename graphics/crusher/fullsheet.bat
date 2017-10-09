:: This script requires Python 3.6+ and Pillow to be installed.
:: to install Python, go to python.org.
:: To install pillow, run "pip install pillow"

echo off

SETLOCAL

SET blenderDirectory="C:\Program Files\Blender Foundation\Blender\blender.exe"
rem Project name for filenames etc
SET projectName=crusher

echo Rendering %projectName% in 10s

:: delay by 10s before starting render
PING.EXE -N 10 127.0.0.1 > NUL

:: full rendering commands for all angles, frames etc and then creating spritesheets

%blenderDirectory% %projectName%.blend -o //render/HR/render_### -F PNG -b -t 3 -a
:: %blenderDirectory% %projectName%.blend -o //render/HR/render_### -F PNG -b -a
python _spritesheet2.py render/HR/ render/%projectName%_LR --halve True
python _spritesheet2.py render/HR/ render/%projectName%_HR --resolution 4096

pause