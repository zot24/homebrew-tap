class Mercator < Formula
  desc "Cartography for your local development landscape"
  homepage "https://github.com/zot24/mercator"
  url "https://github.com/zot24/mercator/archive/refs/tags/v0.7.1.tar.gz"
  sha256 "27b072413528bde3e1dda1cf4c805a5340cbe566f831b02e0c07bbaca5746910"
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
