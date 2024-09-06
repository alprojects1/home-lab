# function_collection

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

# docker_collection
alias swarmkill='docker kill $(docker ps -q)'
alias dneti='docker network inspect'
alias dclf='docker compose logs -f'
alias dcu='docker compose up -d'
alias dcb='docker compose build'
alias dcd='docker compose down'
alias dcl='docker compose logs'
alias dce='docker compose exec'
alias dnet='docker network ls'
alias dps='docker compose ps'

# list_collection
alias ll='ls -l'
alias la='ls -A'
alias di='watch -n2 /scripts/docker_info.sh'

# packages
alias clean='sudo apt autoremove && sudo apt autoclean -y'
alias update='sudo apt-get update && sudo apt-get upgrade -y'

# in_find_listing
alias findit='find . -name 2>/dev/null'
alias find='find . -name'

# directory_change
alias home='cd ~'
alias ..='cd ..'
alias ...='cd ../..'
alias compose='cd ../../../compose'
alias ....='cd ../../../../../../../../../../../../../..'

# directory_list
alias ll='ls -ali'
alias la='ls -A'
alias l='ls -CF'

# misc
alias rm='rm -i'
alias rmd='sudo rm -rf'
alias cls='clear        '
#
alias df='df -h'
alias cms='free -m -l -t'
alias dms='sudo ./scripts/clean_memory.sh'
#
alias ping='ping -c 5'
alias netstat='netstat -tuln'
