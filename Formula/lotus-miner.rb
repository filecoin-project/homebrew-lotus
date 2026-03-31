# This file was generated - DO NOT EDIT
class LotusMiner < Formula
  desc "A homebrew cask for installing the Lotus miner from filecoin-project/lotus"
  homepage "https://filecoin.io"
  version "1.35.1"
  license "MIT"

  depends_on "hwloc"

  on_macos do
    on_arm do
      url "https://github.com/filecoin-project/lotus/releases/download/miner/v1.35.1/lotus-miner_v1.35.1_darwin_arm64.tar.gz"
      sha256 "86e7698267e54de6fead2f1c25cfb12b1f3103c838f499f83d7bcb5cedc56a1a"

      def install
        bin.install "lotus-miner"
        bin.install "lotus-worker"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/filecoin-project/lotus/releases/download/miner/v1.35.1/lotus-miner_v1.35.1_linux_amd64_v1.tar.gz"
        sha256 "e834744aa33210fff56142253e1e8ef33efbcd15f18b983c37c069ea642f1d0c"

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
