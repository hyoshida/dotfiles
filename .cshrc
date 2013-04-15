#!/bin/csh

######################################################################
#### Setting the prompt.
######################################################################
if ($?prompt) then
    # Meta charactors:
    #     %n <= User name.
    #     %m <= Machine name.
    #     %c <= Current directory.
    #     %~ <= A relative path from ${HOME}.
    #     %# <= Super user is #, Normal user is >.
    if ("_$user" == "_root") then
        set prompt = "%n@%m[%~]# "
    else
        set prompt = "%n@%m[%~]% "
    endif

    # Display git-branch on prompt.
    if (-r ${HOME}/dotfiles/prompt.tcsh) then
        source ${HOME}/dotfiles/prompt.tcsh
        alias cd "cd \!* && source ${HOME}/dotfiles/prompt.tcsh"
        alias git "git \!* && source ${HOME}/dotfiles/prompt.tcsh"
    endif

    # Completions
    if (-r ${HOME}/dotfiles/complete.tcsh) then
        source ${HOME}/dotfiles/complete.tcsh
    endif
endif


######################################################################
#### Enable to the completion of the file name.
######################################################################
set autocorrect
set autolist


######################################################################
#### Disable autologout.
######################################################################
unset autologout


######################################################################
#### Mute the beep sound.
######################################################################
set nobeep


######################################################################
#### Add the current path to $PATH.
######################################################################
set path = ( $home/bin $home/.bin $path . )


######################################################################
#### Support rbenv commands.
######################################################################
if ( -x $home/.rbenv/bin/rbenv ) then
    alias rbenv 'env MAKE=gmake rbenv'
    set path = ( $home/.rbenv/bin $home/.rbenv/shims $path )
    rbenv rehash
endif


######################################################################
#### Support MacPorts commands.
######################################################################
if ( -x /opt/local/bin/port ) then
    set path = ( /bin /opt/local/bin /opt/local/sbin $path )
endif


######################################################################
#### Support color for kterm.
######################################################################
if ($?TERM) then
    if ($TERM == "kterm") then
        setenv TERM xterm
    endif
endif


######################################################################
#### Support japanese.
######################################################################
#setenv PAGER	jless
setenv LANG	en_US.UTF-8
setenv GIT_EDITOR vim


######################################################################
#### Key binds.
######################################################################
bindkey "^[f" forward-word
bindkey "^[b" backward-word
bindkey ^w backward-delete-word
bindkey ^r i-search-back
bindkey ^s i-search-fwd
bindkey ^p history-search-backward
bindkey ^n history-search-forward


######################################################################
#### Aliases.
######################################################################
alias ls	'ls -F'
alias la	'ls -Fa'
alias ll	'ls -lA'
alias cd..	'cd ..'
alias ipaddr	"egrep -o '[0-9]+(\.[0-9]+){3}'"
alias platex	'repeat 2 platex'
alias h		history
alias sc	screen
alias tm	'tmux attach'
alias ts	'tmux list-session'
alias be	'bundle exec'
alias gl	"git log --graph --all --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(bold white)— %an%C(reset)' --abbrev-commit"
alias csv	"awk -F, -f ${HOME}/.bin/transposed_matrix.awk"
alias rserver	'ruby -r webrick -e "WEBrick::HTTPServer.new(Port: 8000, DocumentRoot: File.join(Dir::pwd, ARGV.shift || %q{public_html})).tap {|s| trap(%q{INT}) { s.shutdown } }.start"'

alias emacs	'env XMODIFIERS=@im=none emacs -nw'
alias euc	'env LANG=ja_JP.eucJP'
alias filezilla	'env LANG=ja_JP.UTF-8 filezilla'
alias opera	'env LANG=ja_JP.UTF-8 opera'
alias processing	'env LANG=C processing'
#alias tgif	${HOME}/bin/tgif
alias vlc	${HOME}/bin/vlc
alias m		mplayer

# yabuki's alias
alias j		jobs
alias pd	pushd
alias mae	%-
