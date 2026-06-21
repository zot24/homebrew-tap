class Mercator < Formula
  desc "Cartography for your local development landscape"
  homepage "https://github.com/zot24/mercator"
  url "https://github.com/zot24/mercator/archive/refs/tags/v0.7.2.tar.gz"
  sha256 "838032268411311bc634706e9a647e11bc6d995a1ec0998194d6246dab8c2e5d"
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
