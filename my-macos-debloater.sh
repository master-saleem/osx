#!/bin/bash
echo "hidden files on Mac"
defaults write com.apple.Finder AppleShowAllFiles true
sudo defaults write com.apple.Finder AppleShowAllFiles true

# root GUI and animation related things to tweak
echo "Disabling all animations."
sudo defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
sudo defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
sudo defaults write com.apple.finder DisableAllAnimations -bool true
sudo defaults write com.apple.dock launchanim -bool false
sudo defaults write com.apple.dock expose-animation-duration -float 0.1
sudo defaults write com.apple.Dock autohide-delay -float 0
sudo defaults write -g QLPanelAnimationDuration -float 0
sudo sysctl debug.lowpri_throttle_enabled=0

# user GUI and animation related things to tweak
echo "User GUI and animation related things to tweak."
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
defaults write -g QLPanelAnimationDuration -float 0
defaults write com.apple.dock autohide-time-modifier -float 0
defaults write com.apple.dock launchanim -bool false
sudo sysctl debug.lowpri_throttle_enabled=0

echo "Success."

#echo "Disabling the SMB protocol."
#sudo defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool TRUE
#echo "Success."

#echo "Disbling FileVault."
#sudo fdesetup disable
#echo "Success."

echo "Disabling Crash Reporting, Call History, Diagnostics, FTP, Spindump, Helpd, and Location Services." 
SERVICES="com.apple.geod com.apple.helpd com.apple.spindump com.apple.ftp-proxy com.apple.metadata.mds.spindump com.apple.CallHistoryPluginHelper com.apple.ap.adprivacyd com.apple.ReportPanic com.apple.ReportCrash com.apple.ReportCrash.Self com.apple.DiagnosticReportCleanup"
for val in ${SER[*]}
do
  sudo launchctl disable $val
  echo "Success."
done

#echo "Rebooting in 3 Seconds."
#sleep 3
#sudo reboot