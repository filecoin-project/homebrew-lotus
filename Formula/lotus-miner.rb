# This file was generated - DO NOT EDIT
class LotusMiner < Formula
  desc "A homebrew cask for installing the Lotus miner from filecoin-project/lotus"
  homepage "https://filecoin.io"
  version "1.39.1"
  license "MIT"

  depends_on "hwloc"

  on_macos do
    on_arm do
      url "https://github.com/filecoin-project/lotus/releases/download/miner/v1.39.1/lotus-miner_v1.39.1_darwin_arm64.tar.gz"
      sha256 "0d1e8bd249c293ac3f651433d90784cdcf00f9fa9df8a33ab3b1da9095067966"

      def install
        bin.install "lotus-miner"
        bin.install "lotus-worker"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/filecoin-project/lotus/releases/download/miner/v1.39.1/lotus-miner_v1.39.1_linux_amd64_v1.tar.gz"
        sha256 "9fe729e7940af9df5e3ac30b1e6c15994708bb7a434b420b86ec77cafaef16b9"

        def install
          bin.install "lotus-miner"
          bin.install "lotus-worker"
        end
      end
    end
  end

  test do
    system "#{bin}/lotus-miner --version"
    system "#{bin}/lotus-worker --version"
  end
end
