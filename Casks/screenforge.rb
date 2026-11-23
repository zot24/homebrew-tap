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
  version "0.1.65"
  sha256 arm:          "2a6e45514f752301b9b761054b8e4c112c4a9cffb4ac36acba17d951528eedfe",
         x86_64_linux: "1eafd9eff53394de8cb5fcf8dbd6aad48e31338dda8b2f688260f138a84b5852"

  on_macos do
    url "https://dl.screenforge.studio/v#{version}/ScreenForge-#{version}.dmg"

    depends_on arch: :arm64
    depends_on macos: :sonoma

    app "ScreenForge.app"
  end
  on_linux do
    url "https://dl.screenforge.studio/v#{version}/ScreenForge-#{version}-linux-x86_64.tar.gz"

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
    url "https://dl.screenforge.studio/latest.json"
    strategy :json do |json|
      json["tag_name"]&.delete_prefix("v")
    end
  end
end
