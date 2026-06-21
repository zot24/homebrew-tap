cask "cadence" do
  version "0.1.5"
  sha256 "0119546fc8f92b446b2e12bb7324aba5b405b9926a199040ba4952263735758f"

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
