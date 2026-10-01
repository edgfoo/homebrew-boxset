class Boxset < Formula
  desc "Prepare video for the web"
  homepage "https://github.com/edgfoo/boxset"
  license any_of: ["MIT", "Apache-2.0"]

  if Hardware::CPU.arm?
    url "https://github.com/edgfoo/boxset/releases/download/v0.4.0/boxset-v0.4.0-aarch64-apple-darwin.tar.gz"
    sha256 "471396e026f47a932ef45268190d99308e467ce1bd239d4ea640fe7fda08443c"
  else
    url "https://github.com/edgfoo/boxset/releases/download/v0.4.0/boxset-v0.4.0-x86_64-apple-darwin.tar.gz"
    sha256 "13f755ec7c847afc4513e1127c25869d80679365c3bdec44ef9e1e58394b4c05"
  end

  # boxset needs ffmpeg >= 7.0, enforced at runtime against MIN_FFMPEG_VERSION
  # in src/command.rs. Homebrew has no minimum-version syntax.
  depends_on "ffmpeg"
  depends_on :macos

  def install
    bin.install "boxset"
  end

  test do
    assert_match "boxset #{version}", shell_output("#{bin}/boxset --version")
  end
end
