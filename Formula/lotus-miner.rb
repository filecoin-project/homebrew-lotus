# This file was generated - DO NOT EDIT
class LotusMiner < Formula
  desc "A homebrew cask for installing the Lotus miner from filecoin-project/lotus"
  homepage "https://filecoin.io"
  version "1.36.1"
  license "MIT"

  depends_on "hwloc"

  on_macos do
    on_arm do
      url "https://github.com/filecoin-project/lotus/releases/download/miner/v1.36.1/lotus-miner_v1.36.1_darwin_arm64.tar.gz"
      sha256 "5f0e9c336307696c052158c2caac6891ddd3d611043ddcad4ea430a6c5b928c5"

      def install
        bin.install "lotus-miner"
        bin.install "lotus-worker"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/filecoin-project/lotus/releases/download/miner/v1.36.1/lotus-miner_v1.36.1_linux_amd64_v1.tar.gz"
        sha256 "8eb3f49ae5d3266030c748ff116727de9faf6669e3f4f8ac13447666c91a6ff6"

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
