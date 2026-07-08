cask "simon-menubar" do
  version "0.1.0"
  sha256 "ee89b8c07fbca7894ddf828e88cbd277bdf868e9380eb6e4cadd368c744d7a6f"

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
