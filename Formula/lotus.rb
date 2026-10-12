# This file was generated - DO NOT EDIT
class Lotus < Formula
  desc "A homebrew cask for installing the Lotus node from filecoin-project/lotus"
  homepage "https://filecoin.io"
  version "1.38.0"
  license "MIT"

  depends_on "hwloc"

  on_macos do
    on_arm do
      url "https://github.com/filecoin-project/lotus/releases/download/v1.38.0/lotus_v1.38.0_darwin_arm64.tar.gz"
      sha256 "acfc6ddd81c567b28390215b2a682850836c7cce2598cfb33e09d7e5266251d9"

      def install
        bin.install "lotus"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/filecoin-project/lotus/releases/download/v1.38.0/lotus_v1.38.0_linux_amd64_v1.tar.gz"
        sha256 "83412d5b1ae6b6524a9539c8ae851cdc1d7e9da691b3aa1549e56fa744bebfab"

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
