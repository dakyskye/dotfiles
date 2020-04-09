#!/usr/bin/pwsh

if (!$Args) {
	"no file passed"
	exit 1
}

foreach ($file in $Args) {
	Get-Content /dev/null > $file
}
