# This file was generated - DO NOT EDIT
class Lotus < Formula
  desc "A homebrew cask for installing the Lotus node from filecoin-project/lotus"
  homepage "https://filecoin.io"
  version "1.37.0"
  license "MIT"

  depends_on "hwloc"

  on_macos do
    on_arm do
      url "https://github.com/filecoin-project/lotus/releases/download/v1.37.0/lotus_v1.37.0_darwin_arm64.tar.gz"
      sha256 "280a75115b2dfe01cf5ba00af633e0ca46a88b7c2e5656d7564867e2f1b4ce5b"

      def install
        bin.install "lotus"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/filecoin-project/lotus/releases/download/v1.37.0/lotus_v1.37.0_linux_amd64_v1.tar.gz"
        sha256 "03b72418c70b0e731784535089717d8a168795e06b216d8e594d3987ebfc4780"

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
