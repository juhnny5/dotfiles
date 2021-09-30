#  ::::::::::. ::: :::           ::::::::::::
#   `;;;```.;;;;;; ;;;       ,;;,;;;;;;;;''''
#    `]]nnn]]' [[[ [[[     ,['  [n    [[     	Julien BRIAULT (Pil0t)
#     $$$""    $$$ $$'     $$    $$   $$        <julien[at]rudder.io> 
#     888o     888o88oo,.__Y8,  ,8"   88,    
#     YMMMb    MMM""""YUMMM "YmmP     MMM  

keys=(
    "${HOME}/.ssh/keys.d/pro/pil0t_pro_rsa_key" # RSA for compatibility!
    "${HOME}/.ssh/keys.d/perso/pil0t_perso_ed25519_key" # ED25519 for security!
)

sshAgentPath="/usr/bin/ssh-agent"

# Add permissions in ~/.ssh/ folder 
chown -R ${USER}:${USER} ${HOME}/.ssh/

# Add all SSH private keys to the 'ssh-agent'
for key in "${keys[@]}"; do 
    ${sshAgentPath} ${key} &>/dev/null
done

# Disable some vars
unset keys sshAgentPath