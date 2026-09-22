class Boxset < Formula
  desc "Prepare video for the web"
  homepage "https://github.com/edgfoo/boxset"
  license any_of: ["MIT", "Apache-2.0"]

  if Hardware::CPU.arm?
    url "https://github.com/edgfoo/boxset/releases/download/v0.1.0/boxset-v0.1.0-aarch64-apple-darwin.tar.gz"
    sha256 "7f3621a3fe536a360365837a71967d7265541eb5cd3e83266b91d5348c0bed11"
  else
    url "https://github.com/edgfoo/boxset/releases/download/v0.1.0/boxset-v0.1.0-x86_64-apple-darwin.tar.gz"
    sha256 "e9da263dd902853cec9e71c3b201673b6ca54770ea85329f4d734323434258eb"
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
