$date = Get-Date -Format yy-MM-dd

# Supply url and destination variables
$url = "http://speed.transip.nl"
$destination = New-Item -Path "$env:USERPROFILE\Downloads" -ItemType Directory -Name "MultiBITS $date"
$content = Invoke-WebRequest -URI $url

$randomBinFiles = $content.links | Where-Object { $_.innerHTML -like 'random*' } | Select-Object href
# Create links for each file entry
$randomBinFiles.foreach( { $_.href = $url + "/" + $_.href })
# Download the files in the background
$randomBinFiles.foreach({
        Start-BitsTransfer ($url + "/" + $_.href) -Asynchronous -Destination $destination
    })
# Close the transfers and convert from TMP to real file names
Get-BitsTransfer | Complete-BitsTransfer