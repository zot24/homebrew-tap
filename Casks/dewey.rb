# Homebrew cask for Dewey — lives in zot24/homebrew-tap as Casks/dewey.rb.
# Dewey now ships from the llm-wiki-as-a-service monorepo (apps/dewey,
# Tauri 2). Releases are tagged dewey-v<version>.
#
#   brew install --cask zot24/tap/dewey
#
cask "dewey" do
  version "0.2.0"
  sha256 "ee3724c8fa6975a570177ead56a6a19f6bf0e02b434545c70f32f786e124620f"

  url "https://github.com/zot24/llm-wiki-as-a-service/releases/download/dewey-v#{version}/Dewey-#{version}.zip"
  name "Dewey"
  desc "Native macOS control panel for an llm-wiki hub, over the wiki-served API"
  homepage "https://github.com/zot24/llm-wiki-as-a-service"

  depends_on macos: :sequoia

  app "Dewey.app"

  caveats <<~EOS
    Dewey talks to a local wiki-served instance (default http://127.0.0.1:7391).
    Start it with:  wiki-served --hub ~/wiki
  EOS

  zap trash: [
    "~/Library/Application Support/com.zot24.dewey",
  ]
end
