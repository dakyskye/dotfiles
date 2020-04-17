#!/usr/bin/pwsh

$SS_Path = "$env:HOME/Images/screenshots"
$SS_Format = "$SS_Path/screenshot_$(date '+%d.%m.%Y_%H.%M.%S').png"
$NOTIFY_Copy = "the screenshot has been taken and copied to your clipboard"
$NOTIFY_Save = "the screenshot has been taken and saved locally at $SS_Path"
$NOTIFY_Upload = "the link of captured screenshot has been copied to your clipboard"
$NOTIFY_App_Name

$FC = "fc"
$WC = "wc"
$FS = "fs"
$WS = "ws"
$FU = "fu"
$WU = "wu"

function Screenshot ($type) {
	if (!$type) {
		return
	}

	Switch ($type) {
		$FC { maim | xclip -selection clipboard -t image/png && notify-send -a "$NOTIFY_App_Name" "$NOTIFY_Copy" }
		$WC { maim -sou | xclip -selection clipboard -t image/png && notify-send -a "$NOTIFY_App_Name" "$NOTIFY_Copy" }
		$FS { maim "$SS_Format" && notify-send -a "$NOTIFY_App_Name" "$NOTIFY_Save" }
		$WS { maim -sou "$SS_Format" && notify-send -a "$NOTIFY_App_Name" "$NOTIFY_Save" }
		$FU { maim | curl -s -F 'file=@-' 'https://0x0.st' | xclip -selection clipboard && notify-send -a "$NOTIFY_App_Name" "$NOTIFY_Upload" }
		$WU { maim -so | curl -s -F 'file=@-' 'https://0x0.st' | xclip -selection clipboard && notify-send -a "$NOTIFY_App_Name" "$NOTIFY_Upload" }
	}
}

if ($Args[0]) {
	Screenshot $Args[0]
} else {
	$Choice = (printf "1) fullscreen and copy\n2) select a window and copy\n3) fullscreen and save\n4) select a window and save\n5) fullscreen and upload to 0x0\n6) select a window and upload to 0x0" | rofi -dmenu -p "make the choice") | Out-String

	Start-Sleep -Seconds 0.3

	Switch -Regex ($Choice) {
		"1\)*" { screenshot $FC }
		"2\)*" { screenshot $WC }
		"3\)*" { screenshot $FS }
		"4\)*" { screenshot $WS }
		"5\)*" { screenshot $FU }
		"6\)*" { screenshot $WU }
	}
}
