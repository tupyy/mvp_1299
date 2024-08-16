Get-Disk | Where-Object { $_.OperationalStatus -like 'Offline' } | Set-Disk -IsOffline $False 
Get-Disk | Where-Object { $_.IsReadOnly -eq $True } | Set-Disk -IsReadOnly $False
