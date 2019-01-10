#!/bin/bash
sudo apt-get update

#C++ tools install commands
sudo apt install -y g++
sudo apt install -y valgrind
sudo apt install -y htop
sudo apt install -y clang
sudo apt install -y cmake

#new terminal(terminator) install command
sudo apt install -y terminator

#fast string search in terminal 
sudo apt-get install -y silversearcher-ag

#git install command
sudo apt-get install -y git

#Zsh and Powerline configuration commands
#sudo apt-get install -y powerline fonts-powerline
#sudo apt-get install -y zsh-theme-powerlevel9k
#echo "source /usr/share/powerlevel9k/powerlevel9k.zsh-theme" >> ~/.zshrc
#sudo apt-get install -y zsh-syntax-highlighting
#echo "source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
#wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf\nwget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
#sudo mv PowerlineSymbols.otf /usr/share/fonts/
#sudo fc-cache -vf /usr/share/fonts/
#sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/


#Java8 install commands
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
sudo apt-get install -y oracle-java8-installer

#colour picker tool install command
# you can go to this website : http://mayccoll.github.io/Gogh/#0 and pick your fav color 
# for terminator background
#sudo apt-get install -y gpick
