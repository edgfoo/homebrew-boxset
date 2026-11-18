class Boxset < Formula
  desc "Prepare video for the web"
  homepage "https://github.com/edgfoo/boxset"
  license any_of: ["MIT", "Apache-2.0"]

  if Hardware::CPU.arm?
    url "https://github.com/edgfoo/boxset/releases/download/v0.7.0/boxset-v0.7.0-aarch64-apple-darwin.tar.gz"
    sha256 "4b309e322902ff3e36737ce13f833349522e29a11f7758b8953877eef421622b"
  else
    url "https://github.com/edgfoo/boxset/releases/download/v0.7.0/boxset-v0.7.0-x86_64-apple-darwin.tar.gz"
    sha256 "a05536c92d85af7b6c7f7ffe2d178ebb12d07a533b444c43a9ffed70c96e3edd"
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
