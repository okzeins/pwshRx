<#Function to start restic backup. repo and sources are preset environment variables.
Can be added as parameters if so desired.
#>
function Start-ResticBackup {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [SecureString]$RESTIC_PASSWORD
    )

    process {
        restic -r $RESTIC_REPOSITORY -p $RESTIC_PASSWORD backup $RESTICSOURCES
    }
}