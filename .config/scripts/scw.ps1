#!/usr/bin/pwsh

$Choice = (printf "1) night mode\n2) day mode" | rofi -dmenu -p "make the choice") | Out-String

Switch -Regex ($Choice) {
	"1\)*" { redshift -P -O 4500 }
	"2\)*" { redshift -P -O 6500 }

}
