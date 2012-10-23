#!/bin/csh

######################################################################
#### Setting the prompt.
######################################################################
if ($?prompt) then
	# Meta charactors:
	# 	%n <= User name.
	# 	%m <= Machine name.
	# 	%c <= Current directory.
	# 	%~ <= A relative path from ${HOME}.
	# 	%# <= Super user is #, Normal user is >.
	if ("_$user" == "_root") then
		set prompt = "%n@%m[%~]# "
	else
		set prompt = "%n@%m[%~]% "
	endif
endif


######################################################################
#### Display git-branch on prompt.
######################################################################
if (-r ${HOME}/bin/chprompt) then
   source ${HOME}/bin/chprompt
   alias cd "cd \!* && source ${HOME}/bin/chprompt"
   alias git "git \!* && source ${HOME}/bin/chprompt"
endif


######################################################################
#### Enable to the completion of the file name.
######################################################################
set autocorrect
set autolist


######################################################################
#### Mute the beep sound.
######################################################################
set nobeep


######################################################################
#### Add the current path to $PATH.
######################################################################
set path = ( $path . )


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


######################################################################
#### Key binds.
######################################################################
bindkey ^W backward-delete-word
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
alias be	'bundle exec'

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
