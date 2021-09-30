function vagrantupdate() {
    # Print message in standard output with notification
    # More informations: 'https://wiki.archlinux.org/index.php/Desktop_notifications#Bash'
    function printWithNotify() {
        local message="${1}"
        local notify="${2:-true}"

        if "${notify}"; then 
            echo "[*] ${message}"
            notify-send 'Vagrant Update' "${message}" --icon=dialog-information
        else
            echo "[*] ${message}"
        fi

    }

    OLDIFS=$IFS
    export IFS=$'\n'

    # Find all boxes which have updates
    AVAILABLE_UPDATES=$(vagrant box outdated --global | grep outdated | tr -d "*'" | cut -d ' ' -f 2 &>/dev/null)

    if [[ ${#AVAILABLE_UPDATES[@]} -ne 0 ]]; then
        for box in ${AVAILABLE_UPDATES}; do
            printWithNotify "Found an update for ${box}"

            # Find all current versions
            boxinfo=$(vagrant box list | grep "${box}")

            for boxtype in ${boxinfo}; do
                provider=$(echo "${boxtype}" | awk -F\( '{print $2}' | awk -F\, '{print $1}')
                version=$(echo "${boxtype}" | cut -d ',' -f 2 | tr -d ' )')

                # Add latest version
                vagrant box add --clean "${box}" --provider "${provider}" &>/dev/null
                BOX_UPDATED="TRUE"

            done
        done

    printWithNotify "All boxes are now up to date! Pruning..."
    

    # Remove all old versions
    vagrant box prune -f &>/dev/null
    else
        printWithNotify "All boxes are already up to date!"
    fi

    vagrant box outdated --global &>/dev/null
    export IFS=$OLDIFS
}

# Unset function (Cannot be called in bash directly (local function).) and variables
unset -f printWithNotify