!#/bin/zsh


install_brew(){
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
    echo "Homebrew installed! 🍺"
}

tmux(){
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
}   

install_brew_pkgs(){
    install_brew
    brew bundle --file=.Brewfile
    echo "Homebrew packages installed! 🍺"

}

configure_dotfiles(){
    # VIM
}

main(){
    install_brew_pkgs
    echo "Dotfiles bootstrap completed! 🎉"
    source .zshrc
}
