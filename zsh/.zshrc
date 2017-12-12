# export vars
typeset -U path
path+=("${HOME}/bin")
path+=("${HOME}/.cargo/bin")
path+=("${HOME}/documents/src/rakudo-star-2017.07/install/bin/")
path+=("${HOME}/documents/src/rakudo-star-2017.07/install/share/perl6/site/bin")
path+=("/opt/cross/bin")

# enviroment
export GOPATH=/home/f0x/documents/prog/go
export TERM=screen
export BROWSER=/home/f0x/.config/bin/waterfox

# aliases
alias :q="exit"
alias free="free -h"
alias grep="grep --color"
alias history="fc -l 1"
alias ls="ls --color -F"
alias mp3="youtube-dl --extract-audio --audio-format mp3"
alias upload_w1r3="cat $1 | curl -F upload=@- https://w1r3.net"
alias view="feh -Z -F"
alias view_pixel="feh --force-aliasing"

# keys
typeset -A key
key[Delete]=${terminfo[kdch1]}
[[ -n "${key[Delete]}"   ]]  && bindkey  "${key[Delete]}"   delete-char
[[ -n "$key[Up]"   ]] && bindkey -- "$key[Up]"   up-line-or-beginning-search
[[ -n "$key[Down]" ]] && bindkey -- "$key[Down]" down-line-or-beginning-search
bindkey "${terminfo[kpp]}" up-line-or-history       # [PageUp] - Up a line of history
bindkey "${terminfo[knp]}" down-line-or-history     # [PageDown] - Down a line of history
bindkey "${terminfo[khome]}" beginning-of-line      # [Home] - Go to beginning of line
bindkey "${terminfo[kend]}"  end-of-line            # [End] - Go to end of line
bindkey '^[[1;5C' forward-word                        # [Ctrl-RightArrow] - move forward one word
bindkey '^[[1;5D' backward-word                       # [Ctrl-LeftArrow] - move backward one word

# theming
#(wal -r &)
eval "$(dircolors -b)"

# completion
autoload -Uz compinit
compinit -d "${HOME}/.zcompdump-${ZSH_VERSION}"
zstyle ':completion:*' list-dirs-first true
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors "$LS_COLORS"
zstyle ':completion:*' menu select auto
zstyle ':completion::complete:*' cache-path "${HOME}/.cache/zcompcache"
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion:*' rehash true

#history
HISTFILE=$HOME/.zsh_history
SAVEHIST=100000
HISTSIZE=100000
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history # share command history data

# prompt
PROMPT='%a%F{1}[%c] %F{15}'