#If !WinActive("ahk_class cygwin") and !WinActive("ahk_class mintty")
^h::Send {Backspace}
^m::Send {Enter}
^[::Send {Escape}
#Space::#s
#If
