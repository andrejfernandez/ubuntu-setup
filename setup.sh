#!/bin/bash
clear
echo -e "Ubuntu Setup | github.com/andrejfernandez/ubuntu-setup\n"

# Check if script is being run as admin
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script as root or using sudo!\n"
    exit 1
fi

# Add repositores
echo -e "Adding repositories...\n"
yes | add-apt-repository ppa:zhangsongcui3371/fastfetch

# Updates
clear
echo -e "Updating and upgrading the system...\n"
apt-get update
apt-get upgrade -y

# Install base packages
clear
echo -e "Installing base packages...\n"
apt install curl zsh fastfetch fzf

# Install zoxide
clear
echo -e "Installing zoxide...\n"
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

# Install oh-my-zsh
clear
echo -e "Installing oh-my-zsh...\n"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install oh-my-zsh plugins
clear
echo -e "Installing oh-my-zsh plugins...\n"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions

# Setup dotfiles
clear
echo -e "Setting up dotfiles...\n"
mkdir ~/.config
mkdir ~/.config/fastfetch
cp -r ./dotfiles ~/
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/fastfetch/config.jsonc ~/.config/fastfetch/config.jsonc

chsh -s $(which zsh)
cd ~
zsh