#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
DOTFILES_DIR="$(git -C "$SCRIPT_DIR" rev-parse --show-toplevel 2>/dev/null || (cd "$SCRIPT_DIR/../.." && pwd))"

# --- Xcode Command Line Tools ---
if ! xcode-select -p &>/dev/null; then
  echo "Installing Xcode Command Line Tools..."
  xcode-select --install
fi

# --- Appearance ---
# Dark mode
defaults write -g AppleInterfaceStyle -string "Dark"

# --- Dock ---
# Automatically hide and show Dock
defaults write com.apple.dock autohide -bool true
# Don't show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

# --- Mission Control ---
# Don't automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false
# Group windows by application in Mission Control
defaults write com.apple.dock expose-group-apps -bool true
# Disable Game Overlay shortcut (Cmd+Esc, hotkey ID 24)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 24 '<dict><key>enabled</key><false/></dict>'

# --- Language & Region ---
# Set English as primary language with Korean region
defaults write -g AppleLanguages -array "en-KR" "ko-KR"

# --- Keyboard ---
# Use F1, F2, etc. as standard function keys
defaults write -g com.apple.keyboard.fnState -bool true
# Disable press-and-hold accent menu, enable key repeat
defaults write -g ApplePressAndHoldEnabled -bool false
# Keyboard repeat rate
defaults write -g KeyRepeat -int 2
defaults write -g InitialKeyRepeat -int 15
# Full keyboard access: all controls
defaults write -g AppleKeyboardUIMode -int 2
# Map ₩ key to backtick (Korean keyboard layout fix)
if [ ! -f ~/Library/KeyBindings/DefaultkeyBinding.dict ]; then
  mkdir -p ~/Library/KeyBindings
  echo '{"₩" = ("insertText:", "\`");}' > ~/Library/KeyBindings/DefaultkeyBinding.dict
fi

# --- Keyboard > Text ---
# Disable all auto-corrections and substitutions
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false
defaults write -g NSAutomaticCapitalizationEnabled -bool false
defaults write -g NSAutomaticDashSubstitutionEnabled -bool false
defaults write -g NSAutomaticPeriodSubstitutionEnabled -bool false
defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write -g NSAutomaticTextCompletionEnabled -bool false

# --- Keyboard > Shortcuts > Input Sources ---
# Use karabiner-element to set right_option as F13
# Select previous input source: Shift+F13
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 60 \
  '<dict><key>enabled</key><true/><key>value</key><dict><key>parameters</key><array><integer>65535</integer><integer>105</integer><integer>8519680</integer></array><key>type</key><string>standard</string></dict></dict>'
# Select next input source: F13
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 61 \
  '<dict><key>enabled</key><true/><key>value</key><dict><key>parameters</key><array><integer>65535</integer><integer>105</integer><integer>8388608</integer></array><key>type</key><string>standard</string></dict></dict>'

# --- Keyboard > Shortcuts > Spotlight ---
# Disable Show Spotlight search (Cmd+Space, hotkey ID 64)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 64 '<dict><key>enabled</key><false/></dict>'
# Disable Show Finder search window (Cmd+Option+Space, hotkey ID 65)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 65 '<dict><key>enabled</key><false/></dict>'

# --- Trackpad > Point & Click ---
# Tap to click
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
# Secondary click (two-finger tap)
defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -bool true

# --- Trackpad > More Gestures ---
# Swipe between full-screen apps with three fingers
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerHorizSwipeGesture -int 2
# Mission Control with four fingers
defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerVertSwipeGesture -int 2

# --- Accessibility ---
# Enable trackpad dragging with drag lock
defaults write com.apple.AppleMultitouchTrackpad Dragging -bool true
defaults write com.apple.AppleMultitouchTrackpad DragLock -bool true

# --- Window Management ---
# Window drag from anywhere with Ctrl+Cmd
defaults write -g NSWindowShouldDragOnGesture -bool true
# Disable Cmd+Ctrl+D keybind shortcut
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 70 '<dict><key>enabled</key><false/></dict>'
# Disable windows opening animations
defaults write -g NSAutomaticWindowAnimationsEnabled -bool false

# --- Finder ---
# Show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true
# Show all file extensions
defaults write -g AppleShowAllExtensions -bool true
# Show path bar
defaults write com.apple.finder ShowPathbar -bool true
# Disable .DS_Store on network/USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# --- Screenshots ---
# Save screenshots to ~/Screenshot
defaults write com.apple.screencapture location ~/Screenshot

# --- Restart affected apps ---
killall Finder Dock SystemUIServer ControlCenter 2>/dev/null || true

# --- BetterTouchTool ---
# Import preset (launch BTT if not running)
if ! pgrep -q "BetterTouchTool"; then
  open -a "BetterTouchTool"
  sleep 2
fi
open "btt://import_preset?path=$DOTFILES_DIR/bettertouchtool/Default.bttpreset"
