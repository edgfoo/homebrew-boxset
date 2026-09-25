class Boxset < Formula
  desc "Prepare video for the web"
  homepage "https://github.com/edgfoo/boxset"
  license any_of: ["MIT", "Apache-2.0"]

  if Hardware::CPU.arm?
    url "https://github.com/edgfoo/boxset/releases/download/v0.2.0/boxset-v0.2.0-aarch64-apple-darwin.tar.gz"
    sha256 "f41ca192396e17652ab01ad9ff54680a71e6e81dc4c50b126921bd270a274262"
  else
    url "https://github.com/edgfoo/boxset/releases/download/v0.2.0/boxset-v0.2.0-x86_64-apple-darwin.tar.gz"
    sha256 "56a08c7985d5780b823a245a7b783ad5c86a0234c298f9fd6b9a4665a259688d"
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
