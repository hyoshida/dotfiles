# Path to your oh-my-zsh installation.
export ZSH=$HOME/dotfiles/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="hyoshida"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOME/dotfiles/oh-my-zsh-custom

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(thefuck)

source $ZSH/oh-my-zsh.sh

# User configuration

# Words, regions and marks
# refs: http://zsh.sourceforge.net/Guide/zshguide04.html
WORDCHARS="*?_-.[]~=/&;!#$%^(){}<>"
export WORDCHARS=${WORDCHARS//[.;\/]}

export PATH=$HOME/bin:$HOME/.bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Default editor
export EDITOR=vim

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Store commands prefixed with a space
unsetopt hist_ignore_space

# Don't share history real-time between instances
unsetopt share_history

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ls='ls -F'
alias la='ls -Fa'
alias ll='ls -lA'
alias ipaddr="egrep -o '[0-9]+(\.[0-9]+){3}'"
alias platex='repeat 2 platex'
alias h=history
alias sc=screen
alias tmux='tmux -u -2'
alias tm='tmux attach'
alias ts='tmux list-session'
alias be='bundle exec'
alias re='rbenv exec'
alias pe='pyenv exec'
alias csv="awk -F, -f ${HOME}/.bin/transposed_matrix.awk"
alias csvless="column -s, -t | less -#2 -N -S"
alias emacs='env XMODIFIERS=@im=none TERM=xterm-256color emacs -nw'
alias cmus='env TERM=xterm-256color cmus'
alias euc='env LANG=ja_JP.eucJP'
alias processing='env LANG=C processing'
alias m=mplayer
alias evil='emacs -f evil-mode'
alias f=fzf
alias g='git'
alias gg='git gr'

# for npm
if which npm &> /dev/null; then
  alias ne="env PATH='${PATH}:$(npm root)/.bin:$(npm -g root)/.bin'"
fi

case "$OSTYPE" in
# alias for BSD
*bsd* | *darwin* )
    alias top='top -u'
    eval "$(/opt/homebrew/bin/brew shellenv)"
    ;;
# for cygwin
*cygwin*)
    alias pbcopy='cat >/dev/clipboard'
    ;;
esac

# yabuki's alias
alias j=jobs
alias pd=pushd
alias mae=%-

######################################################################
#### Key binds.
######################################################################
autoload -U up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^P' up-line-or-beginning-search
bindkey '^N' down-line-or-beginning-search
bindkey '^[i' reverse-menu-complete
bindkey "^[/" redo

######################################################################
#### Support MacPorts commands.
######################################################################
if [[ -x /opt/local/bin/port ]]; then
    export PATH=/opt/local/bin:/opt/local/sbin:$PATH
fi

######################################################################
#### Support rbenv commands.
######################################################################
if [[ -x $HOME/.rbenv/bin/rbenv ]]; then
    export PATH=$HOME/.rbenv/bin:$PATH
    eval "$(rbenv init -)"
fi

######################################################################
#### Support pyenv commands.
######################################################################
if [[ -x $HOME/.pyenv/bin/pyenv ]]; then
    export PATH=$HOME/.pyenv/bin:$PATH
    eval "$(pyenv init -)"
fi

######################################################################
#### Override clear-screen widget.
######################################################################
clear-screen() {
  date '+ %n%n--- CLEARED: %Y-%m-%d %H:%M:%S ---%n '
  clear
  zle reset-prompt
}
zle -N clear-screen

######################################################################
#### Completion settings.
######################################################################
# 補完時の色にはLS_COLORSを利用する
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# 未入力時の^Iの挙動を変更
# refs: http://unix.stackexchange.com/questions/14230/zsh-tab-completion-on-empty-line
expand-or-complete-or-list-files() {
    if [[ $#BUFFER == 0 ]]; then
        BUFFER="ls "
        CURSOR=3
        zle list-choices
    else
        zle expand-or-complete
    fi
}
zle -N expand-or-complete-or-list-files
bindkey '^I' expand-or-complete-or-list-files

######################################################################
#### Rename Tmux window.
######################################################################
precmd() {
  local window_name=$(basename $PWD)

  [[ $window_name == '/' ]] && window_name='root'

  if [[ $TERM == 'xterm-256color' ]]; then
    printf '\ek%s\e\\' $window_name
  fi
}

######################################################################
#### Settings for fzf.
######################################################################
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

######################################################################
#### Settings for the fuck.
######################################################################
eval $(thefuck --alias)

######################################################################
#### Settings for language.
######################################################################
LC_CTYPE=en_US.UTF-8
LC_ALL=en_US.UTF-8


######################################################################
#### crontab -r is sealed!
######################################################################
crontab() {
  local opt
  for opt in "$@"; do
    if [[ $opt == -r ]]; then
      echo 'crontab -r is sealed!'
      return 1
    fi
  done
  command crontab "$@"
}

# Rust
source $HOME/.cargo/env

# Go
export GOROOT=/usr/lib/golang
export GOPATH=/usr/local/gocode
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
