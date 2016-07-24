# Debian
alias up='sudo apt update; sudo apt upgrade; sudo apt dist-upgrade -V'

# Files
alias ls="ls -ohX"
alias la="ls -oAh"
alias vim='nvim'

# Config
alias nvconf='nvim ~/.config/nvim/init.vim'
alias zshrc='nvim ~/.zshrc && source ~/.zshrci'
alias tmuxconf='nvim ~/.tmux.conf'
alias xres='nvim ~/.Xresources && xrdb ~/.Xresources'

# Network
alias p='ping 8.8.8.8'
