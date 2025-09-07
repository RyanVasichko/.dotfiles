#!/usr/bin/env bash

POSTGRES_VERSION=${POSTGRES_VERSION:-17}
RUBY_VERSION=${RUBY_VERSION:-latest}
NODE_VERSION=${NODE_VERSION:-lts}
GO_VERSION=${GO_VERSION:-latest}

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do
  sudo -n true
  sleep 60
  kill -0 "$$" || exit
done 2>/dev/null &

echo "Installing updates..."
sudo softwareupdate -i -a

echo "Installing rosetta..."
sudo softwareupdate --install-rosetta --agree-to-license

if test ! $(which brew); then
  echo "Installing homebrew..."
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
eval "$(/opt/homebrew/bin/brew shellenv)"
brew update
brew upgrade

echo "Installing packages from homebrew..."
brew bundle
brew install postgresql@$POSTGRES_VERSION
brew link postgresql@$POSTGRES_VERSION

echo "Installing mise..."
curl https://mise.run | sh

echo "Creating ~/.config/mise"
mkdir -p ~/.config/mise
cat >~/.config/mise/config.toml <<EOF
[tools]
go = "$GO_VERSION"
ruby = "$RUBY_VERSION"
node = "$NODE_VERSION"
EOF

echo "Installing tools..."
~/.local/bin/mise install
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# System Preferences
osascript -e 'tell application "System Events" to tell appearance preferences to set dark mode to true'
defaults write com.apple.dock tilesize -int 33
defaults write com.apple.dock show-recents -bool false

# Enable stage manager
osascript <<EOF
tell application "System Settings"
    activate
    delay 1
    reveal pane id "com.apple.desktop.wellness"
    delay 1
    tell application "System Events"
        tell process "System Settings"
            click checkbox "Stage Manager" of window "Desktop & Dock"
        end tell
    end tell
    delay 1
    quit
end tell
EOF

dockutil --remove "TV"
dockutil --remove "Numbers"
dockutil --remove "Keynote"
dockutil --remove "Pages"
dockutil --remove "Safari"
dockutil --remove "Maps"
dockutil --remove "Photos"
dockutil --remove "Freeform"
dockutil --remove "News"
dockutil --remove "iPhone Mirroring"
dockutil --remove "FaceTime"
dockutil --remove "Contacts"
dockutil --remove "Reminders"
dockutil --remove "Music"
dockutil --remove "App Store"

dockutil --add /Applications/Google\ Chrome.app --position 4
dockutil --add /Applications/Ghostty.app --position 5
dockutil --add /Applications/Spotify.app --position 6

# Restart dock to apply changes
killall Dock
./symlinks.sh
