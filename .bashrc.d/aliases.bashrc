#  ::::::::::. ::: :::           ::::::::::::
#   `;;;```.;;;;;; ;;;       ,;;,;;;;;;;;''''
#    `]]nnn]]' [[[ [[[     ,['  [n    [[     	Julien BRIAULT (Pil0t)
#     $$$""    $$$ $$'     $$    $$   $$        <julien[at]rudder.io> 
#     888o     888o88oo,.__Y8,  ,8"   88,    
#     YMMMb    MMM""""YUMMM "YmmP     MMM  

# For debug, you can use:
# - 'echo ${BASH_ALIASES[ls]}'
# - 'type -a ls'

# Store all extra binaries
binaries=(
    wget
    tar
    exa
    htop
    code
    git
    sudo
    egrep
    fgrep
    grep
    vim
    shellcheck
    cargo
    xclip
    df
    ip
    free
    git
    virsh
    vagrant
    tmux
    wine
    # pip
)

# Check if extra binary exist
for binary in "${binaries[@]}"; do
	binaryPath=$(which "$binary")
    if ! [ -e "${binaryPath}" ]; then
        echo "${binary} does not seem to be installed!"
    else
        case "$binary" in
            exa)
                # 'ls' aliases
                alias ls='exa'
                alias l='exa --group -lh'
                alias ll='exa --group -lha'
                alias la='exa -a'

                # 'tree' aliases
                alias tree="exa --tree"
                ;;
            htop)
                alias top='htop'
                ;;
            code)
                # 'code' aliases
                alias bashconfig='code $HOME/.bashrc.d/'
                alias sshconfig='code $HOME/.ssh/config.d/'
                alias ohmybash='code $HOME/.oh-my-bash'
                alias vimconfig='code $HOME/.vimrc'
                ;;
            sudo)
                # 'sudo' aliases
                # Privileged access, call sudo if 
                # UID is not equal to 0
                if [ $UID -ne 0 ]; then
                    alias reboot='sudo reboot'
                    alias poweroff='sudo poweroff'
                    alias halt='sudo halt'
                    alias shutdown='sudo shutdown'

                    alias pacman='yes O | sudo pacman'
                    alias iptables='sudo iptables'
                    
                    alias systemctl='sudo systemctl'
                    alias journalctl='sudo journalctl'
                fi
                ;;
            vim)
                alias vi='vim'
                alias edit='vim'
                ;;
            tar)
                alias untar='tar -zxvf'
                ;;
            wget)
                alias wget='wget -c'
                ;;
	        shellcheck)
	    	    # 'shellcheck' aliases
	    	    alias checkbashrc='shellcheck --exclude=SC2148,SC1009,SC1073 $HOME/.bashrc.d/*.bashrc'
	    	    ;;
            cargo)
                # rust 'cargo' command aliases
                alias cb='cargo build -j $(nproc)'
                alias cr='cargo run -q -j $(nproc)'
                ;;
            xclip)
                # 'xclip' aliases
                alias xclip='xclip -selection c'
                ;;
            grep)
                # 'grep' aliases
                alias grep='grep --color=auto'
                ;;
            df)
                # 'df' aliases
                alias df='df -h' # Human-readable sizes
                ;;
            free)
                # 'free' aliases
                alias free='free -m' # Print with MB
                ;;
            ip)
                # 'ip' aliases
                alias ipa='ip -c a'
                ;;
            git)
                # 'git' aliases
                alias gclone='git clone'
                alias gcheckout='git checkout'
                alias gconfig='git config'
                ;;
            virsh)
                # 'virsh' aliases
                alias virsh='virsh --connect=qemu+ssh://jbriault@dedibox-10.normation.com:5190/system?keyfile=/home/pil0t/.ssh/keys.d/pro/pil0t_pro_rsa_key'
                ;;
            vagrant)
                # 'vagrant' aliases
                alias vg='vagrant'
                ;;
            tmux)
                # 'tmux' aliases
                alias tmux="TERM=screen-256color-bce tmux"
                ;;
            # wine)
            #     # 'wine' aliases
            #     alias wine="WINEARCH=win64 WINEPREFIX=~/.wine/ wine"
            #     ;;
            # pip)
            #     # 'pip' aliases
            #     alias pipupdate='/usr/bin/python -m pip install --upgrade pip'
            #     ;;
        esac
    fi
done

# 'cd' aliases
# A quick way to get out of current directory
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

# 'mkdir' aliases
alias mkdir='mkdir -pv'

# 'mount' aliases
# Make 'mount' command output pretty and human readable
alias mount='mount | column -t'

# 'ping' aliases
alias ping='ping -c 5 -s 2'

# 'ip' aliases
alias ip='ip -c'
alias ipa='ip -c a'
alias ipb='ip -br -c addr show'

# 'history' aliases
alias disable-history='set +o history'
alias enable-history='set -o history'

# Other commonly used aliases
alias reload='. ~/.bashrc'

# Add safety nets
alias rm='rm -I --preserve-root'
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# Short cuts to save time
alias h='history'
alias j='jobs -l'

# 'cat' aliases
alias cat='bat --theme="Monokai Extended Origin" --style="plain,changes,header" --italic-text=always --paging=never'