@echo off
echo Building the application...
call mvn clean package

echo.
echo Please enter your Tomcat installation path (e.g., C:\Program Files\Apache Tomcat 10.1):
set /p TOMCAT_PATH=

echo.
echo Copying WAR file to Tomcat webapps directory...
copy /Y target\fitness-center.war "%TOMCAT_PATH%\webapps\"

echo.
echo Deployment complete!
echo.
echo To start Tomcat:
echo 1. Go to %TOMCAT_PATH%\bin
echo 2. Run startup.bat
echo.
echo Then access your application at: http://localhost:8080/fitness-center
echo.
pause 