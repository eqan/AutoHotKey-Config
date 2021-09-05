; Function to run terminal as admin and in maximized form
#x::
  try {
    Run *RunAs wt, , max
  } catch {
    MsgBox, Could not obtain admin privileges.
  }
Return

; Function to Quit an application
#q::
KeyWait, q, T0.01
	If ErrorLevel
		PostMessage, 0x112, 0xF060,,, A ; Using PostMessage  to close a window
return

; Function to Call the brave browser
#b::
	Run,"C:\Users\Eqan Ahmad\AppData\Local\BraveSoftware\Brave-Browser\Application\brave.exe"
	return

; Function to Call the word
#w::
	Run,"C:\Program Files (x86)\Microsoft Office\root\Office16\WINWORD.EXE" 
	return

; Function to Call the Color Picker
#i::
	Run,"C:\Users\Eqan Ahmad\Desktop\jcpicker.exe"
	return

; Function to Call the live draw
#o::
	Run,"E:\Softwares\Live Draw\livedraw_0.1.0_beta.exe"
	return

; Function to Call the task manager
#t::
	Run,"C:\WINDOWS\system32\Taskmgr.exe"
	return

; Function returns list of windows
Unique_Alt_Tab_Windows()
{
  alt_tab_list := Array()
  class_list := ""
  WinGet, window_list, List
  Loop % window_list
  {
    this_hwnd := window_list%A_Index%

    
    WinGet, this_style, Style, ahk_id %this_hwnd%
    if (this_style & 0x10000000) && (this_style & 0x10000) ; 0x10000000 is WS_VISIBLE. 0x10000 is WS_MAXIMIZEBOX
    {
      WinGetTitle, this_title, ahk_id %this_hwnd%
      if((this_title = "") || (this_title = "Start"))
        continue
      else
      {
        WinGetClass, this_class, ahk_id %this_hwnd%
        if !InStr(class_list, this_class)
        {
          alt_tab_list.Insert(this_hwnd)
          class_list .= this_class . "|"
        }
      }
    }
  }
  return alt_tab_list
}

; Function that cycles through opened apps synchronously

#IfWinActive
#j::

alt_tab_list := Unique_Alt_Tab_Windows()
initial_window := alt_tab_list[2]
WinActivate, ahk_id %initial_window%
active_index := 2
Loop
{
  
  KeyWait, j, DT0.5
  if !ErrorLevel
  {
    active_index++
    this_window := alt_tab_list[active_index]
    WinActivate, ahk_id %this_window%
  }
  if(active_index >= alt_tab_list.MaxIndex())
  {
    alt_tab_list := Unique_Alt_Tab_Windows()
    active_index := 1
  }
} until (!GetKeyState("Alt", "P"))
return

; Function to hide and show hidden files

^+2::GoSub,CheckActiveWindow
CheckActiveWindow:
ID := WinExist("A")
WinGetClass,Class, ahk_id %ID%
WClasses := "CabinetWClass ExploreWClass"
IfInString, WClasses, %Class%
  GoSub, Toggle_HiddenFiles_Display
Return

Toggle_HiddenFiles_Display:
RootKey = HKEY_CURRENT_USER
SubKey  = Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced

RegRead, HiddenFiles_Status, % RootKey, % SubKey, Hidden

if HiddenFiles_Status = 2
    RegWrite, REG_DWORD, % RootKey, % SubKey, Hidden, 1 
else 
    RegWrite, REG_DWORD, % RootKey, % SubKey, Hidden, 2
PostMessage, 0x111, 41504,,, ahk_id %ID%
Return

; Function for a quick google search
^+c::
{
 Send, ^c
 Sleep 50
 Run, https://www.google.com/search?q=%clipboard%
 Return
}

; Functions for volume keys

!p::Send {Volume_Up}
!o::Send {Volume_Down}
!i::Send {Volume_Mute}
return

; Functions for maximizing, minimzing application
#f::WinMaximize, A
#m::WinMinimize, A

+#j::send #{left}{Lwin up}   ; snap window left
+#k::send #{right}{Lwin up}  ; snap window right

^#a::send #+{left}           ; move window to another monitor
^#d::send !{esc}             ; cycle through all windows

#\::send !{tab}{tab up}      ; toggle between this window and the last
#.::send #{tab}              ; windows 10 task switcher

!#j::send ^#{left}           ; switch to previous virtual desktop (windows 10)
!#k::send ^#{right}          ; switch to next virtual desktop
