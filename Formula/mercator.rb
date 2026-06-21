class Mercator < Formula
  desc "Cartography for your local development landscape"
  homepage "https://github.com/zot24/mercator"
  url "https://github.com/zot24/mercator/archive/refs/tags/v0.7.4.tar.gz"
  sha256 "81bbdd03afb26f8a2b37325054f7511f9f0a187438451994283ffaa9a645195e"
  license "MIT"
  head "https://github.com/zot24/mercator.git", branch: "master"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "mercator", shell_output("#{bin}/mercator --version")
  end
end
