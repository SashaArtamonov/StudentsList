SET v_date=%1
if [%v_date%] == [] SET v_date=%date:~10,4%%date:~4,2%%date:~7,2%
cd "C:\TeamCity\buildAgent\work"
::SET v_file="C:\TeamCity\buildAgent\work\e2dfe7db11bd71fd\students-3.zip"
::unzip -o %v_file%
"C:\Program Files\7-Zip\7z.exe" e "students-3.zip"