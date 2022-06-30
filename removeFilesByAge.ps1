<#
.SYNOPSIS
This script can be used to delete files older than X days.

.DESCRIPTION
This script can be used to delete files older than X days.

.EXAMPLE
C:\PS> removeFilesByAge.ps1 C:\Users\user\Desktop\testfolder -5 Delete files older than 5 days.

$del_date defines age threshold of deletion. use negative numbers: -5, -7, etc
#>
param ( [string]$file_path, [int]$max_days )
$curr_date = Get-Date
$del_date = $curr_date.AddDays($max_days) 
Get-ChildItem $file_path -Recurse | Where-Object { $_.LastWriteTime -lt $del_date } | Remove-Item #Recursively delete the files in specified path.