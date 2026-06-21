# Homebrew cask for Dewey — lives in zot24/homebrew-tap as Casks/dewey.rb.
# The release workflow copies this file into the tap and fills in version + sha256.
#
#   brew install --cask zot24/tap/dewey
#
cask "dewey" do
  version "0.1.0"
  sha256 "29edc0203196262648e88855cffe3393eb5d92b2d4da1eb981b747c5e186c3b9"

  url "https://github.com/zot24/dewey/releases/download/v#{version}/Dewey-#{version}.zip"
  name "Dewey"
  desc "Native macOS librarian for an llm-wiki hub"
  homepage "https://github.com/zot24/dewey"

  depends_on macos: ">= :sequoia"

  app "Dewey.app"

  zap trash: [
    "~/Library/Application Support/Dewey",
  ]
end
