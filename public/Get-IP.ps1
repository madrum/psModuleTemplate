<#
.SYNOPSIS
    Get public IP address.
.DESCRIPTION
    Get public IP address of current Internet-connected computer using website: https://ipinfo.io/json.
.EXAMPLE
    PS> Get-IP
    55.55.55.55

    Returns public IP of current Internet-connected computer.
.NOTES
#>
function Get-IP {
    [CmdletBinding()]
    [OutputType([System.String])]
    param(
        # Max attempts to retry API call
        [int] $MaxRetries = 3
    )

    $tryCount = 0
    while ($tryCount -lt $MaxRetries) {
        $tryCount++

        $publicIP = Invoke-RestMethod 'https://ipinfo.io/json' -StatusCodeVariable 'statusCode' | Select-Object -ExpandProperty IP

        if ($statusCode -eq 200) {
            Write-Verbose "API call was successful."
            return $publicIP
        } else {
            Write-Warning "API call status code was `"$statusCode`" instead of `"200`". Retrying in 2 seconds."
            if ($tryCount -lt $MaxRetries) {
                Start-Sleep 2
            }
        }
    }

    Write-Error "API call was not successful after $MaxRetries attempts."
    return ''
}
