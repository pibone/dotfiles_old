#!/bin/sh
# Remap caps to control and escape on tap
killall xcape > /dev/null 2> /dev/null
xmodmap -e "clear lock"
xmodmap -e "clear control"
xmodmap -e "keycode 66 = Control_L"
xmodmap -e  "add control = Control_L Control_R"
xcape -t 200 -e "Control_L=Escape"

# Remap space to shift and space on tap
xmodmap -e "clear shift"
xmodmap -e "keycode 65 = Shift_L"
xmodmap -e "keycode any = space"
xmodmap -e "add shift = Shift_L Shift_R"
xcape -t 200 -e 'Shift_L=space'
xset r rate 200 60
