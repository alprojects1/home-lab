# packages
alias update='sudo apt-get update && sudo apt-get upgrade -y'
alias clean='sudo apt autoremove && sudo apt autoclean -y'

# go_to collection
alias gotow='cd /home/echo/.local/share/warp-terminal/themes'
alias goton='nano ~/.config/neofetch/config.conf'

# find_listing
alias findit='find . -name 2>/dev/null'
alias find='find . -name'

# directory_change
alias ....='cd ../../..'
alias ...='cd ../..'
alias home='cd ~'
alias ..='cd ..'

# directory_list
alias ll='ls -ali'
alias la='ls -A'
alias l='ls -CF'

# misc
alias dms='sudo ./scripts/clean_memory.sh'
alias cms='free -m -l -t'
alias df='df -h'
#
alias netstat='netstat -tuln'
alias ping='ping -c 5'
#
alias rmd='sudo rm -rf'
alias rm='rm -i'

# function_it_collection
huntit() {
    sudo find / -name "$1*" 2>/dev/null
}

killit() {
    pkill -f "$1"
}

backit() {
    src="$1"
    dest="$2"
    filename=$(basename "$src")

    if [ -z "$src" ] || [ -z "$dest" ]; then
        echo "Usage: backit /path/to/source /path/to/backup/destination"
        return 1
    fi

    tar -czvf "$dest/$filename-$(date +%Y%m%d%H%M%S).tar.gz" "$src"
}

sendit() {
    src="$1"
    dest="$2"

    if [ -z "$src" ] || [ -z "$dest" ]; then
        echo "Usage: sendit /path/to/source user@remote:/path/to/destination"
        return 1
    fi

    rsync -avh --progress "$src" "$dest"
}
