# This file was generated - DO NOT EDIT
class LotusMiner < Formula
  desc "A homebrew cask for installing the Lotus miner from filecoin-project/lotus"
  homepage "https://filecoin.io"
  version "1.38.3"
  license "MIT"

  depends_on "hwloc"

  on_macos do
    on_arm do
      url "https://github.com/filecoin-project/lotus/releases/download/miner/v1.38.3/lotus-miner_v1.38.3_darwin_arm64.tar.gz"
      sha256 "828ed3982a283dbb0ac2e456807a238908e364c8deb32b6b333a371cdcf76ab5"

      def install
        bin.install "lotus-miner"
        bin.install "lotus-worker"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/filecoin-project/lotus/releases/download/miner/v1.38.3/lotus-miner_v1.38.3_linux_amd64_v1.tar.gz"
        sha256 "7b90727c9d5329adf26457d86351cb3517da4aad811d0d53fcf2370ad59fbd52"

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
