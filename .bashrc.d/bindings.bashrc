#  ::::::::::. ::: :::           ::::::::::::
#   `;;;```.;;;;;; ;;;       ,;;,;;;;;;;;''''
#    `]]nnn]]' [[[ [[[     ,['  [n    [[     	Julien BRIAULT (Pil0t)
#     $$$""    $$$ $$'     $$    $$   $$        <julien[at]rudder.io> 
#     888o     888o88oo,.__Y8,  ,8"   88,    
#     YMMMb    MMM""""YUMMM "YmmP     MMM  

# 'ctrl + z' bind to 'fg' command (invisible mode)
stty susp undef
bind -x '"\C-z":"fg >/dev/null 2>&1"'

# 'ctrl + f' bind to 'fuck' command (without confirmation thanks to '--yeah' option)
bind -x '"\C-xf":"fuck --yeah"'

# 'ctrl + x + o' bind to 'ranger' command
bind -x '"\C-xo":"ranger"'

# Ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"

# 'ctrl + x + r' to 'reload' alias (see: 'aliases.bashrc')
bind -x '"\C-xr":"reload"'

# 'ctrl + x + s' to 'sudo !!' command
bind -x '"\C-xs":"sudo $(history -p \!\!)"'

# 'ctrl + x + c' to 'code .'
bind -x '"\C-xc":"code ."'