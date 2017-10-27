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

echo 'Brew installed'


# Install Brew package
# --------------------

echo 'Installing brew package...'

brew tap caskroom/cask
brew install caskroom/cask/brew-cask

brew install ruby
brew install git
brew install mas
brew install wget

echo 'Package installed'


# Install all needed softwares
# ----------------------------

echo 'Installing softwares...'

brew cask install spotify
brew cask install xampp
brew cask install sublime-text
brew cask install sourcetree
brew cask install pycharm-ce
brew cask install google-chrome
brew cask install iterm2
brew cask install mongohub
brew cask install vlc
brew cask install dropbox
brew cask install filezilla
brew cask install spectacle
brew cask install goofy
brew cask install caffeine
brew cask install transmission
brew cask install adobe-creative-cloud
brew cask cleanup

wget 'https://github.com/noodlewerk/NWPusher/releases/download/0.7.4/pusher.app.zip'
unzip pusher.app.zip
rm pusher.app.zip
mv pusher.app /Applications/pusher.app

echo 'Softwares installed'


# Install packages
# ----------------

# Mas 
mas signin $1 $2
mas install 497799835 #xCode
mas install 595191960 #copyClip
mas install 1163105418 #New File Free
mas install 525912054 #Wifi Signal
mas install 803453959 #Slack
mas install 493656257 #Slender

# Gem
sudo gem install cocoapods
sudo gem install fastlane

# Pip
sudo easy_install pip

# Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Upgrade Python
wget https://www.python.org/ftp/python/2.7.13/python-2.7.13-macosx10.6.pkg
sudo installer -pkg python-2.7.13-macosx10.6.pkg -target /
rm python-2.7.13-macosx10.6.pkg

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
git clone https://github.com/banga/powerline-shell
mv powerline-shell
cd ~/Documents/powerline-shell
python setup.py install

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

echo '# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/junior/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# itll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias ohmyzsh="mate ~/.oh-my-zsh"

#source ~/.bash_profile
source ~/Documents/powerline-shell/antigen.zsh

antigen bundle soimort/translate-shell

function powerline_precmd() {
    PS1="$(/Users/junior/Documents/powerline-shell/powerline-shell.py $? --shell zsh 2> /dev/null)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi

# Aliases config
alias zshconfig="open ~/.zshrc"

# Aliases networking
alias flushDNS="dscacheutil -flushcache"
alias openPorts="sudo lsof -i | grep LISTEN"
alias showBlocked="sudo ipfw list"
alias netCons="lsof -i"

# Aliases xCode
alias derived_data="rm -rf ~/Library/Developer/Xcode/DerivedData/*"
dsym () { mdfind "com_apple_xcode_dsym_uuids == $@" ; }

# Aliases other
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM

# Aliases trad
alias trad="trans fr:en '$@'"
alias tradr="trans en:fr '$@'"
alias notebook="jupyter notebook --port 9999 --notebook-dir ~/notebook" ' > ~/.zshrc
