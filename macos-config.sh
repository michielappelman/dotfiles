#!/usr/bin/env bash

# General Seppings
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
defaults write NSGlobalDomain AppleSpacesSwitchOnActivate -bool true
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
defaults write NSGlobalDomain NSNavPanelFileLastListModeForOpenModeKey -int 2
defaults write NSGlobalDomain NSNavPanelFileListModeForOpenMode2 -int 2
defaults write NSGlobalDomain NavPanelFileListModeForOpenMode -int 2

defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Keyboard Settings
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain AppleKeyboardUIMode -int 2

# Mouse Settings
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true

# Dock Settings
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock show-recents -bool true
defaults write com.apple.dock tilesize -int 50
defaults write com.apple.dock largesize -int 69
defaults write com.apple.dock expose-animation-duration -float 0.1

# Spaces Settings
defaults write com.apple.dock mru-spaces -bool false
defaults write com.apple.dashboard mcx-disabled -bool true
defaults write com.apple.dock dashboard-in-overlay -bool true

# Hot Corners
defaults write com.apple.dock wvous-tl-corner -int 0
defaults write com.apple.dock wvous-tl-modifier -int 0
defaults write com.apple.dock wvous-tr-corner -int 2
defaults write com.apple.dock wvous-tr-modifier -int 0
defaults write com.apple.dock wvous-bl-corner -int 0
defaults write com.apple.dock wvous-bl-modifier -int 0
killall Dock

# Finder Settings
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf" # search in current folder
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
defaults write com.apple.finder WarnOnEmptyTrash -bool false
chflags nohidden ~/Library && xattr -d com.apple.FinderInfo ~/Library
killall Finder

# Screenshot Settings
defaults write com.apple.screencapture "type" -string "jpg"
defaults write com.apple.screencapture "location" -string "~/OneDrive - Cisco/Screenshots"
defaults write com.apple.screencapture "disable-shadow" -bool true
killall SystemUIServer

# Application Settings
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true
