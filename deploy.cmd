@echo off
rem You should set next parameters as environment variables: USERNAME, PASSWORD

set SERVER=EPUALVIW1468T1
set SITE_NAME=students.local
set USERNAME=Deploy
set PASSWORD=vagrant
rem setlocal enableDelayedExpansion
rem set "newValue=myNewValue"
rem type "Parameters.xml"|repl "(<Phone>).*(</Phone>)" "$1!newValue!$2" >Parameters.xml.new



set MSDEPLOY="C:\Program Files (x86)\IIS\Microsoft Web Deploy V3\msdeploy.exe"

IF "%USERNAME%"=="" (
    echo USERNAME is not defined
    exit /b 1
)

IF "%PASSWORD%"=="" (
    echo PASSWORD is not defined
    exit /b 1
)

IF "%SERVER%"=="" (
    echo TARGET is not defined
    exit /b 1
)

IF "%SITE_NAME%"=="" (
    echo TARGET is not defined
    exit /b 1
)

icacls "\\App_Data\StudentsList.xml" /grant %$USERNAME%:(OI)(CI)F /T
set _MsDeployAdditionalFlags=%_MsDeployAdditionalFlags% -setParam:'IIS Web Application Name'='%SITE_NAME%' -allowUntrusted -verbose -setParamFile:Parameters.xml
 call "%~dp0StudentsList\obj\Debug\Package\StudentsList.deploy.cmd " /Y /U:%USERNAME% /P:%PASSWORD% /M:%SERVER%
IF %ERRORLEVEL% NEQ 0 exit /b %ERRORLEVEL%

Echo    **** Deploy successful ****