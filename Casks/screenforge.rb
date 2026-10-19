# Homebrew cask for ScreenForge — lives in zot24/homebrew-tap as
# Casks/screenforge.rb.
#
#   brew install zot24/tap/screenforge
#
# Signed and notarized macOS DMG and the portable Linux x86_64 tar.gz from the
# mehfuzh/screenforge releases. .github/workflows/screenforge.yml bumps the
# version and both checksums when a new release is published.
cask "screenforge" do
  version "0.1.28"
  sha256 arm:          "219c6db47331d29975bf6beb5e4de817f7b53208e716bb3a59c5dbd5852e10e5",
         x86_64_linux: "2cb25677192efe4d3da51a744ac967f18ab7dbc38bb59a88e625215a0cdf1035"

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
