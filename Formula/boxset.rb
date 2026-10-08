class Boxset < Formula
  desc "Prepare video for the web"
  homepage "https://github.com/edgfoo/boxset"
  license any_of: ["MIT", "Apache-2.0"]

  if Hardware::CPU.arm?
    url "https://github.com/edgfoo/boxset/releases/download/v0.6.0/boxset-v0.6.0-aarch64-apple-darwin.tar.gz"
    sha256 "a3ec4fa4a17fcba645d712a471e661b1af93e707960f1b3a0b14fd6640b57b77"
  else
    url "https://github.com/edgfoo/boxset/releases/download/v0.6.0/boxset-v0.6.0-x86_64-apple-darwin.tar.gz"
    sha256 "01a1bb5a9625ca2fa1ce7c6463c63374def39f6738f8d95f148ad391379a4450"
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
