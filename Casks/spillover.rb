# Homebrew cask for Spillover. scripts/release.sh fills in the version and checksum and writes
# dist/release/spillover.rb; copy that file to Casks/spillover.rb in the tap repository
# (github.com/Saad-ISAA/homebrew-spillover).
cask "spillover" do
  version "0.1.2"
  sha256 "71f7b00da09fafe781d496adc822858f91efa06caeb616d4a913f882815d02f1"

  url "https://github.com/Saad-ISAA/spillover/releases/download/v#{version}/Spillover-#{version}.dmg"
  name "Spillover"
  desc "Gives each folder, window and terminal its own Claude subscription"
  homepage "https://github.com/Saad-ISAA/spillover"

  depends_on macos: :sonoma

  app "Spillover.app"
  binary "#{appdir}/Spillover.app/Contents/Helpers/spillover"

  uninstall quit: "app.spillover.menubar"

  zap trash: "~/Library/Preferences/app.spillover.menubar.plist"

  caveats <<~EOS
    Before uninstalling, open Spillover and choose Setup > Undo all changes so your editor and
    shell settings are restored. Your accounts in ~/.spillover are kept; delete that folder
    yourself if you no longer need them.
  EOS
end
