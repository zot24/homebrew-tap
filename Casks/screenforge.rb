# Homebrew cask for ScreenForge — lives in zot24/homebrew-tap as
# Casks/screenforge.rb.
#
#   brew install zot24/tap/screenforge
#
# Signed and notarized macOS DMG and the portable Linux x86_64 tar.gz, published
# at https://dl.screenforge.studio. The ScreenForge release workflow bumps this
# cask when a build is uploaded. .github/workflows/screenforge.yml reads
# latest.json and applies the same bump if that push did not land.
cask "screenforge" do
  version "0.1.66"
  sha256 arm:          "ade47f0df4a05f55c7229e4dc8a42bf57cfec9a21bcf555900e9f068e993f29c",
         x86_64_linux: "0f8216617600171f0113a0179c90198b30a5bf8f88e174db3c4c37bb0800770a"

  on_macos do
    url "https://dl.screenforge.studio/v#{version}/ScreenForge-#{version}.dmg"

    depends_on arch: :arm64
    depends_on macos: :sonoma

    app "ScreenForge.app"
    binary "#{appdir}/ScreenForge.app/Contents/MacOS/sf", target: "screenforge-cli"
  end
  on_linux do
    url "https://dl.screenforge.studio/v#{version}/ScreenForge-#{version}-linux-x86_64.tar.gz"

    depends_on arch: :x86_64

    binary "ScreenForge/screenforge"
    binary "ScreenForge/sf", target: "screenforge-cli"

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
    url "https://dl.screenforge.studio/latest.json"
    strategy :json do |json|
      json["tag_name"]&.delete_prefix("v")
    end
  end
end
