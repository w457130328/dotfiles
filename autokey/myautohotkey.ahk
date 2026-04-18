; CapsLock 组合键功能增强脚本
; 作者：根据用户需求编写
; 日期：2026-01-01

#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

; 禁用CapsLock的默认功能，防止误触发大写锁定
SetCapsLockState, AlwaysOff

; 方向键映射：CapsLock + E/S/D/F 对应 上/下/左/右
CapsLock & e::Send {Up}
CapsLock & s::Send {Left}
CapsLock & d::Send {Down}
CapsLock & f::Send {Right}

; F1-F12 功能键映射：CapsLock + 数字键/符号键
CapsLock & Esc::Send, ``
CapsLock & 1::Send {F1}
CapsLock & 2::Send {F2}
CapsLock & 3::Send {F3}
CapsLock & 4::Send {F4}
CapsLock & 5::Send {F5}
CapsLock & 6::Send {F6}
CapsLock & 7::Send {F7}
CapsLock & 8::Send {F8}
CapsLock & 9::Send {F9}
CapsLock & 0::Send {F10}
CapsLock & -::Send {F11}    ; 减号键对应F11
CapsLock & =::Send {F12}    ; 等号键对应F12
