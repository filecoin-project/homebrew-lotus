# This file was generated - DO NOT EDIT
class LotusMiner < Formula
  desc "A homebrew cask for installing the Lotus miner from filecoin-project/lotus"
  homepage "https://filecoin.io"
  version "1.32.3"
  license "MIT"

  depends_on "hwloc"

  on_macos do
    url "https://github.com/filecoin-project/lotus/releases/download/miner/v1.32.3/lotus-miner_v1.32.3_darwin_all.tar.gz"
    sha256 "96c291123e86377db632453b6851dc16c2f614491b2eb111c58b6397786f79e7"

    def install
      bin.install "lotus-miner"
      bin.install "lotus-worker"
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/filecoin-project/lotus/releases/download/miner/v1.32.3/lotus-miner_v1.32.3_linux_amd64_v1.tar.gz"
        sha256 "0d3cbbb11611d2231ceb41a8cf3542860850a061900c3c673c030818d53e4737"

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
