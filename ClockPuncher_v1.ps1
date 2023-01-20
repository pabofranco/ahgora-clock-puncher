# Curl
$curl = "C:\Windows\System32\curl.exe"
$configs = @{}

# Gets data from config.cfg and add it to configs hash
Write-Host "Validating config file...`n"
Get-Content  -Path "./config.cfg" |
	foreach-object `
        -begin {
			Write-Host "File found! Getting settings...`n"
        } `
        -process {
            # Retrieve line with '=' and split them
            $k = [regex]::split($_,'=')
            if(($k[0].CompareTo("") -ne 0) -and ($k[0].StartsWith("[") -ne $True))
            {
                # Add the Key, Value into the Hashtable
                $configs.Add($k[0], $k[1])
            }
        } `
        -end {
			Write-Host "Configuration obtained successfully!"
		}

Write-Host "Sending request to punch the clock...`n`n"

# Prepare the request
$Uri = 'https://www.ahgora.com.br/batidaonline/verifyIdentification'
$Headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$Headers.Add("Cookie", "company=a530748")
$Headers.Add("PHPSESSID", "6ng968k1ulddkivqeflvr44aq2")
$RequestData = @{
    "account"  = [int]$configs["account"]
    "password" = $configs["password"]
    "identity" = $configs["identity"]
    "origin"   = $configs["origin"]
    "key"      = $configs["key"]
} | ConvertTo-Json

# Send the request and print the result
$result = Invoke-RestMethod $Uri -Method Post -Headers $Headers -Body $RequestData -ContentType "application/json"
Write-Host $result
Write-Host "`nClock Punched!`n"