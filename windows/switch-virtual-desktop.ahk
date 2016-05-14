;
; Based on https://github.com/jpginc/windows10DesktopManager
;

#1::
#2::
#3::
#4::
#5::
#6::
#7::
#8::
#9::
{
  Send #{Tab}
  Sleep 150
  StringTrimLeft count, A_ThisHotkey, 1
  moveToDesktop(count)
  return
}

moveToDesktop(desktopNumber) {
  ; after the left 10 it will be on window 1 so decrement the count by 1 to compensate
  desktopNumber--
  Send {Tab}{Left 10}{Right %desktopNumber%}{Enter}
  Return
}
