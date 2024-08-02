echo "Ubuntu Setup | github.com/andrejfernandez/ubuntu-setup\n"

# Check if script is being run with admin privileges
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run with administrative privileges!"
    exit 1
fi

# Add repositores
clear
echo "Adding repositories...\n"
add-apt-repository ppa:zhangsongcui3371/fastfetch

# Updates
clear
echo "Updating and upgrading the system...\n"
apt-get update
apt-get upgrade -y

# Install base packages
clear
echo "Installing base packages...\n"
apt install curl zsh fastfetch fzf

# Install zoxide
clear
echo "Installing zoxide...\n"
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

# Install oh-my-zsh
clear
echo "Installing oh-my-zsh...\n"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install oh-my-zsh plugins
clear
echo "Installing oh-my-zsh plugins...\n"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Setup dotfiles
clear
echo "Setting up dotfiles...\n"
cp -r ./dotfiles ~/
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/fastfetch/config.jsonc ~/.config/fastfetch/config.jsonc

zsh