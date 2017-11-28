@echo off
rem You should set next parameters as environment variables: USERNAME, PASSWORD

set SERVER=ec2-52-89-164-203.us-west-2.compute.amazonaws.com
set SITE_NAME=sample.local
set USERNAME=Administrator
set PASSWORD=2340262608Aa
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

SET _DeploySetParametersFile=C:\Users\vagrant\Desktop\sample\Parameters.xml
set _MsDeployAdditionalFlags=%_MsDeployAdditionalFlags% -setParam:'IIS Web Application Name'='%SITE_NAME%' -allowUntrusted
call "%~dp0sample\obj\sample.deploy.cmd " /Y /U:%USERNAME% /P:%PASSWORD% /M:%SERVER%
IF %ERRORLEVEL% NEQ 0 exit /b %ERRORLEVEL%

Echo    ***** Deploy successful ***** 