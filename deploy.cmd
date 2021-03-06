@echo off
rem You should set next parameters as environment variables: USERNAME, PASSWORD

set SERVER=ec2-35-166-8-83.us-west-2.compute.amazonaws.com
set SITE_NAME=sample.local
set USERNAME=Administrator
set MSDEPLOY="C:\Program Files (x86)\IIS\Microsoft Web Deploy V3\msdeploy.exe"
rem test
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

SET _DeploySetParametersFile=D:\TeamCity\buildAgent\work\362562ae9b31fb9a\Parameters.xml
set _MsDeployAdditionalFlags=%_MsDeployAdditionalFlags% -setParam:'IIS Web Application Name'='%SITE_NAME%' -allowUntrusted
call "%~dp0sample\obj\sample.deploy.cmd " /Y /U:%USERNAME% /P:%PASSWORD% /M:%SERVER%
IF %ERRORLEVEL% NEQ 0 exit /b %ERRORLEVEL%

Echo    ***** Deploy successful ***** 