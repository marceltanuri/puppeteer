$downloadsDir="C:\Users\marce\Downloads"
$downloadsExtension=".ica"

node $PSScriptRoot/index.js

$latestDownload=Get-ChildItem $downloadsDir *$downloadsExtension -Name | Sort-Object -Descending -Property LastWriteTime | select -First 1
$latestDownload=$downloadsDir+"\"+$latestDownload
& $latestDownload