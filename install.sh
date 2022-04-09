
# Set a new HOME directory, and then...
echo "Setting new home directory..."
HOME="/Users/$USER/Development"
export HOME

# ...immediately switch into that directory.
cd ~
echo "...done! Home directory set to $HOME"

# Install oh-my-zsh
echo "Installing oh-my-zsh for a more delightful shell experience..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh) --unattended"
echo "...done! oh-my-zsh was installed!"

# Install powerlevel10k
echo "Installing powerlevel10k theme for oh-my-zsh for snazzy shell prompts..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
echo "...done! Your prompts will be snazzified shortly!"

# Install zsh-autosuggestions
echo "Installing zsh-autosuggestions for helpful hints when typing..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
echo "...done! zsh-autosuggestions installed!"

# Create a symlink to point the user's default .zshrc to the dotfiles repo
echo "Removing default .zshrc and replacing it with a symlink pointing to ours..."
[[ ! -f "/Users/$USER/.zshrc" ]] || rm "/Users/$USER/.zshrc"
[[ ! -f ~/.zshrc ]] || rm ~/.zshrc
ln -s ~/dotfiles/.zshrc "/Users/$USER/.zshrc"
echo "...done!"

# Create a symlink in the new home directory to point to our p10k config
echo "Creating a symlink to our powerlevel10k configuration..."
[[ ! -f ~/.p10k.zsh ]] || rm ~/.p10k.zsh
ln -s ~/dotfiles/.p10k.zsh ~/.p10k.zsh
echo "...done!"

# Create a symlink in the new home directory to point to our global gitconfig
echo "Setting global gitignore..."
git config --global core.excludesfile ~/dotfiles/.gitignore
echo "...done!"

echo "Just about finished! Either close this window and open a new one to get started, or run this command:"
echo "\n    source ~/dotfiles/.zshrc\n"

# Initialize all our new shit!
exec zsh