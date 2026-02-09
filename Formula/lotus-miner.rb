# This file was generated - DO NOT EDIT
class LotusMiner < Formula
  desc "A homebrew cask for installing the Lotus miner from filecoin-project/lotus"
  homepage "https://filecoin.io"
  version "1.34.4"
  license "MIT"

  depends_on "hwloc"

  on_macos do
    on_arm do
      url "https://github.com/filecoin-project/lotus/releases/download/miner/v1.34.4/lotus-miner_v1.34.4_darwin_arm64.tar.gz"
      sha256 "a5a9de0186d5c718f7ebb91b9486c343a1c5ee18f12421152f3152e66ef985da"

      def install
        bin.install "lotus-miner"
        bin.install "lotus-worker"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/filecoin-project/lotus/releases/download/miner/v1.34.4/lotus-miner_v1.34.4_linux_amd64_v1.tar.gz"
        sha256 "63054c7eae9cc1d588d27819fefdb0a3fbeee552581d8c0e511330862fddacc4"

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
