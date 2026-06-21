cask "cadence" do
  version "0.1.6"
  sha256 "d9f86914539c0ee28f97f1f226077801d211b2f513114d22f252b30918db1b3e"

  url "https://github.com/zot24/cadence/releases/download/v#{version}/Cadence.dmg"
  name "Cadence"
  desc "Menu-bar control plane for scheduled jobs: cron, launchd, and Flue agents"
  homepage "https://github.com/zot24/cadence"

  app "Cadence.app"

  caveats <<~EOS
    Cadence is ad-hoc signed (not notarized). On first launch either:
      • right-click Cadence.app in /Applications and choose Open, or
      • run: xattr -dr com.apple.quarantine "#{appdir}/Cadence.app"
  EOS
end
