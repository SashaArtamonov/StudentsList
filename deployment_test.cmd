msdeploy.exe -verb:sync -source:package=”C:\Users\Administrator\Desktop\msbuild\StudentsList\StudentsList\obj\Debug\Package\StudentsList.zip” -dest:iisApp=”students.local/subfolder01?,
wmsvc=students.local,username=Administrator,password=vagrant,
skipAppCreation=false -allowUntrusted=true