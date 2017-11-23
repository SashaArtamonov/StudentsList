cp D:\TeamCity\buildAgent\work\f5f9b0bd3b4556c2\artifacts\Parameters.xml "D:\TeamCity\buildAgent\work\362562ae9b31fb9a"
$dir = "D:\TeamCity\buildAgent\work\f5f9b0bd3b4556c2\artifacts"
$filter="*.zip"
$latest = Get-ChildItem -Path $dir -Filter $filter | Sort-Object LastAccessTime -Descending | Select-Object -First 1
$latest.name
Add-Type -AssemblyName System.IO.Compression.FileSystem
function Unzip
{
    param([string]$zipfile, [string]$outpath)

    [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath)
}

Unzip "D:\TeamCity\buildAgent\work\f5f9b0bd3b4556c2\artifacts\$latest" "D:\TeamCity\buildAgent\work\362562ae9b31fb9a"