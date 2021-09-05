$a::                                          
    KeyWait, a, T0.5                          
     If ErrorLevel {                                
     	Send, {U+2191}{U+2193}{U+2192}{U+2190}    ; ↑↓→← arrows
        KeyWait, a
    } Else                                         
        Send a 
Return

$b::                                          
    KeyWait, b, T0.5                          
     If ErrorLevel {                                    	; timeout, so long press
     	Send, {U+2022}    ; • bullet point
        KeyWait, b
    } Else                                                	; otherwise...
        Send b 
Return

$e::                                          
    KeyWait, e, T0.5                          
     If ErrorLevel {                                  
     	Send, eqan.ahmad123@gmail.com
        KeyWait, e
    } Else                                           
        Send e 
Return

$h::                                          
    KeyWait, h, T0.5                          
     If ErrorLevel {                                
     	Send, {U+2764}    ; ❤ heart
        KeyWait, h
    } Else                                         
        Send h 
Return

$q::                                          
    KeyWait, q, T0.5                          
     If ErrorLevel {                                
     	Send, {U+201C}word{U+201D}{left}+{left 4}    ; “curly quotation marks”
        KeyWait, q
    } Else                                         
        Send q 
Return

$t::                                          
    KeyWait, t, T0.5                          
     If ErrorLevel {                                
     	Send, {U+2122}    ; ™ trademark
        KeyWait, t
    } Else                                         
        Send t 
Return

$x::                                          
    KeyWait, x, T0.5                          
     If ErrorLevel {                                
     	Send, {U+2716}    ; ✖ x mark
        KeyWait, x
    } Else                                         
        Send x 
Return

$y::                                          
    KeyWait, y, T0.5                          
     If ErrorLevel {                                
     	Send, {U+2714}    ; ✔ check mark
        KeyWait, y
    } Else                                         
        Send y 
Return

$Space::                                          
    KeyWait, Space, T0.5                          
     If ErrorLevel {                                
     	Send, &nbsp;      ;   html/markdown space
        KeyWait, Space
    } Else                                         
        Send {Space}
Return
