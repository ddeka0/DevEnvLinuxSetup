#!/bin/bash
sudo apt-get update
sudo apt install g++
sudo apt install valgrind
sudo apt install htop
sudo apt install clang
sudo apt install cmake
sudo apt install terminator
sudo apt-get install silversearcher-ag
sudo apt-get install git
sudo apt-get install powerline fonts-powerline
sudo apt-get install zsh-theme-powerlevel9k
echo "source /usr/share/powerlevel9k/powerlevel9k.zsh-theme" >> ~/.zshrc
sudo apt-get install zsh-syntax-highlighting
echo "source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf\nwget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
sudo mv PowerlineSymbols.otf /usr/share/fonts/
sudo fc-cache -vf /usr/share/fonts/
sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/
