#  ::::::::::. ::: :::           ::::::::::::
#   `;;;```.;;;;;; ;;;       ,;;,;;;;;;;;''''
#    `]]nnn]]' [[[ [[[     ,['  [n    [[     	Julien BRIAULT (Pil0t)
#     $$$""    $$$ $$'     $$    $$   $$        <julien[at]rudder.io> 
#     888o     888o88oo,.__Y8,  ,8"   88,    
#     YMMMb    MMM""""YUMMM "YmmP     MMM  

# A function to return a strong 
# password (from 'genpassword()' function)
function getpassword() {
    # Colors var
    local red="\e[91m"
    local green="\e[92m"
    local yellow="\e[93m"
    local resetColor="\e[0m"

    # A function for generate a strong password
    function genpassword() {
        local passwordSize=$1
        local generatePassword
        generatePassword=$(</dev/urandom tr -dc '12345!@#$%qwertQWERTasdfgASDFGzxcvbZXCVB' | head -c "${passwordSize}" ; echo '')
        echo -e "Your password: ${green}${generatePassword}${resetColor}"
    }

    if [ -z "$1" ]; then
        echo -e "${yellow}Default size: 8, do you want to generate a password with the default size?${resetColor}"
        read -r -p "Are you sure? [Y/n]? " choice
        case "$choice" in 
            y|Y ) 
                genpassword 8;
                ;;
            n|N ) 
                echo -e "${yellow}Please use syntax: getpassword <SIZE>${resetColor}"
                ;;
            * ) 
                echo -e "${red}Invalid value.${resetColor}"
                ;;
        esac
    else
        genpassword "$1"
    fi
}

# Keep 'bash history' free from passwords
# Hash password and username in 'base64'
function askpassword() {
    read -r -e -s -p "Password: " askedPassword
    hashedPassword=$(echo "${askedPassword}" | base64) # The value is recoverable by calling this variable
    export hashedPassword
    
    echo "\
The value can be called via the variable: '\$hashedPassword'
(Use: '\$(echo \"\$hashedPassword\" | base64 -d)' to decipher)."

}

function askusername() {
    read -r -e -s -p "Username: " askedUsername
    hashedUsername=$(echo "${askedUsername}" | base64) # The value is recoverable by calling this variable
    export hashedUsername

    echo "\
The value can be called via the variable: '\$hashedUsername'
(Use: '\$(echo \"\$hashedUsername\" | base64 -d)' to decipher)."

}

# Unset function (Cannot be called in bash directly (local function).) and variables
unset -f genpassword
unset generatePassword askedPassword askedUsername red green yellow resetColor

