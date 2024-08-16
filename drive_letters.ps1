Get-Volume | ForEach-Object {
	$driveLetter = $_.DriveLetter
	if ( $_.FileSystemLabel -eq "System Reserved") {
		return
	}
	if ( -not $driveLetter ) {
		return
	}
	if ($_.ObjectID -match '(Volume\{.*\})') {
		$id = $Matches.1
		$wmiInstance = Get-WmiObject -Class Win32_Volume | Where-Object { $_.DeviceId -like *$id*" } |
			Set-WmiInstance -Arguments @{DriveLetter="${driveLetter}:" }
	}
}
