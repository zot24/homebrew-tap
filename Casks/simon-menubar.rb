cask "simon-menubar" do
  version "0.1.3"
  sha256 "696f752cf2a3ac3e7f8d834ae0e9442bdc90f00e1cf326c10d0211a6ebff6503"

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
