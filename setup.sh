#!/bin/bash
printf "Ubuntu Setup | github.com/andrejfernandez/ubuntu-setup\n"

# Add repositores
printf "Adding repositories...\n"
yes | sudo add-apt-repository ppa:zhangsongcui3371/fastfetch

# Updates
clear
printf "Updating and upgrading the system...\n"
sudo apt-get update
sudo apt-get upgrade -y

# Install base packages
clear
printf "Installing base packages...\n"
sudo apt install curl zsh fastfetch fzf

# Install zoxide
clear
printf "Installing zoxide...\n"
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

# Install oh-my-zsh
clear
printf "Installing oh-my-zsh...\n"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install oh-my-zsh plugins
clear
printf "Installing oh-my-zsh plugins...\n"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Setup dotfiles
clear
printf "Setting up dotfiles...\n"
cp -r ./dotfiles ~/
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/fastfetch/config.jsonc ~/.config/fastfetch/config.jsonc

zsh