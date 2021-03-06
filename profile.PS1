####### history #########
$historyFilePath = "~/Dropbox/.posh_history.csv"

Import-Csv $historyFilePath | Add-History

function prompt {
	$latestHistory = Get-History -Count 1
	if($script:lastHistory -ne $latestHistory) {
		$csv = ConvertTo-Csv $latestHistory

		if( -not(Test-Path $historyFilePath)) {
			Out-File $historyFilePath -InputObject $csv[0] -Encoding UTF8
			Out-File $historyFilePath -InputObject $csv[1] -Encoding UTF8 -Append
		}
		Out-File $historyFilePath -InputObject $csv[-1] -Encoding UTF8 -Append

		$script:lastHistory = $latestHistory
	}

	return "[$(date -Format hh/mm/ss)] $pwd`n > "
}

########### alias ################
Set-Alias grep Select-String

