@echo off

:check_Permissions
    net session >nul 2>&1
    if %errorLevel% == 0 (
        echo sprunki is good
    ) else (
        echo RUN THIS AS ADMINISTRATOR OR I WILL CASTRATE YOU!!
    )
    
    pause >nul

haxe --version | findstr "4.2.5" >nul
if errorlevel 1 (
	goto check_Permissions
	echo Downloading Haxe 4.2.5...
	powershell -Command "& {Invoke-WebRequest -Uri 'https://github.com/HaxeFoundation/haxe/releases/download/4.2.5/haxe-4.2.5-win64.exe' -OutFile 'haxe-installer.exe'; Start-Process 'haxe-installer.exe' -Wait -NoNewWindow;}"
)

git --version >nul 2>&1
if errorlevel 1 (
	goto check_Permissions
    echo Installing Git-SCM...
    powershell -Command "& {Invoke-WebRequest -Uri 'https://git-scm.com/download/win' -OutFile 'Git-Installer.exe'; Start-Process 'Git-Installer.exe' -Wait -NoNewWindow;}"
)

haxe -cp commandline -D analyzer-optimize --run Main setup

haxelib run lime test windows -debug