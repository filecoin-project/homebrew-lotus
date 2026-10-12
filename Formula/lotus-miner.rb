# This file was generated - DO NOT EDIT
class LotusMiner < Formula
  desc "A homebrew cask for installing the Lotus miner from filecoin-project/lotus"
  homepage "https://filecoin.io"
  version "1.38.0"
  license "MIT"

  depends_on "hwloc"

  on_macos do
    on_arm do
      url "https://github.com/filecoin-project/lotus/releases/download/miner/v1.38.0/lotus-miner_v1.38.0_darwin_arm64.tar.gz"
      sha256 "ba8c171f3c485b7047af2a270eb47b6654cf6b7f43700f46f5fd6c0f897a3af2"

      def install
        bin.install "lotus-miner"
        bin.install "lotus-worker"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/filecoin-project/lotus/releases/download/miner/v1.38.0/lotus-miner_v1.38.0_linux_amd64_v1.tar.gz"
        sha256 "63e9518596fedc89ef234ff8e8baffc7a391bbf804adb1a513e144103daa58cf"

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
