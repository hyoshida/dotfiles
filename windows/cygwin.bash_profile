# hyoshida
export PATH=${PATH}:${HOME}/dotfiles/.bin

alias ls="ls -Fa"
alias ll="ls -l"
alias g="git"
alias tm="tmux -2 attach"
alias pbcopy='cat >/dev/clipboard'

# Based on su10's settings
source ${HOME}/dotfiles/windows/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_STATESEPARATOR=""
export PS1='\u@\h[$(__git_ps1 \[\033[01m\]%s\[\033[00m\]:)\w]% '

# for Git
git config --global core.filemode false
