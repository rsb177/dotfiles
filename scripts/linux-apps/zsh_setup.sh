# Setup ZSH & Oh-My-ZSH

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "Oh-My-ZSH already installed, skipping"
fi

ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc

if [ "$SHELL" != "$(which zsh)" ]; then
    echo "Setting zsh as default shell (password required)"
    chsh -s $(which zsh)
else
    echo "zsh is already the default shell, skipping"
fi
