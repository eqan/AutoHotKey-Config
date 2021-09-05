#ifWinActive ahk_class QWidget ; vlc


k::send {space}         ; play/pause

~LButton::              ; click video to play/pause
keyWait, LButton
keyWait, LButton, D T.2
if (errorLevel)
    {
    mouseGetPos, , , , class_under_mouse
    if class_under_mouse contains video output, video main
        send {space}
    }
return

SC034::send {e}         ; frame by frame  (SC034 = period key)

up::send ^{up}          ; volume up 5%
down::send ^{down}      ; volume down 5%

+,::send {[}            ; decrease speed
+SC034::send {]}        ; increase speed

j::send !{left}         ; jump 10 seconds back 
l::send !{right}        ; jump 10 seconds forwards 



; other non-youtube commands

+j::send +{left}        ; jump 3 seconds back
+l::send +{right}       ; jump 3 seconds back

^+j::send ^{left}       ; jump 1 minute back 
^+l::send ^{right}      ; jump 1 minute forwards 


left::send {p}          ; play previous video
right::send {n}         ; play next video

^f::                    ; resize window to 870x640
winMove, ahk_class QWidget, , , , 870, 640
return


#ifWinActive