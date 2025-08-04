# This file was generated - DO NOT EDIT
class LotusMiner < Formula
  desc "A homebrew cask for installing the Lotus miner from filecoin-project/lotus"
  homepage "https://filecoin.io"
  version "1.33.1"
  license "MIT"

  depends_on "hwloc"

  on_macos do
    url "https://github.com/filecoin-project/lotus/releases/download/miner/v1.33.1/lotus-miner_v1.33.1_darwin_all.tar.gz"
    sha256 "1f9f76945793cd72db073b2e0bc57cd18f1fa69987ea5919677efdde0d072763"

    def install
      bin.install "lotus-miner"
      bin.install "lotus-worker"
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/filecoin-project/lotus/releases/download/miner/v1.33.1/lotus-miner_v1.33.1_linux_amd64_v1.tar.gz"
        sha256 "2e334f22919c94f4a35e98ba0bba529460cb7a9ee7c7d8774790a4f93091f20f"

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
