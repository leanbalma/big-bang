#!/bin/bash

# Add repositories
sudo add-apt-repository -y "deb http://dl.google.com/linux/chrome/deb/ stable main"
sudo add-apt-repository -y "deb http://apt.spideroak.com/ubuntu-spideroak-hardy/ release restricted"
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 573E3D1C51AE1B3D


# Upgrade current packages.
sudo apt-get -y update
sudo apt-get -y upgrade


# install apps
sudo apt-get -y install \
    build-essential cmake exuberant-ctags \
    git google-chrome-stable keepassx neovim \
    python-dev python-pip python3-dev python3-pip \
    silversearcher-ag spideroakone tree virtualenvwrapper zsh


# Terminal
# Oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# zsh-syntax-highlighting
# Install this one manually for now: https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#oh-my-zsh


#vim-configuration
sudo pip install setuptools
sudo pip install neovim
NVIM_FOLDER=.config/nvim
pushd ~
mkdir $NVIM_FOLDER
git clone https://github.com/ivanalejandro0/vim-configs.git $NVIM_FOLDER
cd $NVIM_FOLDER
git checkout -b neovim origin/neovim
popd


echo "======= Done! ========"
echo ""
