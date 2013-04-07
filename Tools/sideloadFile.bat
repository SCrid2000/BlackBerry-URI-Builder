@echo off

REM echo
echo.     
echo ***************************************************
echo -BLACKBERRY PLAYBOOK/BB1o AUTOMATED LOADING SCRIPT-
echo ***************************************************
echo.      




REM  Make your configuration changes below

SET TABLETIP=EnterYourDeviceIP
SET TABLETPASS=EnterYourDevicePassword

REM  Make your configuration changes above


























IF [%1]==[] GOTO NOAPPGIVEN
IF "%TABLETIP%"=="127.0.0.1" GOTO NOTCONFIGED
IF "%TABLETPASS%"=="mypassword" GOTO NOTCONFIGED
FOR %%J in ("%PATH:;=" "%") do (
	IF EXIST "%%J\java.exe" SET JAVAIN=%%J
	)
IF [%JAVAIN%]==[] GOTO NOJAVA
GOTO STARTINSTALL


:NOTCONFIGED
ECHO.
ECHO You have not entered your tablet configuration into the batch file.
ECHO.
ECHO Please open "PB-Installer.bat" with notepad and change lines 10-11,
ECHO "TABLETIP" and "TABLETPASS" with your Playbook configuration info.
ECHO.
ECHO Exiting...
PING 127.0.0.1 -n 12 >NUL
EXIT

:NOAPPGIVEN
ECHO.
ECHO You did not specifiy an application to be installed, or the command
ECHO was launched directly in explorer with no file drug onto it.
ECHO.
ECHO Usage Example:
ECHO 	PB-Installer.bat C:\Temp\AppToBeInstalled.bar
ECHO.
ECHO Or drag a bar file onto the PB-Installer.bat icon in windows explorer.
ECHO.
ECHO Exiting...
PING 127.0.0.1 -n 12 >NUL
EXIT

:NOJAVA
ECHO.
ECHO Java.exe was not found in your path, is the Java runtime installed?
ECHO.
ECHO Exiting...
PING 127.0.0.1 -n 12 >NUL
EXIT


:STARTINSTALL
REM Everything looks good, lets install
ECHO.
ECHO.
ECHO Starting to install:
ECHO   %1
ECHO.
ECHO To tablet at hostname/ip: %TABLETIP%
ECHO.
ECHO.
PING 127.0.0.1 -n 3 >NUL
java -Xmx512M -jar "%~dp0lib\BarDeploy.jar" -installApp -device %TABLETIP% -password %TABLETPASS% %1
IF "%ERRORLEVEL%"=="1" (
	ECHO.
	ECHO There was an error installing:
	ECHO   %1
	ECHO.
	ECHO Exiting...
	PING 127.0.0.1 -n 12 >NUL
	EXIT
	)

ECHO.
ECHO Completed! Exiting...
PING 127.0.0.1 -n 5 >NUL
