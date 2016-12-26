#!/bin/sh

echo "\n>>>>>>>>>>> Jarvis at your service, setting up your Mac sir... <<<<<<<<<<<<\n"

# Check for Homebrew and install if we don't have it
echo ">>>>>>>>>>> installing BREW... <<<<<<<<<<<<\n"
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew update
fi

# Install all our dependencies with bundle (See Brewfile)
echo ">>>>>>>>>>> installing all the dependencies (apps) via BREW (this could take sometime)... <<<<<<<<<<<<\n"
brew bundle install

# Oh-my-zsh
echo ">>>>>>>>>>> installing oh-my-zsh... <<<<<<<<<<<<\n"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Link sublime
echo ">>>>>>>>>>> linking sublime-text for terminal use... <<<<<<<<<<<<\n"
ln -s “/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl” /usr/local/bin/s

# Install rvm
echo ">>>>>>>>>>> installing RVM... <<<<<<<<<<<<\n"
brew install gpg2
gpg2 --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable
rvm install 2.3
rvm use 2.3 --default

echo ">>>>>>>>>>> setting up Doc... <<<<<<<<<<<<\n"
# Configure Dock
dockutil --no-restart --remove all
dockutil --no-restart --add "/Applications/Safari.app"
dockutil --no-restart --add "/Applications/Utilities/Terminal.app"
dockutil --no-restart --add "/Applications/System Preferences.app"
dockutil --no-restart --add "/Applications/Utilities/Console.app"
dockutil --no-restart --add "/Applications/Spotify.app"
dockutil --no-restart --add "/Applications/iTunes.app"
killall Dock

echo ">>>>>>>>>>> All done sir, enjoy your new setup - Jarvis <<<<<<<<<<<<\n"

