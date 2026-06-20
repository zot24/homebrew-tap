class Mercator < Formula
  desc "Cartography for your local development landscape"
  homepage "https://github.com/zot24/mercator"
  url "https://github.com/zot24/mercator/archive/refs/tags/v0.5.1.tar.gz"
  sha256 "664531fbd330a4865a2f390c503f2e12515cd3cddb633ccc0d37501371285d79"
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
