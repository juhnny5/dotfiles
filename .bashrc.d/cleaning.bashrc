#  ::::::::::. ::: :::           ::::::::::::
#   `;;;```.;;;;;; ;;;       ,;;,;;;;;;;;''''
#    `]]nnn]]' [[[ [[[     ,['  [n    [[     	Julien BRIAULT (Pil0t)
#     $$$""    $$$ $$'     $$    $$   $$        <julien[at]rudder.io> 
#     888o     888o88oo,.__Y8,  ,8"   88,    
#     YMMMb    MMM""""YUMMM "YmmP     MMM  

# A function to clean all old packages 
# from 'pacman' and 'yay'
function cleanmyarch() {
    function print() {
        # Define all arguments
        local level
        local message

        local red="\e[91m"
        local green="\e[92m"
        local yellow="\e[93m"
        local resetColor="\e[0m"
        
        level="$1"
        message="$2"

        case $level in
            error)
                echo -e "${red}[!]: ${message}${resetColor}" >&2
                ;;
            warning)
                echo -e "${yellow}[*]: ${message}${resetColor}" >&2
                ;; 
            info | success)
                echo -e "${green}[+]: ${message}${resetColor}" >&2
                ;;
            *)
                echo -e "${red}Type unknown${resetColor}"
                ;;
        esac
    }

    local totalCacheSize
    totalCacheSize="$(du -sh /var/cache/pacman/pkg/ | awk '{ print $1 }')"
    print "info" "Cleaning 'pacman' and 'yay' cache"
    print "warning" "Total cache size: ${totalCacheSize}"
    
    if ! yes O | sudo pacman -Scc &>/dev/null; then
        print "error" "Error during clean 'pacman' and 'yay' cache."
    fi

    print "info" "Delete unused packages (orphans)"
    if ! pacman -Qtdq &>/dev/null; then # Get list of all orphans packages
        if ! yes O | sudo pacman -Rns "$(pacman -Qtdq)" &>/dev/null; then
            print "error" "Error during deleting all unused packages."
        fi
    fi

    print "info" "Cleaning personnal cache"
    if ! rm -rf ~/.cache/* &>/dev/null; then
        print "error" "Error during deleting personnal cache."
    fi

    # More informations here: 
    # -> https://wiki.archlinux.org/index.php/Systemd/Journal#Journal_size_limit
    print "info" "Delete all journal files older than 5 days"
    if ! journalctl --vacuum-time=5days &>/dev/null; then
        print "error" "Error during deleting all journal files older than 5 days"
    fi
}

# Unset function (Cannot be called in bash directly (local function).) and variables
unset -f print
unset level message red green yellow resetColor totalCacheSize
