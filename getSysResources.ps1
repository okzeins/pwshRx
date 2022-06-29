# Date/Time, Host Name, % Load on a processor, % Memory Free, % C Drive Free
# Define output path within $exportPath variable as needed. It defaults to current user documents.

$exportPath = "$env:USERPROFILE\documents\ComputerReport.csv"
$ComputerName = (Get-WmiObject -Class Win32_ComputerSystem -Property Name).Name 

$AVGProc = Get-WmiObject -computername $computername win32_processor | Measure-Object -property LoadPercentage -Average | Select-Object Average 

$OSuuu = Get-WmiObject -Class win32_operatingsystem -computername $computername | 
Select-Object @{Name = "MemoryUsage"; Expression = { “{0:N2}” -f ((($_.TotalVisibleMemorySize - $_.FreePhysicalMemory) * 100) / $_.TotalVisibleMemorySize) } } 

$vol = Get-WmiObject -Class win32_Volume -ComputerName $computername -Filter "DriveLetter = 'C:'" | 
Select-object @{Name = "C_PercentFree"; Expression = { “{0:N2}” -f (($_.FreeSpace / $_.Capacity) * 100) } } 

$CurrentDate = (Get-Date).ToString()

$OutputObj = New-Object -Type PSObject
$OutputObj | Add-Member -MemberType NoteProperty -Name Date_Time -Value $CurrentDate
$OutputObj | Add-Member -MemberType NoteProperty -Name Computer_Name -Value $ComputerName
$OutputObj | Add-Member -MemberType NoteProperty -Name Average_Processer -Value $AVGProc.Average
$OutputObj | Add-Member -MemberType NoteProperty -Name Memory_Usage -Value $OSuuu.MemoryUsage
$OutputObj | Add-Member -MemberType NoteProperty -Name C_Drive_Free -Value $vol.C_PercentFree
$OutputObj | Export-Csv -Append -Path $exportPath -NoTypeInformation