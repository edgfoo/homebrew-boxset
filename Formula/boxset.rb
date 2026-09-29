class Boxset < Formula
  desc "Prepare video for the web"
  homepage "https://github.com/edgfoo/boxset"
  license any_of: ["MIT", "Apache-2.0"]

  if Hardware::CPU.arm?
    url "https://github.com/edgfoo/boxset/releases/download/v0.3.0/boxset-v0.3.0-aarch64-apple-darwin.tar.gz"
    sha256 "ed82784f50e5d28f6fea40ae95ff4ecad2628090a86393ff8842108ae1066852"
  else
    url "https://github.com/edgfoo/boxset/releases/download/v0.3.0/boxset-v0.3.0-x86_64-apple-darwin.tar.gz"
    sha256 "7c21dae96061a8a99f3fa5ab55c2db61137e1556dcc8e3f1931c5e388ae6b49b"
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
