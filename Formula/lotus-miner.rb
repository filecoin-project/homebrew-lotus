# This file was generated - DO NOT EDIT
class LotusMiner < Formula
  desc "A homebrew cask for installing the Lotus miner from filecoin-project/lotus"
  homepage "https://filecoin.io"
  version "1.32.1"
  license "MIT"

  depends_on "hwloc"

  on_macos do
    url "https://github.com/filecoin-project/lotus/releases/download/miner/v1.32.1/lotus-miner_v1.32.1_darwin_all.tar.gz"
    sha256 "f1aa400ac5328264a72799438c1941b6a1cc28b1d5b876b1084130072d850f3a"

    def install
      bin.install "lotus-miner"
      bin.install "lotus-worker"
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/filecoin-project/lotus/releases/download/miner/v1.32.1/lotus-miner_v1.32.1_linux_amd64_v1.tar.gz"
        sha256 "156625610bd1f321d2595430644af2a9c0f16a3e8771d6c36b7bfcbe8d3f7b99"

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
