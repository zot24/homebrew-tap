# Homebrew cask for ScreenForge — lives in zot24/homebrew-tap as
# Casks/screenforge.rb.
#
#   brew install zot24/tap/screenforge
#
# Signed and notarized macOS DMG and the portable Linux x86_64 tar.gz from the
# mehfuzh/screenforge releases. .github/workflows/screenforge.yml bumps the
# version and both checksums when a new release is published.
cask "screenforge" do
  version "0.1.46"
  sha256 arm:          "e75869abe8e75777b23327732a4f6fd73b84a39293aaf4754f18620e20fc4d36",
         x86_64_linux: "ac005c9051d92cfd7156c0188fa3b65185e7c9f782f6d3414062e82386d4bb8e"

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
