# Homebrew cask for ScreenForge — lives in zot24/homebrew-tap as
# Casks/screenforge.rb.
#
#   brew install zot24/tap/screenforge
#
# Signed and notarized macOS DMG and the portable Linux x86_64 tar.gz from the
# mehfuzh/screenforge releases. .github/workflows/screenforge.yml bumps the
# version and both checksums when a new release is published.
cask "screenforge" do
  version "0.1.49"
  sha256 arm:          "8b877982d7161ce3d57b89a8aa9e49ad87b95807996e20769d5dd792e19c992e",
         x86_64_linux: "12bd81d7029fbffc12f0346d2dd08b3bb092ca5846a64c1ab85a62d5261b2e29"

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
