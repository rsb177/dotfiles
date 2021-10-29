# Setup ZSH & Oh-My-ZSH

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc

echo "Setting zsh as default shell (password required)"
chsh -s $(which zsh)
