# This file was generated - DO NOT EDIT
class LotusMiner < Formula
  desc "A homebrew cask for installing the Lotus miner from filecoin-project/lotus"
  homepage "https://filecoin.io"
  version "1.34.2"
  license "MIT"

  depends_on "hwloc"

  on_macos do
    on_arm do
      url "https://github.com/filecoin-project/lotus/releases/download/miner/v1.34.2/lotus-miner_v1.34.2_darwin_arm64.tar.gz"
      sha256 "69a31391db5ea82d58bb2298a11d3d72de1e01a13c16984267a6782149e0dca1"

      def install
        bin.install "lotus-miner"
        bin.install "lotus-worker"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/filecoin-project/lotus/releases/download/miner/v1.34.2/lotus-miner_v1.34.2_linux_amd64_v1.tar.gz"
        sha256 "d32c5a81694f7c14f00a5b905caf5ab6858714f67bf36c0d36805dac9b94ff2e"

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
