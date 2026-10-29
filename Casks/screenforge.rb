# Homebrew cask for ScreenForge — lives in zot24/homebrew-tap as
# Casks/screenforge.rb.
#
#   brew install zot24/tap/screenforge
#
# Signed and notarized macOS DMG and the portable Linux x86_64 tar.gz from the
# mehfuzh/screenforge releases. .github/workflows/screenforge.yml bumps the
# version and both checksums when a new release is published.
cask "screenforge" do
  version "0.1.41"
  sha256 arm:          "253c9c4d24dbfef48fac4b5e2fee1e4c27f00238f05a0ebac70161a327d19671",
         x86_64_linux: "1ad90a4be883ece0333d8d6995a7cee767a937e005b775a9ac15432ec972b304"

  on_macos do
    url "https://github.com/mehfuzh/screenforge/releases/download/v#{version}/ScreenForge-#{version}.dmg"

    depends_on arch: :arm64
    depends_on macos: :sonoma

    app "ScreenForge.app"
  end
  on_linux do
    url "https://github.com/mehfuzh/screenforge/releases/download/v#{version}/ScreenForge-#{version}-linux-x86_64.tar.gz"

    depends_on arch: :x86_64

    binary "ScreenForge/screenforge"

    caveats <<~EOS
      ScreenForge needs glibc 2.39 or newer (Ubuntu 24.04, Debian 13, Fedora 40) and the
      desktop's GTK 3, ALSA, PipeWire and X11 libraries. On Debian or Ubuntu:
        sudo apt install libgtk-3-0t64 libasound2t64 libpipewire-0.3-0t64 libxtst6 libxkbcommon0
    EOS
  end

  name "ScreenForge"
  desc "Screen recorder and timeline editor"
  homepage "https://screenforge.studio/"

  livecheck do
    url :url
    strategy :github_latest
  end
end
