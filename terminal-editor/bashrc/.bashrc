# alias_collection 

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

# ansible_collection

alias testsyntaxa='ansible-playbook --syntax-check'
alias clearssh='rm -rf home/echo/.ssh/known_hosts'
alias restarta='sudo systemctl restart ansible'
alias venv='source /ansible/venv/bin/activate'
alias checkinva='ansible-inventory --list -y'
alias listhostsa='ansible all --list-hosts'
alias playbookv='ansible-playbook -v'
alias versiona='ansible --version'
alias pinga='ansible all -m ping'
alias playa='ansible-playbook'
alias cmdalla='ansible all -a'
alias sshlist='ssh-add -l'

# docker_collection
alias dcu='docker compose up -d'
alias dcb='docker compose build'
alias dcd='docker compose down'
alias dcl='docker compose logs'
alias dps='docker compose ps'
alias dce='docker compose exec'
alias dnet='docker network ls'
alias dclf='docker compose logs -f'
alias dneti='docker network inspect'
alias swarmkill='docker kill $(docker ps -q)'

# git_collection
alias gitge='git config --global user.email alprojects1@proton.me'
alias gitgu='git config --global user.name LR03'
alias gplm='git pull origin main'
alias gpld='git pull origin dev'
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

# docker compose function

function compose_ip() {
  container=$1
  docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $container
}


function compose_shell() {
  container=$1
  shell_command=${2:-/bin/sh}  # Default to /bin/sh if no second argument is provided
  docker exec -it $(docker ps -qf "name=$container") $shell_command
}

function compose_inspect() {
  container=$1
  docker inspect $(docker ps -qf "name=$container")
}
