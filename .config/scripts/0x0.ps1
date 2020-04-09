#!/usr/bin/pwsh

if (!$Args) {
	"no file passed"
	exit 1
}

foreach ($file in $Args) {
	curl -F "file=@$file" "https://0x0.st"
}
