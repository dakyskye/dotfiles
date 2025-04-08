tell application "Finder"
    set screenBounds to bounds of window of desktop
end tell

tell application "iTerm"
    activate
    if (count of windows) is 0 then
        create window with default profile
        delay 0.1 -- Small delay to allow window to initialize
    end if
    set firstWindow to the first window
    set winBounds to bounds of firstWindow
    set winWidth to item 3 of winBounds - item 1 of winBounds
    set winHeight to item 4 of winBounds - item 2 of winBounds
    set screenWidth to item 3 of screenBounds
    set screenHeight to item 4 of screenBounds
    set newLeft to (screenWidth - winWidth) / 2
    set newTop to (screenHeight - winHeight) / 2
    set bounds of firstWindow to {newLeft, newTop, newLeft + winWidth, newTop + winHeight}
end tell
