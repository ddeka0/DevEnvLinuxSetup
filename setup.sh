#!/bin/bash
sudo apt-get update
sudo apt install -y g++
sudo apt install -y valgrind
sudo apt install -y htop
sudo apt install -y clang
sudo apt install -y cmake
sudo apt install -y terminator
sudo apt-get install -y silversearcher-ag
sudo apt-get install -y git
sudo apt-get install -y powerline fonts-powerline
sudo apt-get install -y zsh-theme-powerlevel9k
echo "source /usr/share/powerlevel9k/powerlevel9k.zsh-theme" >> ~/.zshrc
sudo apt-get install -y zsh-syntax-highlighting
echo "source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf\nwget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
sudo mv PowerlineSymbols.otf /usr/share/fonts/
sudo fc-cache -vf /usr/share/fonts/
sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
sudo apt-get install -y oracle-java8-installer
sudo apt-get install -y gpick
