class Focci < Formula
  desc "Refocus your terminal/editor when an AI coding agent needs your attention"
  homepage "https://github.com/HabibUllahKhanBarakzai/focci"
  url "https://github.com/HabibUllahKhanBarakzai/focci/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "35f1e2fe4c9149c74fe5713a66476fc504d26422a60b68949e445b26876dd22f"
  license "Apache-2.0"
  head "https://github.com/HabibUllahKhanBarakzai/focci.git", branch: "main"

  depends_on "rust" => :build
  depends_on :macos

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "focci #{version}", shell_output("#{bin}/focci doctor")
  end
end
