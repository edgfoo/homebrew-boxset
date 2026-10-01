class Boxset < Formula
  desc "Prepare video for the web"
  homepage "https://github.com/edgfoo/boxset"
  license any_of: ["MIT", "Apache-2.0"]

  if Hardware::CPU.arm?
    url "https://github.com/edgfoo/boxset/releases/download/v0.5.0/boxset-v0.5.0-aarch64-apple-darwin.tar.gz"
    sha256 "5bde8c284fadef62f21d0d3a1d25a668597b2753aa3f1fabd3b8869e484efb35"
  else
    url "https://github.com/edgfoo/boxset/releases/download/v0.5.0/boxset-v0.5.0-x86_64-apple-darwin.tar.gz"
    sha256 "fed25c0d858dfd1f2bcf5e2252fb939c3ee660e628b4aeb0da7aa97b55104a96"
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
