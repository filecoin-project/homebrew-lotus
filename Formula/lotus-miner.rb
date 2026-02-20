# This file was generated - DO NOT EDIT
class LotusMiner < Formula
  desc "A homebrew cask for installing the Lotus miner from filecoin-project/lotus"
  homepage "https://filecoin.io"
  version "1.35.0"
  license "MIT"

  depends_on "hwloc"

  on_macos do
    on_arm do
      url "https://github.com/filecoin-project/lotus/releases/download/miner/v1.35.0/lotus-miner_v1.35.0_darwin_arm64.tar.gz"
      sha256 "45601673abf63dbfd4c34562c1a770e1eab71db2e1c8707ac4853fa45b05a2e2"

      def install
        bin.install "lotus-miner"
        bin.install "lotus-worker"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/filecoin-project/lotus/releases/download/miner/v1.35.0/lotus-miner_v1.35.0_linux_amd64_v1.tar.gz"
        sha256 "48b4594b8449a1e9b5ce6ac166f70f82b2f8d0f823d3cbe148a177b8832cf4f6"

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
