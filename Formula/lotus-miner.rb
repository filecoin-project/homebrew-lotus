# This file was generated - DO NOT EDIT
class LotusMiner < Formula
  desc "A homebrew cask for installing the Lotus miner from filecoin-project/lotus"
  homepage "https://filecoin.io"
  version "1.32.2"
  license "MIT"

  depends_on "hwloc"

  on_macos do
    url "https://github.com/filecoin-project/lotus/releases/download/miner/v1.32.2/lotus-miner_v1.32.2_darwin_all.tar.gz"
    sha256 "3bf326d0a9d4f9fb5d85a823002453346f800858c303544389a36db8f864573c"

    def install
      bin.install "lotus-miner"
      bin.install "lotus-worker"
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/filecoin-project/lotus/releases/download/miner/v1.32.2/lotus-miner_v1.32.2_linux_amd64_v1.tar.gz"
        sha256 "1806022c4731c342940de2ee043a5eac61639462a35e3ef84ffd1ee7fc13d7ef"

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
