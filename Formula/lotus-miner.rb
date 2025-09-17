# This file was generated - DO NOT EDIT
class LotusMiner < Formula
  desc "A homebrew cask for installing the Lotus miner from filecoin-project/lotus"
  homepage "https://filecoin.io"
  version "1.34.1"
  license "MIT"

  depends_on "hwloc"

  on_macos do
    url "https://github.com/filecoin-project/lotus/releases/download/miner/v1.34.1/lotus-miner_v1.34.1_darwin_all.tar.gz"
    sha256 "da7e9144d4ad6f926e7abf159c6562d34e7de6eee2a645ff69922559537a5bab"

    def install
      bin.install "lotus-miner"
      bin.install "lotus-worker"
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/filecoin-project/lotus/releases/download/miner/v1.34.1/lotus-miner_v1.34.1_linux_amd64_v1.tar.gz"
        sha256 "b2d86b5fd814744d850ba29915776fd22841855aa846de3d3cfaa92e6f47e28b"

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
