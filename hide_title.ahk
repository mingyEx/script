;-Caption
LWIN & LButton::
WinSet, Style, -0xC00000, A
return
;

;+Caption
LWIN & RButton::
WinSet, Style, +0xC00000, A
return
;
;左win键+鼠标左键 隐藏，~+右键，显示，只对老式窗口有效，对sublime Text4无效
; from https://superuser.com/a/215707/1201789