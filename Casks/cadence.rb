cask "cadence" do
  version "0.1.7"
  sha256 "9c777d043b0b28f3c896353aaca02aa36d4866d91cbfe4bd03b8ccdbdef9923f"

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
