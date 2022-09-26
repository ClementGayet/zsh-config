# Installing plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-"$HOME"/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

## Installing fzf, need user interaction
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Copying files to the right place using symlinks
echo 'Copying files to the right place...'

path=$(realpath ../) # is the path to the directory where the files should be copied to.

mv "$HOME/.zshrc" "$HOME/.zshrc.bak" # backup the old .zshrc file
ln -s "$path/.zshrc" "$HOME/.zshrc"