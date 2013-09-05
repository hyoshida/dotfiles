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
    if (-r ${HOME}/dotfiles/config/prompt.tcshrc) then
        source ${HOME}/dotfiles/config/prompt.tcshrc
        alias cd "cd \!* && source ${HOME}/dotfiles/config/prompt.tcshrc"
        alias git "git \!* && source ${HOME}/dotfiles/config/prompt.tcshrc"
    endif

    # Completions
    if (-r ${HOME}/dotfiles/config/complete.tcshrc) then
        source ${HOME}/dotfiles/config/complete.tcshrc
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
#### Support MacPorts commands.
######################################################################
if ( -x /opt/local/bin/port ) then
    set path = ( /opt/local/bin /opt/local/sbin $path )
endif


######################################################################
#### Support rbenv commands.
######################################################################
if ( -x $home/.rbenv/bin/rbenv ) then
    which gmake >& /dev/null && alias rbenv 'env MAKE=gmake rbenv'
    set path = ( $home/.rbenv/bin $home/.rbenv/shims $path )
    rbenv rehash
endif


######################################################################
#### Add the current path to $PATH.
######################################################################
set path = ( $home/bin $home/.bin $path /sbin . )


######################################################################
#### Support color for kterm.
######################################################################
if ($?TERM) then
    if ($TERM == "kterm") then
        setenv TERM xterm
    endif
endif


######################################################################
#### Support tmux-powerline.
######################################################################
if ($?TMUX) then
    tmux setenv TMUXPWD_`tmux display -p "#D" | tr -d %` `pwd`
endif


######################################################################
#### Support japanese.
######################################################################
#setenv PAGER	jless
setenv LANG	en_US.UTF-8
setenv GIT_EDITOR vim


######################################################################
#### Disable START/STOP(C-s/C-q) output control.
######################################################################
if ( -x /bin/stty ) then
    stty -ixon
endif



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
alias tmux	'tmux -2'
alias tm	'tmux attach'
alias ts	'tmux list-session'
alias be	'bundle exec'
alias re	'rbenv exec'
alias csv	"awk -F, -f ${HOME}/.bin/transposed_matrix.awk"
alias rserver	'ruby -r webrick -e "WEBrick::HTTPServer.new(:Port => 8000, :DocumentRoot => File.join(Dir::pwd, ARGV.shift || %q{public_html})).tap {|s| trap(%q{INT}) { s.shutdown } }.start"'

alias emacs	'env XMODIFIERS=@im=none TERM=xterm-256color emacs -nw'
alias cmus	'env TERM=xterm-256color cmus'
alias euc	'env LANG=ja_JP.eucJP'
alias processing	'env LANG=C processing'
alias m		mplayer

# alias for BSD
switch ("$OSTYPE")
case *'bsd'*:
case *'darwin'*:
	alias top 'top -u'
	breaksw
endsw

# yabuki's alias
alias j		jobs
alias pd	pushd
alias mae	%-
