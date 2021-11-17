# Add a bit of color
alias ls="ls --color"
alias grep="grep --color"

# Utility aliases
alias ll="ls -laF"
alias la="ls -A"

# Docker aliases
alias dcup='docker-compose up -d'
alias dstop='docker ps -q | xargs docker stop'
alias dinit='sudo systemctl start docker && dstop && dcup'
alias dcdown='docker-compose down'
alias dcrefresh='dcdown && dcup'

# Git aliases
alias adog='git log --all --decorate --oneline --graph'
