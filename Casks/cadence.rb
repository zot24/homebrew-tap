cask "cadence" do
  version "0.1.1"
  sha256 "9955e138704a6362957078919a1c63650a6ad92c93f6ce135238c145168a827f"

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
