cp Parameters.xml "C:\TeamCity\buildAgent\work\63e415b4d300991e"
Add-Type -AssemblyName System.IO.Compression.FileSystem
function Unzip
{
    param([string]$zipfile, [string]$outpath)

    [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath)
}

Unzip "C:\TeamCity\buildAgent\work\e2dfe7db11bd71fd\*.zip" "C:\TeamCity\buildAgent\work\63e415b4d300991e"