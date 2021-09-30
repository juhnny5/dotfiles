#  ::::::::::. ::: :::           ::::::::::::
#   `;;;```.;;;;;; ;;;       ,;;,;;;;;;;;''''
#    `]]nnn]]' [[[ [[[     ,['  [n    [[     	Julien BRIAULT (Pil0t)
#     $$$""    $$$ $$'     $$    $$   $$        <julien[at]rudder.io> 
#     888o     888o88oo,.__Y8,  ,8"   88,    
#     YMMMb    MMM""""YUMMM "YmmP     MMM  

# Load neofetch
# Do not load 'neofetch' if 'tmux' is running (to avoid latency).
# Store path to binary
neofetchPath="/usr/bin/neofetch"
tmuxPath="/usr/bin/tmux"
ttyPath="/usr/bin/tty"

if ! [ -e ${neofetchPath} ]; then
	echo "Neofetch does not seem to be installed!"
else
	# Load 'neofetch' only for /dev/pts/0
	if [ "$(${ttyPath})" = "/dev/pts/0" ]; then
		if ! [ -x ${neofetchPath} ]; then
			echo "Enforcement rights seem to be lacking for $neofetchPath"
		else
			# Check if 'tmux' is running
			if ! $tmuxPath ls 2>/dev/null ; then
				$neofetchPath --bold on --separator " >" --ascii_distro Rudder
			fi
		fi
	fi
fi
