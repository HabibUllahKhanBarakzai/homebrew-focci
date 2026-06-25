class Focci < Formula
  desc "Refocus your terminal/editor when an AI coding agent needs your attention"
  homepage "https://github.com/HabibUllahKhanBarakzai/focci"
  url "https://github.com/HabibUllahKhanBarakzai/focci/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "4baa5618646575fdf38a1d66d227adea0d08c635c4d3fa2934b504aa67ecb02e"
  license "Apache-2.0"
  head "https://github.com/HabibUllahKhanBarakzai/focci.git", branch: "main"

  depends_on "go" => :build
  depends_on :macos

  def install
    ldflags = "-s -w -X github.com/HabibUllahKhanBarakzai/focci/cmd.version=#{version}"
    system "go", "build", *std_go_args(ldflags:, output: bin/"focci"), "."
  end

  test do
    assert_match "focci #{version}", shell_output("#{bin}/focci doctor")
  end
end
