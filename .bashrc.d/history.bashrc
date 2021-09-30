#  ::::::::::. ::: :::           ::::::::::::
#   `;;;```.;;;;;; ;;;       ,;;,;;;;;;;;''''
#    `]]nnn]]' [[[ [[[     ,['  [n    [[     	Julien BRIAULT (Pil0t)
#     $$$""    $$$ $$'     $$    $$   $$        <julien[at]rudder.io> 
#     888o     888o88oo,.__Y8,  ,8"   88,    
#     YMMMb    MMM""""YUMMM "YmmP     MMM  

yellow="\e[93m"
resetColor="\e[0m"

# Time stamps format for bash 'history' command
HISTTIMEFORMAT=$(echo -e "${yellow}"[%d/%m/%y %T] "${resetColor}")
export HISTTIMEFORMAT

# Not being able to call variables from the shell
unset yellow resetColor

# By default, the value are 500
export HISTFILESIZE=10000
export HISTSIZE=10000

# Ignore specific commands 
# export HISTIRGNORE="ls:cd"

# Ignore commands preceded by a whitespace
export HISTCONTROL=ignorespace:erasedups:ignoreboth