class Mercator < Formula
  desc "Cartography for your local development landscape"
  homepage "https://github.com/zot24/mercator"
  url "https://github.com/zot24/mercator/archive/refs/tags/v0.7.0.tar.gz"
  sha256 "d968b38fdad561e131a17b24b8fdfd95b605647d0ba3dd822df7871799d33eb4"
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
