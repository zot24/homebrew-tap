cask "simon-menubar" do
  version "0.1.1"
  sha256 "bbdb774dda0288749b3c0ca8b294b5446f55abb040d7f7f4a8f58cb27dfedd93"

  url "https://github.com/zot24/simon/releases/download/v#{version}/simon-menubar-#{version}.dmg"
  name "simon"
  desc "Menu-bar system monitor: live memory glance plus a native dashboard panel"
  homepage "https://github.com/zot24/simon"

  depends_on macos: :sequoia

  app "simon.app"

  caveats <<~EOS
    simon-menubar is ad-hoc signed (not notarized). On first launch either:
      • right-click simon.app in /Applications and choose Open, or
      • run: xattr -dr com.apple.quarantine "#{appdir}/simon.app"
  EOS
end
