# hyoshida.zsh-theme
# Repo: https://github.com/hyoshida/dotfiles
# Direct Link: https://github.com/hyoshida/dotfiles/blob/master/oh-my-zsh-custom/themes/hyoshida.zsh-theme

# support 256 color
TERM=xterm-256color

# local time, color coded by last return code
time_enabled="%(?.%F{236}.%F{197})%*%{$reset_color%}"
time_disabled="%F{236}%*%{$reset_color%}"

# elaborate exitcode on the right when >0
return_code_enabled="%(?..%F{197}%?↵ %{$reset_color%})"
return_code_disabled=

local username='%n'
local hostname='%m'
local pwd='%~'
local time=$time_disabled
local return_code=$return_code_disabled

PROMPT='${username}@${hostname}[$(git_prompt_info)${pwd}]%% '
RPROMPT='${return_code} ${time}'

ZSH_THEME_GIT_PROMPT_PREFIX='%B'
ZSH_THEME_GIT_PROMPT_SUFFIX='%b:'
ZSH_THEME_GIT_PROMPT_DIRTY='*'
ZSH_THEME_GIT_PROMPT_CLEAN=

# switch time and return code color
accept-line-or-clear-warning() {
    if [[ -z $BUFFER ]]; then
        time=$time_disabled
        return_code=$return_code_disabled
    else
        time=$time_enabled
        return_code=$return_code_enabled
    fi
    zle accept-line
}
zle -N accept-line-or-clear-warning
bindkey '^M' accept-line-or-clear-warning
