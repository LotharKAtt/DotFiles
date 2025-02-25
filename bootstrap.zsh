#!/bin/zsh

LOCAL_REPO="$HOME/Development/DotFiles"

install_brew(){
    if ! command -v brew &> /dev/null; then
        echo "Installing Homebrew... 🍺"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        echo >> $HOME/.zprofile
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    else
        echo "Homebrew is already installed ✅"
    fi
}

configure_tmux(){
    if ! command -v tmux &> /dev/null; then
        echo "Tmux is not installed! ❌ Please check your Brewfile and install it first."
        return 1
    fi

    echo "Tmux is installed ✅"

    echo "Setting up Tmux Plugin Manager (TPM)..."
    if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
        git clone https://github.com/tmux-plugins/tpm $HOME/.config/tmux/plugins/tpm
    else
        echo "TPM is already installed ✅"
    fi

    echo "Sourcing tmux config..."
    tmux source-file $HOME/.config/tmux/tmux.conf

    echo "Tmux setup complete! 🚀"
}

install_brew_pkgs(){
    install_brew
    brew bundle --file=Brewfile
    echo "Homebrew packages installed! 🍺"

}

additonal_config(){
    configure_tmux
    # nvim
}

create_symlinks(){
    echo "Creating symlinks... 🔗"

    # Ensure directories exist before linking
    mkdir -p $HOME/.config/tmux $HOME/.config/nvim $HOME/.config/aerospace

    # Symlink dotfiles
    ln -sf $LOCAL_REPO/tmux/* $HOME/.config/tmux
    ln -sf $LOCAL_REPO/nvim/* $HOME/.config/nvim
    ln -sf $LOCAL_REPO/aerospace/* $HOME/.config/aerospace
    ln -sf $LOCAL_REPO/aliases.zsh $HOME/.aliases.zsh
    ln -sf $LOCAL_REPO/p10k.zsh $HOME/.p10k.zsh
    ln -sf $LOCAL_REPO/zshrc $HOME/.zshrc
    ln -sf $LOCAL_REPO/wezterm.lua $HOME/.wezterm.lua

    echo "Symlinks created! ✅"
}

main(){
    install_brew_pkgs
    create_symlinks
    additonal_config

    echo "Dotfiles bootstrap completed! 🎉"
    echo "Please restart your terminal or run: exec zsh"
}

main

# TODO: Manual steps
# [ ] Clocker config
# [ ]
