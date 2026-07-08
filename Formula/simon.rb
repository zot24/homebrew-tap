class Simon < Formula
  desc "Simple system monitor for humans — processes grouped into apps you recognize"
  homepage "https://github.com/zot24/simon"
  url "https://github.com/zot24/simon/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "ab1c2c14c66c58bc1c04f6056f737f0feb5a9bb207faef2bc5758a9d0c7fc358"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/zot24/simon.git", branch: "main"

  depends_on "rust" => :build

  def install
    # Workspace (virtual manifest): install just the CLI crate. The engine is
    # embedded, so the resulting `simon` runs daemon-free with no extra process.
    system "cargo", "install", *std_cargo_args(path: "crates/simon-cli")
  end

  test do
    assert_match "simon #{version}", shell_output("#{bin}/simon --version")
  end
end
