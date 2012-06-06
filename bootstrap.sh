#!/bin/sh

echo "Install Homebrew"
/usr/bin/ruby -e "$(/usr/bin/curl -fsSL https://raw.github.com/mxcl/homebrew/master/Library/Contributions/install_homebrew.rb)"

sudo xcode-select -switch /Developer
sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer
brew update

brew install git zsh rbenv ruby-build readline ctags

brew link git
brew link zsh
brew link rbenv 
brew link ruby-build
brew link vim
brew link ctags

brew link libevent
brew install tmux
brew link tmux

brew install --HEAD https://raw.github.com/jasoncodes/homebrew/rbenv-vars/Library/Formula/rbenv-vars.rb # https://github.com/mxcl/homebrew/pull/7891
/usr/local/bin/rbenv init
CONFIGURE_OPTS="--disable-install-doc --with-readline-dir=$(brew --prefix readline)" /usr/local/bin/ruby-build 1.9.3-p194 $HOME/.rbenv/versions/1.9.3-p194
/usr/local/bin/rbenv global 1.9.3-p194
gem install bundler
/usr/local/bin/rbenv rehash

curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

export PATH=~/.rbenv/shims:~/.rbenv/bin:$PATH
brew tap homebrew/dupes
brew install homebrew/dupes/vim