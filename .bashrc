alias gs='git status'
alias gfe='git fetch'
alias grb='git rebase '
alias gp='git pull '
alias go='git push'
alias gck='git checkout '
alias gckb='git checkout -b'
alias grb='git rebase '
alias gcom='git commit -m '
alias gall='git add .'
alias gowl='git push --force-with-lease'
alias gcoms='git commit -S -m '
alias gbl='git branch'
alias gbr='git branch -r'
alias gbsd='git branch -d'
alias gbfd='git branch -D'
alias gpou='git push origin -u '
alias mvnr='./mvnw spring-boot:run'
alias mvnrl='mvn spring-boot:run'
alias ytub='youtube-dl --extract-audio --audio-format mp3'

# Github SSH Config

env=~/.ssh/agent.env

agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }

agent_start () {
    (umask 077; ssh-agent >| "$env")
    . "$env" >| /dev/null ; }

agent_load_env

# agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2= agent not running
agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)

if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
    agent_start
    ssh-add
elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
    ssh-add
fi

unset env
