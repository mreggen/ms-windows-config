#poshgit installerer seg i profilen automatisk ved installasjon
Import-Module 'C:\tools\poshgit\dahlbyk-posh-git-a4faccd\src\posh-git.psd1'

$MaximumHistoryCount = 10000

$PSDefaultParameterValues["Out-File:Encoding"]="utf8"

Set-PSReadlineKeyHandler -Chord Tab -Function MenuComplete

function sudo {
	$file, [string]$arguments = $args;
	$psi = new-object System.Diagnostics.ProcessStartInfo $file;
	$psi.Arguments = $arguments;
	$psi.Verb = "runas";
	$psi.WorkingDirectory = get-location;
	[System.Diagnostics.Process]::Start($psi) >> $null
}