@echo  off
echo. 
echo ********************************************************************************
echo                         BlackBerry 10 URI Shortcut Signer
echo ********************************************************************************
echo                                                         by SCrid2000 (@GShaneC)
echo.
echo.
echo.

echo  Signing...

set password=yourSigningPasswordGoesHere



cd %0\..\
blackberry-signer -storePass %password% %1