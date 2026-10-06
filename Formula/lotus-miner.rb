# This file was generated - DO NOT EDIT
class LotusMiner < Formula
  desc "A homebrew cask for installing the Lotus miner from filecoin-project/lotus"
  homepage "https://filecoin.io"
  version "1.37.0"
  license "MIT"

  depends_on "hwloc"

  on_macos do
    on_arm do
      url "https://github.com/filecoin-project/lotus/releases/download/miner/v1.37.0/lotus-miner_v1.37.0_darwin_arm64.tar.gz"
      sha256 "cb667b02791854212fd42a07008d198a9c77019be2916ad8b87f13a2a237c717"

      def install
        bin.install "lotus-miner"
        bin.install "lotus-worker"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/filecoin-project/lotus/releases/download/miner/v1.37.0/lotus-miner_v1.37.0_linux_amd64_v1.tar.gz"
        sha256 "7dec0ba4c1b77c0a081d84b60fb7097c87ad95ef741d31f30d4f9c48685551a2"

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
