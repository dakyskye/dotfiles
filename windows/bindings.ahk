#Enter::Run wt.exe

Launch_Mail::Run C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe gmail.com

Launch_Media::Run C:\Users\kante\AppData\Roaming\Spotify\Spotify.exe

#+q::
WinGetTitle, Title, A
PostMessage, 0x112, 0xF060,,, %Title%
return