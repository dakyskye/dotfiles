#!/usr/bin/pwsh

$Choice = (printf "1) power off\n2) reboot\n3) lock\n4) log out" | rofi -dmenu -p "make the choice") | Out-String

Switch -Regex ($Choice) {
	"1\)*" { Stop-Computer }
	"2\)*" { Restart-Computer }
	"3\)*" { Start-Sleep -Seconds 0.3; blurlock }
	"4\)*" { Get-Process * -IncludeUserName | Where UserName -match $env:USER | Stop-Process -Force }
}
