node $PSScriptRoot/index.js

$downloadsDir="C:\Users\marce\Downloads"

$latestDownload=Get-ChildItem $downloadsDir *.ica -Name | Sort-Object -Descending -Property LastWriteTime | select -First 1
$latestDownload=$downloadsDir+"\"+$latestDownload
& $latestDownload