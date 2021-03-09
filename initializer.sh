#!/bin/sh

##########################################################################
# Need two arguments                                                     #
# 1: iTunes account email address                                        #
# 2: iTunes account password                                             #
# chmod +x initialize.sh; ./initializer.sh "me@example.com" "my_password"#
##########################################################################

cd ~/Downloads/


# Install Brew
# ------------

echo 'Installling brew...'

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/junior/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
echo 'Brew installed'


# Install Brew package
# --------------------

echo 'Installing brew package...'

brew tap homebrew/cask

brew install ruby
brew install git
brew install mas
brew install wget
brew install robotsandpencils/made/xcodes

echo 'Package installed'


# Install all needed softwares
# ----------------------------

echo 'Installing softwares...'

brew install --cask spotify
brew install --cask sublime-text
brew install --cask sourcetree
brew install --cask pycharm
brew install --cask google-chrome
brew install --cask iterm2
brew install --cask vlc
brew install --cask github
brew install --cask caffeine
brew install --cask proxyman
brew install --cask twitch
brew install --cask microsoft-excel
brew install --cask adobe-creative-cloud
brew install --cask monitorcontrol
brew install --cask kap
brew cleanup

# Download mimestram : https://mimestream.com/download


echo 'Softwares installed'


# Install packages
# ----------------

# Mas 
mas signin $1 $2
mas install 595191960 #copyClip
mas install 1163105418 #New File Free
mas install 803453959 #Slack
mas install 493656257 #Slender
mas install 1330801220 #Paste JSON as Code
mas install 1388020431 #DevCleaner
mas install 1480068668 #Messenger
mas install 1482454543 #Twitter

# Gem
sudo gem install cocoapods
sudo gem install fastlane

# Pip
sudo easy_install pip

# Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Upgrade Python
wget https://www.python.org/ftp/python/3.7.9/python-3.7.9-macosx10.9.pkg
sudo installer -pkg python-3.7.9-macosx10.9.pkg -target /
rm python-3.7.9-macosx10.9.pkg

# Install xcode color scheme
git clone https://github.com/hdoria/xcode-themes.git
cd xcode-themes
./install.sh
cd ..
rm -rf xcode-themes

# Power line shell
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
cd ..
rm -rf fonts
git clone https://github.com/milkbikis/powerline-shell
mv powerline-shell ~/Documents/powerline-shell
cd powerline-shell
sudo python setup.py install
ln -s powerline-shell.py ~/powerline-shell.py
mkdir -p ~/.config/powerline-shell && \
powerline-shell --generate-config > ~/.config/powerline-shell/config.json
pip install argparse


# Configuration
# -------------

# Bash profile
#touch ~/.bash_profile
#source ~/.bash_profile

# Oh-My-Zsh conf
echo 'Configuring Oh-My-Zsh...'

echo "gem: --no-document" >> ~/.gemrc
sudo mkdir -p "/usr/local/bin/" && ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl

cat ~/Downloads/Mac-Dev-Env-Init-master/conf.txt > ~/.zshrc


# Xcode
# xcodes install 12.2
