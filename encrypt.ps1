$math = Get-Content -Path pathtofile
$safeMath = ConvertTo-SecureString $math -AsPlainText -Force
$saferMath = ConvertFrom-SecureString -SecureString $safeMath
$saferMath | Out-File pathtosaveto

$cmd = get-content -path pathtosafermath
$decrypt = $cmd | ConvertTo-SecureString
$cmd1 = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($decrypt))
Invoke-Expression $cmd1
