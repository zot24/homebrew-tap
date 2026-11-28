# Homebrew cask for ScreenForge — lives in zot24/homebrew-tap as
# Casks/screenforge.rb.
#
#   brew install zot24/tap/screenforge
#
# Signed and notarized macOS DMG and the portable Linux x86_64 tar.gz, published
# at https://dl.screenforge.studio. .github/workflows/screenforge.yml reads
# https://screenforge.studio/changelog/feed.xml every six hours and bumps this
# cask when the feed lists a newer version.
cask "screenforge" do
  version "0.1.70"
  sha256 arm:          "baac4f2f7b8072d61f6b276d1ec51de9daf20ba3983acebc1ed2946bcd67a7c1",
         x86_64_linux: "996f5d695569f1da0c1dd04f9352ae2d8858d181dd3239ff17039b97eb1695ce"

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

    # Printed only when this machine lacks something the binaries load. When
    # ldd or ldconfig cannot be read, every requirement is listed.
    caveats do
      packages = {
        "libgtk-3.so.0"        => "libgtk-3-0t64",
        "libasound.so.2"       => "libasound2t64",
        "libpipewire-0.3.so.0" => "libpipewire-0.3-0t64",
        "libXtst.so.6"         => "libxtst6",
        "libxkbcommon.so.0"    => "libxkbcommon0",
      }
      glibc = ::Utils.popen_read("/usr/bin/ldd", "--version")[/ (\d+\.\d+)/, 1] if File.executable?("/usr/bin/ldd")
      cache = File.executable?("/sbin/ldconfig") ? ::Utils.popen_read("/sbin/ldconfig", "-p") : ""
      cache = cache.scan(/^\s*(\S+) \(/).flatten
      missing = packages.except(*cache)
      old_glibc = glibc.nil? || Version.new(glibc) < "2.39"

      lines = []
      if old_glibc
        found = glibc ? "; this system has #{glibc}, so it will not start" : ""
        lines << "ScreenForge needs glibc 2.39 or newer (Ubuntu 24.04, Debian 13, Fedora 40)#{found}."
      end
      if missing.any?
        lines << if cache.empty?
          "ScreenForge needs the desktop's GTK 3, ALSA, PipeWire and X11 libraries."
        else
          "ScreenForge cannot find #{missing.keys.join(", ")}."
        end
        lines << "On Debian or Ubuntu:"
        lines << "  sudo apt install #{missing.values.join(" ")}"
      end
      lines.join("\n") if lines.any?
    end
  end

  name "ScreenForge"
  desc "Screen recorder and timeline editor"
  homepage "https://screenforge.studio/"

  livecheck do
    url "https://screenforge.studio/changelog/feed.xml"
    regex(%r{<title>\s*ScreenForge v?(\d+(?:\.\d+)+)\s*</title>}i)
  end
end
