# This file was generated - DO NOT EDIT
class LotusMiner < Formula
  desc "A homebrew cask for installing the Lotus miner from filecoin-project/lotus"
  homepage "https://filecoin.io"
  version "1.36.0"
  license "MIT"

  depends_on "hwloc"

  on_macos do
    on_arm do
      url "https://github.com/filecoin-project/lotus/releases/download/miner/v1.36.0/lotus-miner_v1.36.0_darwin_arm64.tar.gz"
      sha256 "41007565bfe2f7b9b11ffbfe747d4cf662c50e6cbb5d98ff601f1f8b0238b262"

      def install
        bin.install "lotus-miner"
        bin.install "lotus-worker"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/filecoin-project/lotus/releases/download/miner/v1.36.0/lotus-miner_v1.36.0_linux_amd64_v1.tar.gz"
        sha256 "53b15191f11d662f4092639fb759134874a62175b6826e0533f2ec7f4667db4d"

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
