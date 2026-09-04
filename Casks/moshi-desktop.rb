# Homebrew cask for Moshi Desktop — lives in zot24/homebrew-tap as
# Casks/moshi-desktop.rb.
#
#   brew install --cask zot24/tap/moshi-desktop
#
# Native Tauri app from cdn.getmoshi.app. This is not moshi-hook
# (the CLI/daemon from `curl …/install.sh | sh` / rjyo/moshi).
cask "moshi-desktop" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.16"
  sha256 arm:   "b9c93e4aafc603d68eccd6664dc8380d115914988fcf7d3df4c05346f3a32986",
         intel: "8427d28383e71103800b1b52e1e6b09e19f55d242d22d5ab4925ebc9bc839c63"

  url "https://cdn.getmoshi.app/desktop/v#{version}/Moshi_#{version}_#{arch}.dmg"
  name "Moshi"
  desc "Native desktop client for Moshi, a coding-agent terminal over SSH and Mosh"
  homepage "https://getmoshi.app/desktop"

  livecheck do
    url "https://cdn.getmoshi.app/desktop/latest/version.txt"
    regex(/v?(\d+(?:\.\d+)+)/i)
  end

  depends_on :macos

  app "Moshi.app"

  zap trash: [
    "~/Library/Application Support/app.getmoshi.desktop.tauri",
    "~/Library/Caches/app.getmoshi.desktop.tauri",
    "~/Library/Logs/app.getmoshi.desktop.tauri",
    "~/Library/Preferences/app.getmoshi.desktop.tauri.plist",
    "~/Library/Saved Application State/app.getmoshi.desktop.tauri.savedState",
    "~/Library/WebKit/app.getmoshi.desktop.tauri",
  ]
end
