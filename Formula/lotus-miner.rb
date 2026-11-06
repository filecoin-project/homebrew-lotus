# This file was generated - DO NOT EDIT
class LotusMiner < Formula
  desc "A homebrew cask for installing the Lotus miner from filecoin-project/lotus"
  homepage "https://filecoin.io"
  version "1.39.0"
  license "MIT"

  depends_on "hwloc"

  on_macos do
    on_arm do
      url "https://github.com/filecoin-project/lotus/releases/download/miner/v1.39.0/lotus-miner_v1.39.0_darwin_arm64.tar.gz"
      sha256 "8b40a228234d6a491b0c07fee500978822263c88036683fd23b4df6e6a3320b9"

      def install
        bin.install "lotus-miner"
        bin.install "lotus-worker"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/filecoin-project/lotus/releases/download/miner/v1.39.0/lotus-miner_v1.39.0_linux_amd64_v1.tar.gz"
        sha256 "57620387fb7a63b78ef74b86d50d10334fb9536a39a6fe41500137f15296150d"

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
