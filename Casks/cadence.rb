cask "cadence" do
  version "0.1.9"
  sha256 "9e0625373f564eb58dbeeb30c3d15fb0bca0c9897488ea809ac693f88cffb571"

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
