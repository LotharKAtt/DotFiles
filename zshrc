#  _             _    _                   _   __  ___   _    _
# | |           | |  | |                 | | / / / _ \ | |  | |
# | |      ___  | |_ | |__    __ _  _ __ | |/ / / /_\ \| |_ | |_
# | |     / _ \ | __|| '_ \  / _` || '__||    \ |  _  || __|| __|
# | |____| (_) || |_ | | | || (_| || |   | |\  \| | | || |_ | |_
# \_____/ \___/  \__||_| |_| \__,_||_|   \_| \_/\_| |_/ \__| \__|
#
#  Author: Pavel 'LotharKAtt' Cizinsky
#  Repository: github.com/LotharKAtt/DotFiles
#  zsh config file

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# Homebrew
HOMEBREW_NO_AUTO_UPDATE=false

# Zsh history
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.

# Set up ZPLUG zsh manager
if [[ "$(uname -s)" = Darwin && "$(uname -v)" = *ARM64* ]]; then
    export ZPLUG_HOME=/opt/homebrew/opt/zplug
    source $ZPLUG_HOME/init.zsh
else
    export ZPLUG_HOME=/usr/local/opt/zplug
    source $ZPLUG_HOME/init.zsh
fi

export LANG=en_US.UTF-8
export EDITOR=nvim

# Golang
export GOPATH=$HOME/Development/go
export GO111MODULE=on

# FZF
source <(fzf --zsh)
# Tokyonight day theme
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
  --highlight-line \
  --info=inline-right \
  --ansi \
  --layout=reverse \
  --border=none
  --color=bg+:#b7c1e3 \
  --color=bg:#d0d5e3 \
  --color=border:#4094a3 \
  --color=fg:#3760bf \
  --color=gutter:#d0d5e3 \
  --color=header:#b15c00 \
  --color=hl+:#188092 \
  --color=hl:#188092 \
  --color=info:#8990b3 \
  --color=marker:#d20065 \
  --color=pointer:#d20065 \
  --color=prompt:#188092 \
  --color=query:#3760bf:regular \
  --color=scrollbar:#4094a3 \
  --color=separator:#b15c00 \
  --color=spinner:#d20065 \
"

# zoxide
eval "$(zoxide init zsh)"


# Load aliases from external file
source ~/.aliases.zsh

autoload -Uz +X compinit && compinit

## case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

if [[ "$(uname -s)" = Darwin && "$(uname -v)" = *ARM64* ]]; then
    # Auto suggestion
    source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    # Syntax highlights
    source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
    source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Scrolling history
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# Enable thefuck
eval $(thefuck --alias)

export PATH="/usr/local/opt/util-linux/bin:$PATH"