# This file was generated - DO NOT EDIT
class Lotus < Formula
  desc "A homebrew cask for installing the Lotus node from filecoin-project/lotus"
  homepage "https://filecoin.io"
  version "1.34.3"
  license "MIT"

  depends_on "hwloc"

  on_macos do
    on_arm do
      url "https://github.com/filecoin-project/lotus/releases/download/v1.34.3/lotus_v1.34.3_darwin_arm64.tar.gz"
      sha256 "fac5660b395ee1f5f87d3994488a6be69bedcc4902c435a1236645c88c1f513b"

      def install
        bin.install "lotus"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/filecoin-project/lotus/releases/download/v1.34.3/lotus_v1.34.3_linux_amd64_v1.tar.gz"
        sha256 "a92885849836ee3271e8979b72f2d465e4d9ff6142d53146dcdb9b0e6d8e2728"

        def install
          bin.install "lotus"
        end
      end
    end
  end

  test do
    system "#{bin}/lotus --version"
  end
end
