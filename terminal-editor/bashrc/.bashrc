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

# git_collection
alias gpm='git push origin main'
alias gpd='git push origin dev'
alias gcm='git commit -m'
alias gco='git checkout'
alias gst='git status'
alias gaa='git add .'
alias gcl='git clone'
alias gps='git push'
alias gpl='git pull'

# misc
alias rmd='sudo rm -rf'
alias rm='rm -i'
#
alias dms='sudo ./scripts/clean_memory.sh'
alias cms='free -m -l -t'
alias df='df -h'
#
alias netstat='netstat -tuln'
alias ping='ping -c 5'
